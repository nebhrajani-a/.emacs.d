;; Copyright (c) 1996 Steve Allen, Clay Hill Engineering

;; This is free software; you can redistribute it and/or modify
;; it as you see fit, so long as you make the changes available for
;; public use.
;;
;; This is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
;;
;; Jan 3, 1996: Steve Allen, Jan 1996
;;                   allen@ultranet.com or
;;                   allen@cachelink.com
;;
;;
;; Copyright Steve Allen, Clay Hill Engineering, 1996.
;;
;; quick verilog mode that I can understand and modify
;; Each lines indentation is based on the previous lines indentations,
;;   except for begin/end pairs (case/endcase, function/endfunction,etc)
;;   which search back to find match and goes from there
;;
;; bugs/features:
;;   1) requires a somewhat rigid programming style (if you use
;;              the paragraph/batch formatting feature)
;;   2) doesn't really allow this (some people like it, I don't)
;;          if ()
;;             begin
;;                blah,blah,blah
;;             end
;;
;; To do:
;;   1) line continuations - can't do `em now without screwing up auto formatting
;;   2) insert more block types
;; ********************************************************************************
;; copy this code to .emacs file, and uncomment it
;;; (load "verilog-mode")
;;; (autoload 'verilog-mode "verilog-mode" nil t)
;;; (setq auto-mode-alist (append (list (cons "\\.v$" 'verilog-mode)
;;;                                 (cons "\\.vh$" 'verilog-mode))
;;;                           auto-mode-alist))
;; ********************************************************************************

(defconst verilog-mode-revision 1.5)

(defvar verilog-indent 2
  "* amount of each indent for verilog mode")

(defvar verilog-comment-column 60
  "* target column for inline C comments after real code")

(defvar verilog-undent-end t
  "* if t, then begin and end keywords lineup,
  if nil, then end if indented by indent amount")

(defvar verilog-please-fix-comments t
  "*align comments after code to verilog-comment column")

(defvar verilog-please-fix-defs t
  "* align input,output states")

(defvar current-indent 0)

;; key bindings
(defvar verilog-mode-map ()
  "Keymap used in Verilog mode.")

(if (null verilog-mode-map)
    (setq verilog-mode-map (make-sparse-keymap)))

(define-key verilog-mode-map "\C-c\C-r" 'verilog-indent-buffer)
(define-key verilog-mode-map "\C-c\C-h" 'verilog-insert-header)
(define-key verilog-mode-map "\C-c\C-a" 'verilog-insert-always)
(define-key verilog-mode-map "\C-c\C-i" 'verilog-insert-ifelse)
(define-key verilog-mode-map "\C-c\C-c" 'verilog-insert-case)

(define-key verilog-mode-map "\C-c\C-b" 'verilog-find-matching-block)
(define-key verilog-mode-map [(C-right)] 'verilog-next-line)
(define-key verilog-mode-map [(C-left)]  'verilog-previous-line)
(define-key verilog-mode-map [(C-down)] 'verilog-next-statement)
(define-key verilog-mode-map [(C-up)]  'verilog-previous-statement)

(define-key verilog-mode-map "\C-c/" 'verilog-insert-inline-comment)
(define-key verilog-mode-map "\t" 'electric-verilog-tab)
(define-key verilog-mode-map "\r" 'electric-verilog-newline)

(defun verilog-mode ()
  "*verilog mode with block insert functions

Key Bindings

C-c C-r         Indent and pretty print entire buffer

C-c C-h         Insert module header comments
C-c C-a         Insert skeleton of Always block
C-c C-i         Insert skeleton of if-else block
C-c C-c         Insert skeleton of case statement

C-c C-b         Move to match begin/end for the end/begin you are sitting on
                   (also works for module/endmodule, case/casex/endcase,
                                   task/endtask, function/endfunction)

C-c (right arrow)   Move to next verilog statement
C-c (left  arrow)   Move to previous verilog statement
C-c (down  arrow)   Move to next statement at current indent level
C-c (up    arrow)   Move to previous statement at current indent level

C-c /            Insert inline comment (standalone or at end of line)
<TAB>            Indent line
<NL>             Indent next line to proper place

Interesting variables to set (and there defaults)

(setq verilog-indent 2)          ; ammount of each indent for verilog mode
(setq verilog-comment-column 60) ; target column for inline C comments after real code
(setq verilog-undent-end t)      ; if t, then begin and end keywords lineup, if nil
                                 ;     then end at same indent as block data

(setq verilog-please-fix-comments t)  ; align comments after code to verilog-comment column
(setq verilog-please-fix-defs t)      ; align input,output states

"
  (interactive)
  (kill-all-local-variables)
  (use-local-map verilog-mode-map)
  (setq major-mode 'verilog-mode)
  (setq mode-name "Verilog")
  (run-hooks 'verilog-mode-hook)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; search in defined direction, but not recursively - it's to easy to blow up the stack
(defun verilog-find-match (regexp_dec regexp_inc dir cnt)
  "* find matching block type"
  (while (and (not (= cnt 0))
              (not (= (point) (point-max)))
              (not (= (point) (point-min))))
    (progn
      (beginning-of-line dir)

      ;; one line at a time to collect begin's verses ends
      (cond
       ((re-search-forward (concat "\\b" regexp_dec "\\b") (get-end-of-line-or-comment) t)
        (setq cnt (1- cnt)))

       ((re-search-forward (concat "\\b" regexp_inc "\\b") (get-end-of-line-or-comment) t)
        (setq cnt (1+ cnt)))))))

(defun verilog-find-matching-block ()
  "* find matching begin or end to current begin or end"
  (interactive)

  (skip-chars-backward "a-z")                     ;; skip to start of word, if we aren't there already

  (cond
   ((looking-at "begin") (progn
                           (verilog-find-match "end" "begin" 2 1)
                           (skip-chars-backward "a-z")))

   ((looking-at "\\(case\\|casex\\)") (progn
                           (verilog-find-match "endcase" "\\(case\\|casex\\)" 2 1)
                           (skip-chars-backward "a-z")))

   ((looking-at "function") (progn
                           (verilog-find-match "endfunction" "function" 2 1)
                           (skip-chars-backward "a-z")))

   ((looking-at "task") (progn
                           (verilog-find-match "endtask" "task" 2 1)
                           (skip-chars-backward "a-z")))

   ((looking-at "module") (progn
                           (verilog-find-match "endmodule" "module" 2 1)
                           (skip-chars-backward "a-z")))

   ((looking-at "endcase") (progn
                           (verilog-find-match "\\(case\\|casex\\)" "endcase" 0 1)
                           (skip-chars-backward "a-z")))

   ((looking-at "endfunction") (progn
                           (verilog-find-match "function" "endfunction" 0 1)
                           (skip-chars-backward "a-z")))

   ((looking-at "endtask") (progn
                           (verilog-find-match "task" "endtask" 0 1)
                           (skip-chars-backward "a-z")))

   ((looking-at "endmodule") (progn
                           (verilog-find-match "module" "endmodule" 0 1)
                           (skip-chars-backward "a-z")))

   ((looking-at "end")   (progn
                           (verilog-find-match "begin" "end" 0 1)
                           (skip-chars-backward "a-z")))
   ))

;; ********************************************************************************
(defun verilog-next-statement ()
  "* go to next statement at this indent level (or less!)"
  (interactive)
  (let (o-indent c-indent)
    (setq o-indent (verilog-find-indent))
    (verilog-next-line)
    (setq c-indent (current-column))
    (while (< o-indent c-indent)
      (progn
        (verilog-next-line)
        (setq c-indent (current-column))))))

(defun verilog-previous-statement ()
  "* go to previous statement at this indent level (or less!)"
  (interactive)
  (let (o-indent c-indent)
    (setq o-indent (verilog-find-indent))
    (verilog-previous-line)
    (setq c-indent (current-column))
    (while (< o-indent c-indent)
      (progn
        (verilog-previous-line)
        (setq c-indent (current-column))))))

(defun verilog-next-line ()
  "* go ahead to next non empty, non-comment line, or to beginning of buffer"
  (interactive)
  (forward-line)
  (if (< (point) (point-max))
      (progn
        (skip-chars-forward " \t")   ; skip spaces
        (if (or (looking-at "$")     ; empty line
                (looking-at "//"))   ; comment
            (verilog-next-line)))))

(defun verilog-previous-line ()
  "* go back to previous non empty, non-comment line, or to beginning of buffer"
  (interactive)
  (beginning-of-line 0)
  (if (> (point) 1)
      (progn
        (skip-chars-forward " \t")   ; skip spaces
        (if (or (looking-at "$")     ; empty line
                (looking-at "//"))   ; comment
            (verilog-previous-line)))))

(defun verilog-find-indent ()
  "find indent level for current line"
  ; go back to previous non empty/comment line and figure out what to do from there
  (save-excursion

    ;; if we are looking at a end, then figure out what to do with it compared to last line
    (if (looking-at "\\(end\\|endcase\\|endtask\\|endmodule\\|endfunction\\|join\\)\\b")
        (progn
          (verilog-find-matching-block)
          (beginning-of-line)
          (skip-chars-forward " \t")
          (setq current-indent (current-column))
          ;(message (int-to-string current-indent))
          (if verilog-undent-end
              current-indent
            (+ current-indent verilog-indent)))

      ;; otherwise figure out what to do based on that last real statement
      (progn
        (verilog-previous-line)

        ;; if it starts with some keywords, indent = column + verilog-indent
        ;; (untabify (get-beg-of-line) (get-end-of-line))
        (skip-chars-forward " \t")
        (setq current-indent (current-column))

        (cond
         ((looking-at "module\\b")
          verilog-indent)

         ((looking-at "\\(initial\\|always\\|task\\|function\\|module\\|forever\\)\\b")
          (+ current-indent verilog-indent))

         ((looking-at "\\(if\\|else\\|for\\|while\\|case\\|casex\\|begin\\|fork\\)\\b")
          (+ current-indent verilog-indent))

         ((looking-at "\\(end\\|endcase\\|endtask\\|endmodule\\|endfunction\\|join\\)\\b")
          (if verilog-undent-end
                current-indent
            (- current-indent verilog-indent)))

         ;; finally, just leave it where it is
         ;; (if (looking-at "\\[^:\\]\\[ \t\\]*:")
         ((looking-at "[^: \t]+[ \t]*:[ \t]*begin")
          (+ current-indent verilog-indent))

         ;; double check for if-else-for-while with no begin-else
         ;; else if last line is a operator or , or parent, then conintuation (but just once?)
         ;; DEFAULT
         ((not nil)
          (progn
            (verilog-previous-line)
            (if (and (looking-at "\\(if\\|else\\|for\\|while\\)\\b")
                     (not (re-search-forward "\\bbegin" (get-end-of-line-or-comment) t)))
                (- current-indent verilog-indent)
              current-indent))))))))

(defun verilog-last-comment-indent (cc)
  (save-excursion
    (beginning-of-line 0)
    (if (search-forward "//" (get-end-of-line) t)
        (progn
          (skip-chars-forward " \t")
          (current-column))
      (+ cc verilog-indent))))

(defun verilog-find-column ()
  "indent to proper place"
  ;; if we are in a comment, then just tab
  (if (save-excursion (search-backward "//" (get-beg-of-line) t))
      (verilog-last-comment-indent (current-column))
    ;; else indent whole line
    (progn
      ;; delete leading spaces
      (setq current-indent (current-column))
      (beginning-of-line)
      (delete-whitespaces)
      (verilog-find-indent))))

  ;; move begin on a line by itself to previous statement
  ;; (if (looking-at "begin")
  ;; (progn
  ;; (save-excursion    ;; move begin back to previous statement
  ;; (beginning-of-line)
  ;; (kill-line)
  ;; (verilog-previous-statement)
  ;; (goto-char (get-end-of-line-or-comment))
  ;; (skip-chars-backward " \t")
  ;; (delete-whitespaces)
  ;; (insert " begin ")))

(defun verilog-indent-buffer ()
  "indent entire buffer according to my verilog rules"
  (interactive)
  (verilog-fix-region (point-min) (point-max)))

(defun verilog-indent-region ()
  "indent entire buffer according to my verilog rules"
  (interactive)
  (verilog-fix-region (region-beginning) (region-end)))

(defun verilog-fix-region (min max)
  "indent entire buffer according to my verilog rules"
  (save-excursion
    (goto-char min)
    (while (< (point) max)
      (progn
        (indent-to (verilog-find-column))
        (next-line 1))))
  (if verilog-please-fix-comments
       (verilog-fix-comments))
  (if verilog-please-fix-defs
      (verilog-fix-defs)))

; ********************************************************************************
;;; ********************************************************************************
;;; first find suggested column, then goto column+indent, then column-indent
(defun electric-verilog-tab ()
  (interactive)
  (let (last-indent curr-indent)
    (setq curr-indent (current-column))
    (setq last-indent (verilog-find-column))
    (indent-to (cond
                ((= curr-indent last-indent)           (+ last-indent verilog-indent))
                ((= curr-indent (+ 3 last-indent))     (- last-indent verilog-indent))
                (t                                     last-indent)))))

(defun electric-verilog-newline ()
  (interactive)
  (insert "\n")
  (indent-to (verilog-find-column)))

; ********************************************************************************
;; pretty printing functions
(defun verilog-fix-comment ()
  "fix comment on this line"
  (save-excursion
    (beginning-of-line)
    (skip-chars-forward " \t")
    (if (looking-at "//")
        (indent-to (verilog-find-column))
      (progn
        (search-forward "//")
        (backward-char 2)
        (delete-whitespaces)
        (indent-to verilog-comment-column)))))

(defun verilog-fix-comments ()
  "align comments to the proper column"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (while (search-forward "//" nil t)  ;; for each comment we find
      (verilog-fix-comment))))

(defun verilog-fix-def ()
  "fix io def spacing"
  (save-excursion
    (beginning-of-line)
    (skip-chars-forward " \t")
    (if (looking-at "\\(input\\|output\\|inout\\|wire\\|reg\\)\\b")
        (progn
          (setq current-indent (current-column))
          (skip-chars-forward "A-Za-z") ; skip word characters
          (skip-chars-forward " \t")   ; skip word spaces
          (delete-whitespaces)
          ;; if 'input [9:0] wire;'
          (if (looking-at "\\[")
              (progn
                (indent-to (+ current-indent 7))
                (skip-chars-forward "^\\]") ; skip word characters
                (skip-chars-forward "\\] ") ; skip word spaces
                (delete-whitespaces)))
          (if (> (current-column) (+ current-indent 15)) ; if bit has macro def, so it is to bit, put at least one space in
              (insert " ")
            (indent-to (+ current-indent 15)))))))

(defun verilog-fix-defs ()
  "space out input, output, inout, wire, reg statements to make them pretty"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (while (re-search-forward "\\(input\\|output\\|inout\\|wire\\|reg\\)\\b" nil t)  ;; for each comment we find
      (verilog-fix-def))))

;; ********************************************************************************
;; blocks that get inserted
(defun verilog-insert-always ()
  "insert always block into code"
  (interactive)
  (beginning-of-line)
  (setq current-indent 3)
  (indent-to current-indent)
  (let (blockname)
    (read-string "Block Name: ")
    (insert "always @ (posedge clk) begin : " blockname) (electric-verilog-newline)
    (insert "if (reset_n == 1'b0) begin")  (electric-verilog-newline)
    (insert "end")  (electric-verilog-newline)
    (insert "else begin")  (electric-verilog-newline)
    (insert "end")  (electric-verilog-newline)
    (insert "end // always " blockname) (electric-verilog-newline)))

(defun verilog-insert-case ()
  "insert case statement into code"
  (interactive)
  (beginning-of-line)
  (setq current-indent (verilog-find-indent))
  (indent-to (verilog-find-column))
  (insert "case () ") (electric-verilog-newline)
  (insert "label1  : ;")   (electric-verilog-newline)
  (insert "label2  : ;")   (electric-verilog-newline)
  (insert "default : ;")   (electric-verilog-newline)
  (insert "endcase")       (electric-verilog-newline))

(defun verilog-insert-ifelse ()
  "insert if, else statement into code"
  (interactive)
  (beginning-of-line)
  (setq current-indent (verilog-find-indent))
  (indent-to (verilog-find-column))
  (insert "if () begin") (electric-verilog-newline)
  (insert "end")   (electric-verilog-newline)
  (insert "else begin")   (electric-verilog-newline)
  (insert "end")   (electric-verilog-newline))

(defun verilog-insert-header ()
  "* insert the header comments"
  (interactive)
  (beginning-of-line)
  (insert "// ********************************************************************************\n")
  (insert "// Module   : \n")
  (insert "// Function : \n")
  (insert "// IO Signals : \n")
  (insert "//\n")
  (insert "// Author   : (King Of The Britons)\n")
  (insert "// email    : \n")
  (insert "//\n")
  (insert "// ----------\n")
  (insert "// Revision History : \n")
  (insert "//    Who      Date       Comments \n")
  (insert "//    ---      ----       -------- \n")
  (insert "// ********************************************************************************\n"))

(defun verilog-insert-inline-comment ()
  "insert inline comment at column 60 if text already exists,
at current indent if line is empty"
  (interactive)
  (beginning-of-line)
  (skip-chars-forward " \t")
  (if (looking-at "$")
      (indent-to current-indent) ; *HACK* should be find-verilog-indent, but slow?
    (progn
      (end-of-line)
      (indent-to verilog-comment-column)))
  (insert "// "))

; ********************************************************************************
(defun delete-whitespaces ()
  "Deletes the whitespaces around the current point."
  (let ((pos (progn (skip-chars-backward " \t") (point))))
    (skip-chars-forward " \t")
    (delete-region pos (point))))

(defun get-beg-of-line ()
  (save-excursion
    (beginning-of-line)
    (point)))

(defun get-end-of-line ()
  (save-excursion
    (end-of-line)
    (point)))

(defun get-end-of-line-or-comment ()
  (save-excursion
    (let (eol)
      (setq eol (get-end-of-line))
      ;; don't want to see 'begin/end' etc within comments
      (if (search-forward "//" eol t) ; if there is a C++ comment
          (- (point) 2)               ;   then return the start of it as the end of line
        eol))))                       ;   otehrwise return the real end of line
