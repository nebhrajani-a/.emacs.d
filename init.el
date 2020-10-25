;; Setup
(setq user-full-name "Aditya V. Nebhrajani"
      user-mail-address "aditya.v.nebhrajani@gmail.com"
      calendar-latitude 18.5
      calendar-longitude -73.8
      calendar-location-name "Pune, MH, India")
(display-time)
(transient-mark-mode t)
(setq display-time-day-and-date 't)
(setq inhibit-startup-message 't)
(setq-default indent-tabs-mode nil)
(setq manual-program "/usr/bin/man")
(setq shell-prompt-pattern "^\[[a-z0-9A-Z/]*\]")
(setq apropos-sort-by-scores t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(set-window-scroll-bars (minibuffer-window) nil nil)
(windmove-default-keybindings)
(global-set-key [remap dabbrev-expand] 'hippie-expand)
;; (setq frame-title-format '("emacs"))
(setq evil-want-keybinding t)

;; (define-key global-map "\C-u" 'advertised-undo)
(define-key global-map "\C-l" 'redraw-display)
(define-key global-map "\C-x\C-a" 'replace-string)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (quote [XF86AudioPrev])     (quote spotify-previous))
(global-set-key (quote [XF86AudioNext])     (quote spotify-next))
(global-set-key (quote [XF86AudioPlay])     (quote spotify-playpause))


(defun indent-buffer ()
  "Indent current buffer according to major mode."
  (interactive)
  (indent-region (point-min) (point-max)))
(define-key global-map (kbd "C-<tab>") 'indent-buffer)
;; (define-prefix-command 'space-map)
;; (global-set-key (kbd "SPC") 'space-map)
;; (define-key space-map (kbd "x") 'smex)
;; (define-key space-map (kbd "z") 'keyboard-quit)
;; Buffer List Mode
(global-set-key "\C-x\C-b" 'buffer-menu-other-window)

(setq c-basic-offset 2)

(setq c-mode-hook
      (function (lambda ()
		  (setq c-brace-offset -2)
                  (setq c-basic-offset 2))))

(setq c-default-style "k&r")

;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; VHDL Mode setup.
(defun prepend-path ( my-path )
  (setq load-path (cons (expand-file-name my-path) load-path)))

(defun append-path ( my-path )
  (setq load-path (append load-path (list (expand-file-name my-path)))))


;; Any files that end in .l, .ll and .lex should be in flex mode
(setq auto-mode-alist (cons  '("\\.l\\'" . flex-mode) auto-mode-alist))
(setq auto-mode-alist (cons  '("\\.ll\\'" . flex-mode) auto-mode-alist))
(setq auto-mode-alist (cons  '("\\.lex\\'" . flex-mode) auto-mode-alist))

;; Load bison mode only when needed
(autoload 'bison-mode "bison-mode" "Bison mode" t )

;; Any files that end in .l, .ll and .lex should be in bison mode
(setq auto-mode-alist (cons  '("\\.y$\\'" . bison-mode) auto-mode-alist))
(setq auto-mode-alist (cons  '("\\.yy\\'" . bison-mode) auto-mode-alist))

(setq auto-mode-alist
      (append '(("\\.[Cc][Xx][Xx]$" . c++-mode)
                ("\\.[Cc][Pp][Pp]$" . c++-mode)
                ("\\.[Hh][Xx][Xx]$" . c++-mode)
                ("\\.[Tt][Cc][Cc]$" . c++-mode)
                ("\\.h$" . c++-mode)
                ("\\.i$" . c++-mode)    ; SWIG
                ("\\.mm?$" . objc-mode)
                ("_emacs" . lisp-mode)
                ("\\.el\\.gz$" . lisp-mode)
                ("\\.mak$" . makefile-mode)
                ("\\.conf$" . conf-mode)
                ("\\.go$" .  go-mode)
                ("\\.uncompressed$" . hexl-mode)
                ("\\.ke$" . kepago-mode)
                ("\\.markdown$" . markdown-mode)
                ("\\.md$" . markdown-mode)
                ("\\.textile$" . textile-mode)
                ("\\.kfn$" . kfn-mode)
                ("\\.gyp$" . gyp-mode)
                ("\\.gypi$" . gyp-mode)
                ("\\.rb$" . ruby-mode)
                ("\\.cml$" . xml-mode)
                ("\\.cg$" . cg-mode)
                ("\\.y$" . bison-mode)
                ("\\.yy$" . bison-mode)
                ("\\.yp$" . bison-mode)
                ("\\.l$" . flex-mode)
                ("\\.ll$" . flex-mode)
                ("\\.lex$" . flex-mode)
                ("\\.lua$" . lua-mode)
                ("\\.org$" . org-mode)
                ("\\.scons$" . python-mode)
                ("SCons\\(cript\\|truct\\)" . python-mode)
                ("\\.gclient$" . python-mode)
                ) auto-mode-alist))

(setq auto-mode-alist (cons '("\\.txt$"          . text-mode)   auto-mode-alist))

(autoload 'dcsh-mode "dcsh-mode" "DC Shell" t)
(setq auto-mode-alist (cons '("\\.scr\\'" . dcsh-mode) auto-mode-alist))

(load-file "~/.emacs.d/elisp/emacs-keys.el")


;; Look first in the directory ~/elisp for elisp files
(load-file "~/.emacs.d/elisp/verilog-mode.el")
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )

;; Any files that end in .v should be in verilog mode
(setq auto-mode-alist (cons  '("\\.v\\'" . verilog-mode) auto-mode-alist))

;; Any files in verilog mode should have their keywords colorized
(add-hook 'verilog-mode-hook
	  '(lambda ()
	     (setq paragraph-start "^\\|$")
	     (setq paragraph-separate "^\\|$")
	     (font-lock-mode 1)
	     ))

(setq font-lock-face-attributes
      '((font-lock-comment-face "Brown")
	(font-lock-string-face "RosyBrown")
	(font-lock-keyword-face "Purple")
	(font-lock-function-name-face "Blue")
	(font-lock-variable-name-face "DarkGoldenrod")
	(font-lock-type-face "DarkOliveGreen")
	(font-lock-reference-face "CadetBlue")))

(require 'cc-mode)
(require 'font-lock)
(load-file "~/.emacs.d/elisp/make-regexp.el")
(load-file "~/.emacs.d/elisp/flex-mode.el")
(load-file "~/.emacs.d/elisp/bison-mode.el")

;; Load verilog mode only when needed
;; Load flex mode only when needed
(autoload 'flex-mode "flex-mode" "Flex mode" t )

;; ──────────────────────── Some company setup ────────────────────────
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 2)
(setq company-minimum-prefix-length 3)

;; Make `company-backends' local is critcal or else, completion in every major mode
(defun english-mode-hook-setup ()
  (make-local-variable 'company-backends)
  (add-to-list 'company-backends 'company-ispell)
  (setq company-ispell-dictionary (file-truename "~/.emacs.d/dict/english.txt"))
  (flyspell-mode 1))
(defun c-mode-hook-setup ()
  (flycheck-mode)
  (flyspell-prog-mode))

;; (setq ispell-dictionary "~/.emacs.d/dict/english.txt")

(add-hook 'text-mode-hook 'english-mode-hook-setup)
(add-hook 'LaTeX-mode-hook 'english-mode-hook-setup)
(add-hook 'markdown-mode-hook 'english-mode-hook-setup)
(add-hook 'c-mode-hook 'c-mode-hook-setup)

(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)


;; ;; Set up MELPA  and Marmalade
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

;; Company setup
(use-package company
  :init
  (setq company-require-match nil)            ; Don't require match
  (setq company-tooltip-align-annotations t)  ; Align annotation to the right side.
  (setq company-eclim-auto-save nil)          ; Stop eclim auto save.
  (setq company-dabbrev-downcase nil))         ; No downcase when completion.

;; ;; Use the Spacemacs dark theme
;; (use-package spacemacs-theme
;;   :defer t)

;; (defun transparency (value)
;;   "Sets the transparency of the frame window. 0=transparent/100=opaque."
;;   (interactive "nTransparency Value 0 - 100 opaque:")
;;   (set-frame-parameter (selected-frame) 'alpha value))

;; (defun apply-theme ()
;;   "Apply the `spacemacs-dark' theme and make frames just slightly transparent."
;;   (interactive)
;;   (load-theme 'spacemacs-dark t)
;;   (transparency 100))

;; ;; If this code is being evaluated by emacs --daemon, ensure that each subsequent frame is themed appropriately.
;; (if (daemonp)
;;     (add-hook 'after-make-frame-functions
;;               (lambda (frame)
;;                 (with-selected-frame frame (apply-theme))))
;;   (apply-theme))

;; (if (display-graphic-p)
(load-theme 'atom-one-dark t)
;; (load-theme 'spacemacs-dark t))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame (toggle-frame-fullscreen))))
  (toggle-frame-fullscreen))


;; Auto-fill mode on, set fill-column 100
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'setq fill-column 100)


;; Configuring shell-pop
(use-package shell-pop
  :bind (("C-S-t" . shell-pop)))

;; Zoning
(require 'zone)
(zone-when-idle 120)

;; Globally use undo-tree mode
(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; Render and export keybindings in markdown mode
(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key (kbd "C-|") 'gh-md-export-buffer)))

;; Ido setup
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; Electric Indent Mode
(electric-indent-mode 1)

;; Smartparens Mode
(smartparens-global-mode 1)
(show-smartparens-global-mode 1)


;; ────────────────────── Recent files with ido ─────────────────────
(require 'recentf)
;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
;; enable recent files mode.
(recentf-mode t)
(setq recentf-max-saved-items 50)
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


;; ─────────────────────────── Evil-leader ──────────────────────────
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-current-buffer
  "x" 'smex
  "1" 'delete-other-windows
  "2" 'split-window-below-and-switch
  "3" 'split-window-right-and-switch
  "0" 'delete-window
  "z" 'suspend-frame
  "d" 'treemacs
  "o" 'other-window
  "r" 'ido-recentf-open
  "g" 'magit
  "s" 'save-buffer
  "t" 'shell-pop
  "c" 'delete-frame
  "a" 'org-agenda-list)

;; Evil mode setup
(require 'evil)
(evil-mode 1)

;; Smex setup
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is the old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ───────────────────────── Spaceline config ─────────────────────────
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
(set-face-attribute 'spaceline-evil-normal nil :foreground "black")
(set-face-attribute 'spaceline-evil-insert nil :foreground "black")
(set-face-attribute 'spaceline-evil-visual nil :foreground "black")
(set-face-attribute 'spaceline-evil-emacs nil :foreground "black")
(set-face-attribute 'spaceline-evil-motion nil :foreground "black")
(set-face-attribute 'spaceline-evil-replace nil :foreground "black")
;; (add-hook 'after-init-hook #'fancy-battery-mode)
;; (use-package doom-modeline
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode))

;; Rainbow delimiters setup
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Zoom using scroll wheel
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

;; Yasnippet setup
(require 'yasnippet)
(yas-global-mode 1)

;; (load-file "~/.emacs.d/elpa/company-20200927.2222/company.el")
;; (defun company-to-yasnippet ()
;;   (interactive)
;;   (company-abort)
;;   (call-interactively 'company-yasnippet))
;; (bind-key "<backtab>" 'company-to-yasnippet company-active-map)
;; (bind-key "<backtab>" 'company-yasnippet)

;; Highlight the current line globally.
(global-hl-line-mode)

;; Switch to a window && switch.
(defun split-window-below-and-switch ()
  "Split the window horizontally, then switch to the new pane."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun split-window-right-and-switch ()
  "Split the window vertically, then switch to the new pane."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(global-set-key (kbd "C-x 2") 'split-window-below-and-switch)
(global-set-key (kbd "C-x 3") 'split-window-right-and-switch)

;; Assume I always want to kill current buffer
(defun kill-current-buffer ()
  "Kill the current buffer without prompting."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; Use org-mode for the scratch buffer.
(setq initial-major-mode 'org-mode)


;; Use sexy bullets instead of a million asteriks.
(use-package org-bullets
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))

;; Get rid of the confusing ellipsis and use ⤵ instead.
;; (setq org-ellipsis "⤵")

;; Some setup for behaviour of code blocks: it'll act like a mini Emacs buffer.
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)

;; Make sure I can't tick off a todo if its children are incomplete.
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)

;; Allow ‘a.’, ‘A.’, ‘a)’ and ‘A) as list elements
(setq org-list-allow-alphabetical t)

;; Warn about an approaching deadline...default is 14 days, I prefer 3
(setq org-deadline-warning-days 3)

;; Syntax highlighting in HTML using htmlize and in LaTeX using minted.
(use-package htmlize)
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(setq org-latex-listings 'minted)
;; Make windmove work in Org mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; Rainbow mode (see colors)
(add-hook 'prog-mode-hook 'rainbow-mode)
(add-hook 'org-mode-hook 'rainbow-mode)
(add-hook 'LaTeX-mode-hook 'rainbow-mode)

;; Increase garbage collection threshold to 20MB
(setq gc-cons-threshold 20000000)

;; Save backup files in /tmp, don't litter my directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Recognize that sentences end with a '.' and one space
(setq sentence-end-double-space nil)

;; Better dired deafults: Use kbd "a" to not spawn a new buffer,
;;                        Human readable units
;;                        On kbd "c", recursively copy by default
(put 'dired-find-alternate-file 'disabled nil)
(setq-default dired-listing-switches "-alh")
(setq dired-recursive-copies 'always)

;; Fuzzy matching in dired using /
;; (require 'dired)
;; (define-key dired-mode-map (kbd "/") 'dired-narrow-fuzzy)

;; Auto refresh files that change somewhere else
(global-auto-revert-mode t)

;; Save the point of files
(save-place-mode 1)

;; Functions to kill all other buffers and all dired buffers
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun kill-dired-buffers ()
  "Kill all open dired buffers."
  (interactive)
  (mapc (lambda (buffer)
          (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))

;; Converse to built in server-start
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server."
  (interactive)
  (save-some-buffers)
  (kill-emacs))

;; Setup for browse-kill-ring
(require 'browse-kill-ring)
(setq browse-kill-ring-highlight-inserted-item t
      browse-kill-ring-highlight-current-entry nil
      browse-kill-ring-show-preview t)
(define-key browse-kill-ring-mode-map (kbd "j") 'browse-kill-ring-forward)
(define-key browse-kill-ring-mode-map (kbd "k") 'browse-kill-ring-previous)

;; Multiple cursors in evil-mode
(global-evil-mc-mode  1)

;; Evil-mode: Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

;; Evil-mode: Make horizontal movement cross lines
(setq-default evil-cross-lines t)

;; Use flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))

;; Evil-surround setup
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Unbind M-. and M- in evil-mode
(define-key evil-normal-state-map (kbd "M-.") nil)
(define-key evil-normal-state-map (kbd "M-,") nil)

;; Unbind C-y since I want to use it with evil-mc, and I don't want vim-like scrolling
(dolist (map '(evil-motion-state-map
               evil-insert-state-map
               evil-emacs-state-map))
  (define-key (eval map) "\C-y" nil))

(define-key evil-normal-state-map "J" nil)
;; Emojify setup
;; (use-package emojify
;;   :config (if (display-graphic-p)
;;               (setq emojify-display-style 'image)
;;             (setq emojify-display-style 'unicode)
;;             )
;;   (setq emojify-emoji-set "emojione-v2.2.6")
;;   :init (global-emojify-mode 1))
;; (use-package emojify
;;   :commands emojify-mode
;;   :hook ((after-init . global-emojify-mode))
;;   :init (setq emojify-emoji-styles '(unicode github ascii)
;;               emojify-display-style 'image))
(use-package all-the-icons
  :init (setq inhibit-compacting-font-caches t))



;; Auto-indent with the Return key
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Delete trailing whitespace in all modes. Except when editing
;; Markdown, because it uses two trailing blanks as a signal to create
;; a line break.
(add-hook 'before-save-hook '(lambda()
                               (when (not (or (derived-mode-p 'markdown-mode)))
                                 (delete-trailing-whitespace))))

;; Code Folding
;; Enable code folding for programming modes.
;; za to toggle, zc (close), zm (close all), zr (open all)
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; Some more Markdown setup
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'visual-clean)


;; ────────────── Gives me comments that look like this ─────────────
;; ────────────────────────── Bound to C-c ; ──────────────────────────
(defun comment-pretty ()
  "Insert a comment with '─' (C-x 8 RET BOX DRAWINGS LIGHT HORIZONTAL) on each side."
  (interactive)
  (let* ((comment-char "─")
         (comment (read-from-minibuffer "Comment: "))
         (comment-length (length comment))
         (current-column-pos (current-column))
         (space-on-each-side (/ (- fill-column
                                   current-column-pos
                                   comment-length
                                   (length comment-start)
                                   ;; Single space on each side of comment
                                   (if (> comment-length 0) 2 0)
                                   ;; Single space after comment syntax sting
                                   1)
                                2)))
    (if (< space-on-each-side 2)
        (message "Comment string is too big to fit in one line")
      (progn
        (insert comment-start)
        (when (equal comment-start ";")
          (insert comment-start))
        (insert " ")
        (dotimes (_ space-on-each-side) (insert comment-char))
        (when (> comment-length 0) (insert " "))
        (insert comment)
        (when (> comment-length 0) (insert " "))
        (dotimes (_ (if (= (% comment-length 2) 0)
                        space-on-each-side
                      (- space-on-each-side 1)))
          (insert comment-char))))))

(global-set-key (kbd "C-c ;") 'comment-pretty)

(setq-default
 ;; Makes killing/yanking interact with the clipboard.
 x-select-enable-clipboard t

 ;; To understand why this is done, read `X11 Copy & Paste to/from Emacs' section here:
 ;; https://www.emacswiki.org/emacs/CopyAndPaste.
 x-select-enable-primary t

 ;; Save clipboard strings into kill ring before replacing them. When
 ;; one selects something in another program to paste it into Emacs, but
 ;; kills something in Emacs before actually pasting it, this selection
 ;; is gone unless this variable is non-nil.
 save-interprogram-paste-before-kill t)

;; ─────────────────────── Pretty-Symbols setup ───────────────────────
(require 'pretty-mode)
(global-pretty-mode t)

(pretty-deactivate-groups
 '(:equality :ordering :ordering-double :ordering-triple
             :arrows :arrows-twoheaded :punctuation
             :logic :sets))

(pretty-activate-groups
 '(:sub-and-superscripts :greek :arithmetic-nary))

;; Turn on smooth scrolling. I don't want headaches.
(smooth-scrolling-mode 1)

;; Turn on narrow-to-region
(put 'narrow-to-region 'disabled nil)

;; ────────────────────── Hacks for emacsclient ─────────────────────
;; Scroll bars hide
(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))
(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)
;; Blink the cursor
(blink-cursor-mode 1)

;; ───────────────────── Non-linear undos in evil ─────────────────────
(setq evil-want-fine-undo t)

;; ────────────────────────── Org-evil mode ─────────────────────────
(require 'org-evil)

;; ─────────────────────────── Evil-numbers ───────────────────────────
(global-set-key (kbd "C-c =") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

;; (require 'spotify)

;; ;; Settings
;; (setq spotify-oauth2-client-secret "1b311ffc8051429798c2754c179b0d2f")
;; (setq spotify-oauth2-client-id "61d487409dce4aabade754d11409ed46")
;; (define-key spotify-mode-map (kbd "C-c .") 'spotify-command-map)


(use-package treemacs
  :bind
  (:map global-map
        ("C-x C-d" . treemacs)))
(use-package treemacs-evil)
(use-package treemacs-icons-dired)
(add-hook 'dired-mode-hook 'treemacs-icons-dired-mode)

(use-package dired-subtree
  :config
  (bind-keys :map dired-mode-map
             ("i" . dired-subtree-insert)
             ("p" . dired-subtree-remove)))
(use-package dired-rainbow
  :config
  (progn
    (dired-rainbow-define-chmod directory "#6cb2eb" "d.*")
    (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
    (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
    (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
    (dired-rainbow-define markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
    (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
    (dired-rainbow-define media "#de751f" ("mp3" "mp4" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
    (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
    (dired-rainbow-define log "#c17d11" ("log"))
    (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
    (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
    (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
    (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
    (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
    (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
    (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
    (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
    (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
    (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
    (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*")
    ))
(setq dired-guess-shell-alist-user '(("\\.pdf\\'" "evince")))

;; ────────────────────────── Some Org setup ──────────────────────────
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(add-hook 'org-mode-hook 'org-cdlatex-mode)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; (load-file "~/.emacs.d/elisp/org-habit-plus.el")

;; ───────────────────────── Evil-easymotion ────────────────────────
(evilem-default-keybindings ",")

;; ──────────────────────────── Elpy setup ────────────────────────────
(elpy-enable)

;; ──────────────────────── Company stats mode ────────────────────────
(add-hook 'after-init-hook 'company-statistics-mode)

;; ─────────────────────────── Magit setup ──────────────────────────
(global-set-key (kbd "C-x g") 'magit-status)

;; ─────────────── Recursive minibuffer with depth mode ───────────────
(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode)

;; ─────────────────────── A useful mark setup ──────────────────────
;; Note that this works well for me since I use evil's visual mode for
;; selection. Still, it shouldn't cause issues otherwise either.
(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region.
Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))
(global-set-key (kbd "C-`") 'push-mark-no-activate)
(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))
(global-set-key (kbd "M-`") 'jump-to-mark)
(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))
(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)

;; ───────────────────────── Twittering setup ─────────────────────────
(require 'twittering-mode)
(setq twittering-icon-mode t)
(setq twittering-convert-fix-size 24)
(setq twittering-use-icon-storage t)
(setq twittering-use-master-password t)
(global-set-key (kbd "C-x t") 'twit)

;; ────── Enable company quickhelp mode (tooltip documentation) ─────
(company-quickhelp-mode)

;; ──── Enables source code block background darkening in org-mode ────
(require 'color)
(defun darken ()
  "Darkens background in org-source blocks."
  (set-face-attribute 'org-block nil :background
                      (color-darken-name
                       (face-attribute 'default :background) 2)))
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame (darken))))
  (darken))

;; ───────────────────── Org-mode prettification ────────────────────
(add-hook 'org-mode-hook (lambda ()
                           "Beautify Org Checkbox Symbol"
                           (push '("[ ]" .  "☐") prettify-symbols-alist)
                           (push '("[X]" . "✓" ) prettify-symbols-alist)
                           (push '("[-]" . "○" ) prettify-symbols-alist)
                           (prettify-symbols-mode)))

(defface org-checkbox-done-text
  '((t (:foreground "#71696A" :strike-through t)))
  "Face for the text part of a checked org-mode checkbox.")

(font-lock-add-keywords
 'org-mode
 `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
    1 'org-checkbox-done-text prepend))
 'append)

(add-hook 'treemacs-mode-hook (lambda ()
                                (setq buffer-face-mode-face `(:background "#232830"))
                                (buffer-face-mode 1)))

;; ─────────────────────────── Ediff setup ──────────────────────────
(setq ediff-split-window-function 'split-window-horizontally)

;; ────────────────────── Company fuzzy matching ──────────────────────
;; (add-hook 'text-mode-hook '(company-fuzzy-mode 1))
;; (add-hook 'emacs-lisp-mode-hook '(company-fuzzy-mode 1))
;; (global-company-fuzzy-mode 1)

;; ─────────────────────── Python checker setup ───────────────────────
(add-hook 'python-mode-hook
          (lambda ()
            (setq flycheck-python-pylint-executable "python3")))

;; ─────────────────────── Unbind q from macros ───────────────────────
(define-key evil-normal-state-map (kbd "m") nil)

;; ──────────── Key-sequences setup (Key-Chord Dependency) ────────────
(load-file "~/.emacs.d/elisp/key-chord.el")
(load-file "~/.emacs.d/elisp/key-seq.el")

(key-chord-mode 1)
(key-seq-define-global "km" 'save-buffer)
;; (key-seq-define-global (kbd "km") (kbd "C-x C-s"))

;; ────────── Use qw to escape from anything and everything ─────────
(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "kj")

;; ──────────────────── Emacs Stuff for Discord ────────────────────
(require 'elcord)
(elcord-mode)

;; ────────────────── Highlighted Guides for Python ─────────────────
(load-file "~/.emacs.d/elisp/highlight-indent-guides.el")
(add-hook 'elpy-mode-hook 'highlight-indent-guides-mode)
(defun highlight-indent-guides-auto-set-faces-with-frame (frame)
  (with-selected-frame frame
    (highlight-indent-guides-auto-set-faces)))
(if (daemonp)
    (add-hook 'after-make-frame-functions #'highlight-indent-guides-auto-set-faces-with-frame))

;; ────────────────── Bindings for Block Navigation ─────────────────
;; Uncomment when package maintainer fixes recursion depth issue, and
;; edits are made to ~/.emacs.d/elisp/block-nav.el.

;; Maybe this is better done with forward-sexp anyway, and ELPY binds
;; C-down, C-up to the equivalent functions anyway.

;; (load-file "~/.emacs.d/elisp/block-nav.el")
;; (define-key evil-motion-state-map "H" 'block-nav-previous-indentation-level)
;; (define-key evil-motion-state-map "J" 'block-nav-next-block)
;; (define-key evil-motion-state-map "K" 'block-nav-previous-block)
;; (define-key evil-motion-state-map "L" 'block-nav-next-indentation-level)

;; ──────────── Move text around using M-<UP> and M-<DOWN> ────────────
(use-package move-text)
(move-text-default-bindings)

;; ────────────────── Use swiper instead of isearch ─────────────────
(use-package swiper
  :bind (("C-s" . swiper-isearch)))

;; ──────────────────────────── Rust Setup ────────────────────────────
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-<tab>") #'rust-format-buffer)))
(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path
      (concat (string-trim
               (shell-command-to-string "rustc --print sysroot"))
              "/lib/rustlib/src/rust/src"))

(require 'rust-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; ──────────────── Use M-. to jump to definitions.   ───────────────
;; ────── Configure M-?: sudo apt-get install silversearcher-ag ─────
(use-package smart-jump
  :ensure t
  :config
  (smart-jump-setup-default-registers))

;; There is a major issue in Emacs-Lisp mode where the company tooltip
;; does not appear and instead 'crunches' the lines under it. Not sure
;; how to fix this issue.
;; Issue root tracked: line numbering. Issue is caused by linum-mode
;; and linum-relative mode. (Reproducible). Emacs 26.1+, use
;; display-line-numbers-mode instead, that should not break things.
                                        ;TODO: Test display-line-numbers-mode in 26+.
;; Tested on Emacs 27.1, issue does not occur with both linum-mode and
;; display-line-numbers-mode. Seems to be an issue with newer versions
;; of company with older versions of linum included with Emacs 25.2-.
;; Update Emacs...

;; ──────────────────────── JavaScript Support ────────────────────────
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; ───────────────────────── Custom set stuff ─────────────────────────
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:italic t :foreground "brown")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#21252B" "#E06C75" "#98C379" "#E5C07B" "#61AFEF" "#C678DD" "#56B6C2" "#ABB2BF"])
 '(blink-cursor-alist nil)
 '(blink-cursor-interval 0.6)
 '(c-basic-offset 2)
 '(case-fold-search t)
 '(comint-scroll-show-maximum-output t)
 '(company-backends
   (quote
    ((company-keywords)
     company-elisp company-capf company-yasnippet company-nxml company-dabbrev company-css company-eclim company-semantic company-bbdb company-cmake company-capf company-files
     (company-dabbrev-code company-gtags company-abbrev)
     company-oddmuse company-dabbrev-code)))
 '(company-frontends
   (quote
    (company-preview-frontend company-echo-metadata-frontend)))
 '(company-show-numbers (quote (quote t)))
 '(company-tabnine-wait 0.1)
 '(completion-styles (quote (basic partial-completion emacs22)))
 '(current-language-environment "UTF-8")
 '(custom-safe-themes
   (quote
    ("2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "d1af5ef9b24d25f50f00d455bd51c1d586ede1949c5d2863bef763c60ddf703a" "5b7c31eb904d50c470ce264318f41b3bbc85545e4359e6b7d48ee88a892b1915" "614a8fc7db02cb99d9f1acf1297b26f8224cf80bf6c0ec31d30c431503e8b59f" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "0d456bc74e0ffa4bf5b69b0b54dac5104512c324199e96fc9f3a1db10dfa31f3" "27b97024320d223cbe0eb73104f2be8fcc55bd2c299723fc61d20057f313b51c" default)))
 '(default-input-method "rfc1345")
 '(delete-selection-mode t)
 '(doc-view-continuous t)
 '(doc-view-resolution 400)
 '(ediff-make-buffers-readonly-at-startup t)
 '(elcord-display-buffer-details nil)
 '(elcord-display-elapsed nil)
 '(elcord-mode t nil (elcord))
 '(emojify-emoji-set "emojione-v2.2.6-22")
 '(evil-want-keybinding nil)
 '(evil-want-minibuffer nil)
 '(fci-rule-color "#405A61")
 '(flycheck-pycheckers-checkers (quote (pylint)))
 '(flycheck-pycheckers-ignore-codes
   (quote
    ("C0301" "C0326" "C0325" "C0411" "C0413" "C0103" "C0111" "W0142" "W0201" "W0232" "W0403" "W0511" "E1002" "E1101" "E1103" "R0201" "R0801" "R0903" "R0904" "R0914")))
 '(flycheck-python-pylint-executable nil)
 '(global-font-lock-mode t nil (font-lock))
 '(highlight-indent-guides-auto-character-face-perc 10)
 '(highlight-indent-guides-auto-enabled t)
 '(highlight-indent-guides-method (quote character))
 '(highlight-indent-guides-responsive (quote top))
 '(highlight-indentation-blank-lines nil)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2aa198")
     ("PROG" . "#268bd2")
     ("OKAY" . "#268bd2")
     ("DONT" . "#d70000")
     ("FAIL" . "#d70000")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#875f00")
     ("KLUDGE" . "#875f00")
     ("HACK" . "#875f00")
     ("TEMP" . "#875f00")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(ido-auto-merge-delay-time 1.5)
 '(ido-mode (quote both) nil (ido))
 '(initial-scratch-message "*Nebhrajani A.'s scratch buffer. You shouldn't be here.*
")
 '(jdee-db-active-breakpoint-face-colors (cons "#073642" "#268bd2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#073642" "#859900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#073642" "#56697A"))
 '(keyboard-coding-system (quote utf-8-unix))
 '(linum-relative-current-symbol "")
 '(lpr-command "lp")
 '(objed-cursor-color "#dc322f")
 '(org-agenda-files
   (quote
    ("~/agenda/last_three_months.org" "~/agenda/jee.org" "~/agenda/work.org" "~/agenda/nss.org" "~/agenda/personal.org" "~/agenda/home.org" "~/agenda/school.org")))
 '(org-babel-load-languages (quote ((C . t) (python . t) (emacs-lisp . t))))
 '(org-babel-python-command "python3")
 '(org-confirm-babel-evaluate nil)
 '(org-ellipsis "⤵")
 '(org-export-latex-packages-alist
   (quote
    (("a4paper, total={6in, 9in}" "geometry" nil)
     ("" "amsmath" nil)
     ("" "tabulary" nil))))
 '(org-latex-compiler "pdflatex")
 '(org-latex-default-class "article")
 '(org-latex-default-packages-alist
   (quote
    (("AUTO" "inputenc" t
      ("pdflatex"))
     ("T1" "fontenc" t
      ("pdflatex"))
     ("" "graphicx" t nil)
     ("" "grffile" t nil)
     ("" "longtable" nil nil)
     ("" "wrapfig" nil nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "textcomp" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("hidelinks" "hyperref" nil nil))))
 '(org-latex-minted-langs
   (quote
    ((python "python")
     (emacs-lisp "common-lisp")
     (cc "c++")
     (cperl "perl")
     (shell-script "bash")
     (caml "ocaml"))))
 '(org-latex-packages-alist
   (quote
    (("" "minted" nil)
     ("a4paper, total={6in, 9in}" "geometry" nil))))
 '(org-modules
   (quote
    (ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit org-habit-plus ol-info ol-irc ol-mhe ol-rmail ol-w3m)))
 '(org-timer-default-timer 10)
 '(package-selected-packages
   (quote
    (theme-magic dart-mode lsp-mode dad-joke key-chord key-seq js2-mode doom-modeline company-box ag smart-jump flycheck-rust racer swiper cargo rust-mode powerthesaurus move-text gnu-elpa-keyring-update gnu-elpa flycheck-aspell highlight-indent-guides minimap elcord evil-escape evil-leader company-fuzzy web-mode company-quickhelp atom-one-dark-theme atom-dark-theme laguna-theme doom-themes treemacs-all-the-icons twittering-mode spotify evil-mc-extras evil-magit treemacs-magit company-try-hard company-statistics elpy auctex evil-easymotion floobits common-lisp-snippets caps-lock cdlatex bbdb gnuplot-mode gnuplot dired-open dired-rainbow dired-subtree treemacs-icons-dired treemacs-evil treemacs company-emoji howdoyou zone-nyan chess flycheck-pycheckers dashboard fancy-battery spaceline smartparens ztree zone-quotes zone-matrix yasnippet-snippets xkcd xbm-life writeroom-mode whole-line-or-region use-package typing-game theme-changer spacemacs-theme smooth-scrolling smooth-scroll smex smart-mode-line-powerline-theme simple-mpc shell-pop restart-emacs rainbow-mode rainbow-delimiters pretty-symbols pretty-mode powerline-evil pdf-tools ox-twbs org-pomodoro org-evil org-bullets nadvice htmlize guess-language gh-md flymd flycheck-color-mode-line eww-lnum evil-surround evil-numbers evil-mc evil-macros evil-commentary emojify-logos emms easy-kill distinguished-theme dired-hacks-utils dakrone-theme company-web company-math company-c-headers company-bibtex company-auctex browse-kill-ring beacon autopair all-the-icons ahungry-theme academic-phrases 2048-game)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#262626")))
 '(powerline-default-separator (quote wave))
 '(powerline-default-separator-dir (quote (right . right)))
 '(powerline-height nil)
 '(printer-name "sjc06-02-c612-c")
 '(ps-lpr-command "lp")
 '(python-shell-interpreter "python3")
 '(rustic-ansi-faces
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(safe-local-variable-values (quote ((emacs-lisp-docstring-fill-column . 75))))
 '(shell-pop-shell-type
   (quote
    ("terminal" "*terminal*"
     (lambda nil
       (term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 40)
 '(show-paren-delay 0)
 '(show-paren-mode t nil (paren))
 '(smooth-scroll-margin 2)
 '(smooth-scroll-strict-margins t)
 '(smooth-scrolling-mode t)
 '(spaceline-show-default-input-method t)
 '(split-width-threshold nil)
 '(swiper-verbose t)
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(transient-mark-mode t)
 '(undo-tree-auto-save-history nil)
 '(vc-annotate-background "#002b36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#859900")
    (cons 40 "#959300")
    (cons 60 "#a58e00")
    (cons 80 "#b58900")
    (cons 100 "#bc7407")
    (cons 120 "#c35f0e")
    (cons 140 "#cb4b16")
    (cons 160 "#cd4439")
    (cons 180 "#d03d5d")
    (cons 200 "#d33682")
    (cons 220 "#d63466")
    (cons 240 "#d9334a")
    (cons 260 "#dc322f")
    (cons 280 "#ba3f41")
    (cons 300 "#994d54")
    (cons 320 "#775b67")
    (cons 340 "#405A61")
    (cons 360 "#405A61")))
 '(vc-annotate-very-old-color nil))

(use-package evil-mc
  :load-path "~/.emacs.d/elpa/evil-mc-20200228.1535/")
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
