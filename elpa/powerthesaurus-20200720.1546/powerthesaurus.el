;;; powerthesaurus.el --- Powerthesaurus integration -*- lexical-binding: t; -*-

;; Copyright (c) 2018 Valeriy Savchenko (GNU/GPL Licence)

;; Authors: Valeriy Savchenko <sinmipt@gmail.com>
;; URL: http://github.com/SavchenkoValeriy/emacs-powerthesaurus
;; Package-Version: 20200720.1546
;; Package-Commit: 93036d3b111925ebc34f747ff846cb0b8669b92e
;; Version: 0.1.0
;; Package-Requires: ((emacs "24") (request "0.3.0") (s "1.12.0") (jeison "1.0.0"))
;; Keywords: convenience, writing

;; This file is NOT part of GNU Emacs.

;; powerthesaurus.el is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; powerthesaurus.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with powerthesaurus.el.
;; If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; This package is an integration with powerthesaurus.org.
;;; It helps to look up a word in powerthesaurus and either replace or
;;; insert selected option in the buffer (depending on the current selection).

;;; Code:
(require 'dom)
(require 'json)
(require 'request)
(require 'rx)
(require 's)
(require 'jeison)

;;;###autoload
(defun powerthesaurus-lookup-word-dwim ()
  "Wrapper function for powerthesaurus-lookup-word commands.

If a region is selected use powerthesaurus-lookup-word
if a thing at point is not empty use powerthesaurus-lookup-word-at-point
otherwise as for word using powerthesaurus-lookup-word"
  (interactive)
  (let (beg end bounds)
    ;; selection is active -> look up whatever is selected
    (if (use-region-p)
        (progn
          (setq beg (region-beginning))
          (setq end (region-end))
          (powerthesaurus-lookup-word beg end))
      ;; point is is at a word -> look it up
      (if (thing-at-point 'word)
          (powerthesaurus-lookup-word-at-point (point))
        ;; nothing appropriate nearby -> ask the user
        (powerthesaurus-lookup-word)))))

;;;###autoload
(defun powerthesaurus-lookup-word-at-point (word-point)
  "Find word at `WORD-POINT', look it up in powerthesaurs, and replace it."
  (interactive (list (point)))
  (save-mark-and-excursion
    (unless (powerthesaurus-is-at-the-beginning-of-word word-point)
      (backward-word))
    (set-mark (point))
    (forward-word)
    (activate-mark)
    (powerthesaurus-lookup-word (region-beginning) (region-end))))

(defun powerthesaurus-is-at-the-beginning-of-word (word-point)
  "Predicate to check whether `WORD-POINT' points to the beginning of the word."
  (save-excursion
    ;; If we are at the beginning of a word
    ;; this will take us to the beginning of the previous word.
    ;; Otherwise, this will take us to the beginning of the current word.
    (backward-word)
    ;; This will take us to the end of the previous word or to the end
    ;; of the current word depending on whether we were at the beginning
    ;; of a word.
    (forward-word)
    ;; Compare our original position with wherever we're now to
    ;; separate those two cases
    (< (point) word-point)))

;;;###autoload
(defun powerthesaurus-lookup-word (&optional beginning end)
  "Find the given word's synonyms at powerthesaurus.org.

`BEGINNING' and `END' correspond to the selected text with a word to replace.
If there is no selection provided, additional input will be required.
In this case, a selected synonym will be inserted at the point."
  (interactive
   ;; it is a simple interactive function instead of interactive "r"
   ;; because it doesn't produce an error in a buffer without a mark
   (if (use-region-p) (list (region-beginning) (region-end))
     (list nil nil)))
  (let* ((word (powerthesaurus-get-original-word beginning end))
         (callback (powerthesaurus-choose-callback beginning end)))
    (request
      (powerthesaurus-compose-url word)
      :parser (lambda () (libxml-parse-html-region (point) (point-max)))
      :headers '(("User-Agent" . "Chrome/74.0.3729.169")
                 ("Accept" . "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
                 ("Accept-Encoding" . "gzip, deflate, br")
                 ("Accept-Language" . "en,en-US;q=0.5")
                 ("Upgrade-Insecure-Requests" . "1"))
      :success (cl-function (lambda (&key data &allow-other-keys)
                              ;; in order to allow users to quit powerthesaurus
                              ;; prompt with C-g, we need to wrap callback with this
                              (with-local-quit
                                (funcall callback
                                         (powerthesaurus-pick-synonym data)
                                         word)))))))

(defun powerthesaurus-compose-url (word)
  "Compose a powerthesaurus url to request `WORD'."
  (format "https://www.powerthesaurus.org/%s/synonyms" word))

(defun powerthesaurus-get-original-word (beginning end)
  "Get a word to look for from the user.

`BEGINNING' and `END' correspond to the selected text (if selected).
If presented, the selected text will be used.
Otherwise, user must provide additional information."
  (if (use-region-p)
      (buffer-substring-no-properties beginning end)
    (read-string "Word to fetch: ")))

(defun powerthesaurus-choose-callback (beginning end)
  "Choose a callback depending on the selection.

`BEGINNING' and `END' represent provided(or not) selection."
  (if (use-region-p)
      (lambda (new original)
        (powerthesaurus-replace-with new beginning end original))
    #'powerthesaurus-insert-word))

(defun powerthesaurus-replace-with (synonym beginning end original-word)
  "Parse `RAW-DATA', pick a synonym, and replace the selected text.

`BEGINNING' and `END' correspond to the selected text.
`ORIGINAL-WORD' represents the original word that is being replaced."
  (delete-region beginning end)
  (powerthesaurus-insert-word synonym original-word))

(defun powerthesaurus-adjust-cases (new original)
  "Adjust cases of the `NEW' word based on the `ORIGINAL' word.

For now, it supports upcase and capitalize."
  (cond ((s-uppercase-p original) (upcase new))
        ((s-capitalized-p original) (capitalize new))
        (t new)))

(defun powerthesaurus-insert-word (synonym original-word)
  "Parse `RAW-DATA', pick a synonym, and insert at the point.

`ORIGINAL-WORD' represents the original word that we searched synonym for."
  (insert (powerthesaurus-adjust-cases synonym original-word)))

(defun powerthesaurus-pick-synonym (raw-data)
  "Parse `RAW-DATA' from powerthesaurus and let the user to choose a word."
  (let* ((synonyms-full (powerthesaurus-parse-response raw-data))
         (synonyms (powerthesaurus-compose-choices synonyms-full))
         ;; this is the only way we can keep the order while using
         ;; the default implementation of completing-read function
         ;; see: https://emacs.stackexchange.com/a/41808/23751
         (completion-table
          (lambda (string pred action)
            (if (eq action 'metadata)
                '(metadata (display-sort-function . identity)
                           (cycle-sort-function . identity))
              (complete-with-action
               action synonyms string pred))))
         ;; ivy still will try to sort it lexicographically: deny it
         (ivy-sort-functions-alist nil))
    (completing-read "Choose a synonym: " completion-table nil nil)))

(defun powerthesaurus-compose-choices (synonyms)
  "Compose choices from the `powerthesaurus-word' list of `SYNONYMS'."
  (mapcar (lambda (word) (powerthesaurus-word-text word))
          (sort synonyms (lambda (x y) (< (powerthesaurus-word-rating x)
                                          (powerthesaurus-word-rating y))))))

(defun powerthesaurus-get-rating (word)
  "Get a numeric user rating of the given `WORD'."
  ;; TODO: get rid of it when jeison supports functional
  ;; components of the path
  (string-to-number (oref word rating)))

(jeison-defclass powerthesaurus-word nil
                 ((text :initarg :text :type string :path term
                        :documentation "Actual text of the word from Powerthesaurus")
                  (rating :initarg :rating
                          :documentation "User rating of the word")))

(cl-defstruct (powerthesaurus-word) text rating)

(defun powerthesaurus-parse-response (data)
  "Get the list of synonyms out of the raw `DATA' from request."
  (let* ((synonyms (powerthesaurus-retrieve-synonyms data)))
    synonyms))

(defun powerthesaurus-get-all-texts (nodes)
  "Get text information from all provided `NODES'."
  (mapcar #'dom-text nodes))

(defun powerthesaurus-find-store-json (scripts)
  "Find and parse the store JSON out of all `SCRIPTS' nodes."
  (let* ((matches (mapcar #'powerthesaurus-match-store scripts))
         (match (powerthesaurus-find-good-match matches)))
    (powerthesaurus-get-json match)))

(defun powerthesaurus-match-store (script-text)
  "Find store JSON in `SCRIPT-TEXT'."
  (s-match-strings-all
   (rx bol
       (zero-or-more space)
       ;; "var store = "
       "window.__STATE__ = "
       (group (* (not (any ";"))))
       )
   script-text))

(defun powerthesaurus-find-good-match (matches)
  "Filter all `MATCHES' to find the one to parse synonyms from."
  (let ((match (seq-find #'identity matches nil)))
    (if match
        match
      (error "Couldn't find anything"))))

(defun powerthesaurus-get-json (match)
  "Parse `MATCH' json into an alist."
  (json-read-from-string (nth 1 (car match))))

(defun powerthesaurus-retrieve-synonyms (raw-data)
  "Get synonyms list from DOM."
  (let* ((ls
          (dom-children (nth 1 (dom-children (dom-by-tag raw-data 'main)))))
         (synonyms
          (mapcar (lambda (x) (dom-texts (dom-by-tag x 'a))) ls))
         (words (cl-loop for elt in synonyms and n from 0 by 1
                         collect (make-powerthesaurus-word :text elt
                                                           :rating n))))
    words))

(defun powerthesaurus-debug-connection ()
  "Debug requests to powerthesaurus.org."
  (setq request-log-level `debug)
  (setq request-message-level `debug))

(defun powerthesaurus-undebug-connection ()
  "Switch off debug information for requests."
  (setq request-log-level -1)
  (setq request-message-level -1))

(provide 'powerthesaurus)
;;; powerthesaurus.el ends here
