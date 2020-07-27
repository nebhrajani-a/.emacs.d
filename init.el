;; ███████ ████████  █████  ██████  ████████      ██████  ███████     ███    ███ ██    ██      ██████  ██████  ███    ██ ███████ ██  ██████
;; ██         ██    ██   ██ ██   ██    ██        ██    ██ ██          ████  ████  ██  ██      ██      ██    ██ ████   ██ ██      ██ ██
;; ███████    ██    ███████ ██████     ██        ██    ██ █████       ██ ████ ██   ████       ██      ██    ██ ██ ██  ██ █████   ██ ██   ███
;;      ██    ██    ██   ██ ██   ██    ██        ██    ██ ██          ██  ██  ██    ██        ██      ██    ██ ██  ██ ██ ██      ██ ██    ██
;; ███████    ██    ██   ██ ██   ██    ██         ██████  ██          ██      ██    ██         ██████  ██████  ██   ████ ██      ██  ██████

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
(setq frame-title-format '("emacs"))
(setq evil-want-keybinding t)

;; My key mappings
(setq compile-command "make deliver")

;; (define-key global-map "\C-u" 'advertised-undo)
(define-key global-map "\C-l" 'redraw-display)
(define-key global-map "\C-x\C-a" 'replace-string)
(define-key global-map "\M-\C-m" 'compile)
(global-set-key (kbd "M-o") 'other-window)

;; Electric Buffer List Mode
(global-set-key "\C-x\C-b" 'buffer-menu-other-window)


(setq c-basic-offset 2)

(setq c-mode-hook
      (function (lambda ()
		  (setq c-brace-offset -2 c-auto-newline 't)
                  (setq c-basic-offset 2)
		  (local-set-key "\C-c\C-c" 'c-insert-comment)
		  (local-set-key (quote [f12]) (quote dabbrev-expand))
		  (local-set-key "\C-c\C-p" 'make-regexp-for-word))))

(setq c++-mode-hook
      (function (lambda ()
;;		  (define-key c-mode-map "{" 'electric-c-semi)
		  (setq c-brace-offset -2 c-auto-newline 't)
                  (setq c-basic-offset 2)
                  (setq c-default-style "stroustrup")
		  (local-set-key "\C-c\C-c" 'c-insert-comment)
		  (local-set-key (quote [f12]) (quote dabbrev-expand))
		  (local-set-key "\C-c\C-p" 'make-regexp-for-word))))

(setq TeX-mode-hook
      (function (lambda ()
		  (setq fill-column 100)
		  (turn-on-auto-fill))))


;; (setq mail-mode-hook
;;       (function (lambda ()
;; 		  (load "mail-utils"))))

;; Use "y or n" answers instead of full words "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; VHDL Mode setup.

(defun prepend-path ( my-path )
  (setq load-path (cons (expand-file-name my-path) load-path)))

(defun append-path ( my-path )
  (setq load-path (append load-path (list (expand-file-name my-path)))))


;; Any files that end in .l, .ll and .lex should be in flex mode
;; (setq auto-mode-alist (cons  '("\\.l\\'" . flex-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons  '("\\.ll\\'" . flex-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons  '("\\.lex\\'" . flex-mode) auto-mode-alist))

;; Load bison mode only when needed
(autoload 'bison-mode "bison-mode" "Bison mode" t )

;; Any files that end in .l, .ll and .lex should be in bison mode
;;(add-to-set! auto-mode-alist '("\\.y$" . bison-mode))
;;(setq auto-mode-alist (cons  '("\\.y$\\'" . bison-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons  '("\\.yy\\'" . bison-mode) auto-mode-alist))

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


;; Get rid of the toolbar on top of the window
(tool-bar-mode 0)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(load-file "~/.emacs.d/elisp/emacs-keys.el")

;;(put 'eval-expression 'disabled nil)

(setq c-default-style "k&r")

;; Hack to allow C-c C-f RET to reopen current file rather than open dired
(defun find-file-read-args (prompt mustmatch)
  (list (let ((find-file-default
               (and buffer-file-name
                    (abbreviate-file-name buffer-file-name))))
          (read-file-name prompt nil find-file-default mustmatch))
        t))

;; Look first in the directory ~/elisp for elisp files
(prepend-path "~/emacs")

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

;; Company setup
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)

;; make `company-backends' local is critcal or else, completion in every major mode
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

;; Use the Spacemacs dark theme
(use-package spacemacs-theme
  :defer t)

(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque."
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(defun apply-theme ()
  "Apply the `spacemacs-dark' theme and make frames just slightly transparent."
  (interactive)
  (load-theme 'spacemacs-dark t)
  (transparency 100))

;; If this code is being evaluated by emacs --daemon, ensure that each subsequent frame is themed appropriately.

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame (apply-theme))))
  (apply-theme))

;; Auto-fill mode on, set fill-column 100
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'setq fill-column 100)


;; Configuring shell-pop
(use-package shell-pop
  :bind (("C-S-t" . shell-pop)))

;; Globally use line number (linum) mode
(global-linum-mode 1)

;; Zoning
(require 'zone)
(zone-when-idle 120)

;; Globally use undo-tree mode
(global-undo-tree-mode 1)

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

;; Rainbow delimiters setup
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Zoom using scroll wheel
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

;; Yasnippet setup
(require 'yasnippet)
(yas-global-mode 1)

(load-file "~/.emacs.d/elpa/company-20200525.101/company.el")
(defun company-to-yasnippet ()
  (interactive)
  (company-abort)
  (call-interactively 'company-yasnippet))
(bind-key "<backtab>" 'company-to-yasnippet company-active-map)
(bind-key "<backtab>" 'company-yasnippet)

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
(require 'dired)
(define-key dired-mode-map (kbd "/") 'dired-narrow-fuzzy)

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

;; Emojify setup
;; (use-package emojify
;;   :config (if (display-graphic-p)
;;               (setq emojify-display-style 'image)
;;             (setq emojify-display-style 'unicode)
;;             )
;;   (setq emojify-emoji-set "emojione-v2.2.6")
;;   :init (global-emojify-mode 1))
(use-package emojify
  :commands emojify-mode
  :hook ((after-init . global-emojify-mode))
  :init (setq emojify-emoji-styles '(unicode github ascii)
               emojify-display-style 'image))
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

;; Minibuffer commands work in the minibuffer. I'm keeping this commented for now...
;; (enable-recursive-minibuffers t)

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

;; ───────────────────────────── Emoji ────────────────────────────
(require 'company-emoji)

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

(load-file "~/.emacs.d/elisp/org-habit-plus.el")

;; Better evil keybindings in various modes

(require 'linum-relative)
(add-hook 'prog-mode-hook 'linum-relative-mode)
(add-hook 'text-mode-hook 'linum-relative-mode)

(evilem-default-keybindings "SPC")

;; ──────────────────────────── Elpy setup ────────────────────────────
(elpy-enable)

;; ──────────────────────── Company stats mode ────────────────────────
(add-hook 'after-init-hook 'company-statistics-mode)

;; ─────────────────────────── Magit setup ──────────────────────────
(global-set-key (kbd "C-x g") 'magit-status)

;; ███████ ███    ██ ██████       ██████  ███████     ███    ███ ██    ██      ██████  ██████  ███    ██ ███████ ██  ██████
;; ██      ████   ██ ██   ██     ██    ██ ██          ████  ████  ██  ██      ██      ██    ██ ████   ██ ██      ██ ██
;; █████   ██ ██  ██ ██   ██     ██    ██ █████       ██ ████ ██   ████       ██      ██    ██ ██ ██  ██ █████   ██ ██   ███
;; ██      ██  ██ ██ ██   ██     ██    ██ ██          ██  ██  ██    ██        ██      ██    ██ ██  ██ ██ ██      ██ ██    ██
;; ███████ ██   ████ ██████       ██████  ██          ██      ██    ██         ██████  ██████  ██   ████ ██      ██  ██████

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
 '(c-basic-offset 2)
 '(case-fold-search t)
 '(company-backends
   (quote
    ((company-keywords)
     company-elisp company-emoji company-nxml company-dabbrev company-css company-eclim company-semantic company-bbdb company-xcode company-cmake company-capf company-files
     (company-dabbrev-code company-gtags company-etags)
     company-oddmuse company-dabbrev-code)))
 '(company-frontends
   (quote
    (company-pseudo-tooltip-unless-just-one-frontend company-echo-metadata-frontend company-preview-if-just-one-frontend)))
 '(company-show-numbers (quote (quote t)))
 '(company-tabnine-wait 0.1)
 '(completion-styles (quote (basic partial-completion emacs22)))
 '(current-language-environment "UTF-8")
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "0d456bc74e0ffa4bf5b69b0b54dac5104512c324199e96fc9f3a1db10dfa31f3" "27b97024320d223cbe0eb73104f2be8fcc55bd2c299723fc61d20057f313b51c" default)))
 '(default-input-method "rfc1345")
 '(delete-selection-mode t)
 '(doc-view-continuous t)
 '(doc-view-resolution 400)
 '(emojify-emoji-set "emojione-v2.2.6-22")
 '(evil-want-keybinding nil)
 '(global-font-lock-mode t nil (font-lock))
 '(ido-mode (quote both) nil (ido))
 '(initial-scratch-message "*Nebhrajani A.'s scratch buffer. You shouldn't be here.*
")
 '(lpr-command "lp")
 '(org-agenda-files
   (quote
    ("~/agenda/bt.org" "~/agenda/work.org" "~/agenda/nss.org" "~/agenda/personal.org" "~/agenda/home.org" "~/agenda/school.org")))
 '(org-babel-load-languages (quote ((C . t) (python . t) (emacs-lisp . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-ellipsis "⤵")
 '(org-export-latex-packages-alist
   (quote
    (("a4paper, total={6in, 9in}" "geometry" nil)
     ("" "amsmath" nil)
     ("" "tabulary" nil))))
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
     ("a4paper, total={6in, 9.1in}" "geometry" nil))))
 '(org-modules
   (quote
    (ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit org-habit-plus ol-info ol-irc ol-mhe ol-rmail ol-w3m)))
 '(org-timer-default-timer 10)
 '(package-selected-packages
   (quote
    (evil-mc-extras evil-magit treemacs-magit company-try-hard company-statistics elpy auctex evil-easymotion linum-relative floobits common-lisp-snippets caps-lock cdlatex smtpmail-multi bbdb gnuplot-mode gnuplot dired-open dired-rainbow dired-subtree treemacs-icons-dired treemacs-evil treemacs company-emoji company company-tabnine howdoyou zone-nyan chess flycheck-pycheckers dashboard fancy-battery spaceline smartparens ztree zone-quotes zone-matrix yasnippet-snippets xkcd xbm-life writeroom-mode whole-line-or-region use-package typing-game theme-changer spotify spacemacs-theme smooth-scrolling smooth-scroll smex smart-mode-line-powerline-theme simple-mpc shell-pop restart-emacs rainbow-mode rainbow-delimiters pretty-symbols pretty-mode powerline-evil pdf-tools ox-twbs org-pomodoro org-evil org-bullets nadvice htmlize guess-language gnu-elpa-keyring-update gh-md flymd flycheck-color-mode-line eww-lnum evil-surround evil-numbers evil-mc evil-macros evil-commentary emojify-logos emms easy-kill distinguished-theme dired-hacks-utils dakrone-theme company-web company-math company-c-headers company-bibtex company-auctex browse-kill-ring beacon autopair all-the-icons ahungry-theme academic-phrases 2048-game)))
 '(powerline-default-separator (quote wave))
 '(powerline-default-separator-dir (quote (right . right)))
 '(powerline-height nil)
 '(printer-name "sjc06-02-c612-c")
 '(ps-lpr-command "lp")
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
 '(transient-mark-mode t))


(use-package evil-mc
  :load-path "~/.emacs.d/elpa/evil-mc-20200228.1535/")
