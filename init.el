;; Setup
(setq user-full-name "Nebhrajani A.V."
      user-mail-address "aditya.v.nebhrajani@gmail.com")
;; calendar-latitude 18.5
;; calendar-longitude -73.8
;; calendar-location-name "Pune, MH, India")
(setq calendar-latitude 40.1)
(setq calendar-longitude -88.2)
(setq calendar-location-name "Urbana, IL")
(setq calendar-time-zone -360)
(setq calendar-standard-time-zone-name "CST")
(setq calendar-daylight-time-zone-name "CDT")
(display-time)
(setq ring-bell-function 'ignore)
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
(setq frame-title-format '("%b@" (:eval (or (file-remote-p default-directory 'host) system-name)) " — Emacs"))


(define-key global-map (kbd "C-<tab>") 'format-all-buffer)
;; (define-key global-map "\C-u" 'advertised-undo)
(define-key global-map [?\s-q] nil) ;; Stop macOS' dumb CMD-q quit for Emacs
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
;; (define-key global-map (kbd "C-<tab>") 'indent-buffer)
;; Buffer List Mode
(global-set-key "\C-x\C-b" 'buffer-menu-other-window)

(setq c-basic-offset 2)
(add-hook 'c-mode-common-hook '(lambda () (c-toggle-hungry-state 1)))
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

(load-file "~/.emacs.default/elisp/emacs-keys.el")


;; Look first in the directory ~/elisp for elisp files
(load-file "~/.emacs.default/elisp/verilog-mode.el")
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )

;; ;;TODO: Python mode hook for /usr/bin/env -S

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
(load-file "~/.emacs.default/elisp/make-regexp.el")
(load-file "~/.emacs.default/elisp/flex-mode.el")
(load-file "~/.emacs.default/elisp/bison-mode.el")

;; Load verilog mode only when needed
;; Load flex mode only when needed
(autoload 'flex-mode "flex-mode" "Flex mode" t )

;; Make `company-backends' local is critcal or else, completion in every major mode
(defun english-mode-hook-setup ()
  (flyspell-mode 1))
(defun c-mode-hook-setup ()
  (flycheck-mode)
  (flyspell-prog-mode))

;; (setq ispell-dictionary "~/.emacs.default/dict/english.txt")

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
(setq package-enable-at-startup nil)
(package-initialize)
(require 'org)
(require 'ox)
(eval-after-load 'ox ;; shouldn't be byte compiled.
  '(when (and user-init-file (buffer-file-name)) ;; don't do it in async
     (setq org-export-async-init-file
           (expand-file-name "init-org-async.el" (file-name-directory
                                                  user-init-file)))))
(setq org-export-in-background 't)


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


(use-package exec-path-from-shell)
(exec-path-from-shell-initialize) ;; Make sure PATH is the same as what's seen in the shell. *Sigh* OSX.

;; Use the Spacemacs dark theme
(use-package spacemacs-theme
  :defer t)

;; ;; If this code is being evaluated by emacs --daemon, ensure that each subsequent frame is themed appropriately.
;; (if (daemonp)
;;     (add-hook 'after-make-frame-functions
;;               (lambda (frame)
;;                 (with-selected-frame frame (apply-theme))))
;;   (apply-theme))


(use-package all-the-icons
  :init (setq inhibit-compacting-font-caches t))
;; (load-theme 'doom-vibrant t)
(use-package doom-themes
  :config
  ;;snazzy
  ;;ir-black
  ;;city-lights
  ;;vibrant --
  (let ((chosen-theme 'doom-snazzy))
    (doom-themes-org-config)
    (doom-themes-treemacs-config)
    (load-theme chosen-theme t)))
;; set transparency
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))

;; (load-theme 'spacemacs-dark t))
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame (toggle-frame-maximized))))
  (toggle-frame-maximized))


;; Auto-fill mode on, set fill-column 100
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'setq fill-column 100)


;; Configuring shell-pop
(use-package shell-pop
  :bind (("C-S-t" . shell-pop)))

;; Zoning
;; (require 'zone)
;; (zone-when-idle 120)

;; Globally use undo-tree mode
(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.default/undo")))

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

;; ────────────────────────── Open Init File ──────────────────────────
(defun open-init-file ()
  "Open this very file."
  (interactive)
  (find-file "~/.emacs.default/init.el"))

;; ──────────────────────── Switch to Scratch ───────────────────────
(defun switch-to-scratch-buffer ()
  "Switch to the current session's scratch buffer."
  (interactive)
  (switch-to-buffer "*scratch*"))


;; ──────────────────────────── PDF Tools ───────────────────────────
(pdf-tools-install)
(setq pdf-view-use-scaling t)

;; ──────────────────────────── Evil mode ───────────────────────────
;; (setq evil-want-keybinding nil)
;; (setq evil-want-keybinding t)
(require 'evil)
(evil-mode 1)
(evil-collection-init '(magit pdf))
(evil-set-initial-state 'vterm-mode 'emacs) ;; this doesn't always work correctly
;; (add-hook 'vterm-mode-hook (lambda () (setq evil-default-state 'emacs)))

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
  "z" 'delete-frame
  "d" 'dired
  "o" 'other-window
  "r" 'ido-recentf-open
  "g" 'magit
  "s" 'switch-to-scratch-buffer
  "t" 'shell-pop
  "c" 'org-capture
  "e" 'open-init-file
  "a" 'org-agenda-list
  "-" 'text-scale-decrease
  "=" 'text-scale-increase)
;; "l" 'lsp-keymap-prefix)

;; Smex setup
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is the old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ───────────────────────── Modeline config ─────────────────────────
;; (require 'spaceline-config)
;; (spaceline-spacemacs-theme)
;; (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
;; (set-face-attribute 'spaceline-evil-normal nil :foreground "black")
;; (set-face-attribute 'spaceline-evil-insert nil :foreground "black")
;; (set-face-attribute 'spaceline-evil-visual nil :foreground "black")
;; (set-face-attribute 'spaceline-evil-emacs nil :foreground "black")
;; (set-face-attribute 'spaceline-evil-motion nil :foreground "black")
;; (set-face-attribute 'spaceline-evil-replace nil :foreground "black")
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))
(defvar doom-modeline-icon 't)
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
(setq doom-modeline-unicode-fallback 't)
(setq doom-modeline-window-width-limit fill-column)

;; Battery
;; (add-hook 'after-init-hook #'fancy-battery-mode)

;; Rainbow delimiters setup
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Zoom using scroll wheel
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

;; Yasnippet setup
(require 'yasnippet)
(yas-global-mode 1)

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
(defun my-auto-tex-cmd ()
  "When exporting from .org with latex, automatically run latex,
pdflatex, or xelatex as appropriate, using latexmk."
  (let ((texcmd)))
  ;; default command: xelatex via latexmk
  (setq texcmd "latexmk -pdf -pdflatex=xelatex %f -outdir=%o -shell-escape")
  ;; xelatex -> .pdf
  (if (string-match "LATEX_CMD: pdflatex" (buffer-string))
      (setq texcmd "latexmk -pdf %f -outdir=%o -shell-escape"))
  ;; LaTeX compilation command
  (setq org-latex-pdf-process (list texcmd)))
(setq org-latex-listings 'minted)
;; (setq org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; Make windmove work in Org mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; Rainbow mode (see colors)
;; (add-hook 'prog-mode-hook 'rainbow-mode)
;; (add-hook 'org-mode-hook 'rainbow-mode)
;; (add-hook 'LaTeX-mode-hook 'rainbow-mode)

;; Increase garbage collection threshold to 20MB
(setq gc-cons-threshold 20000000)

;; Save backup files in /tmp, don't litter my directory
(setq backup-directory-alist '(("." . "~/.emacs_backups")))

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

;; Evil-mode: Make movement keys work like they should for visual lines
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "s") 'save-buffer)

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
(define-key evil-visual-state-map (kbd ";") 'comment-dwim)
(define-key evil-visual-state-map (kbd "q") 'fill-region)



;; Unbind C-y since I want to use it with evil-mc, and I don't want vim-like scrolling
(dolist (map '(evil-motion-state-map
               evil-insert-state-map
               evil-emacs-state-map))
  (define-key (eval map) "\C-y" nil))

(define-key evil-normal-state-map "J" nil)
;; Emojify setup
(use-package emojify
  :config (if (display-graphic-p)
              (setq emojify-display-style 'image)
            (setq emojify-display-style 'unicode)
            )
  (setq emojify-emoji-set "emojione-v2.2.6")
  :init (global-emojify-mode 1))
(use-package emojify
  :commands emojify-mode
  :hook ((after-init . global-emojify-mode))
  :init (setq emojify-emoji-styles '(unicode github ascii)
              emojify-display-style 'image))



;; Auto-indent with the Return key
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Delete trailing whitespace in all modes. Except when editing
;; Markdown, because it uses two trailing blanks as a signal to create
;; a line break.
(add-hook 'before-save-hook '(lambda()
                               (when (not (or (derived-mode-p 'markdown-mode)))
                                 (delete-trailing-whitespace))))

(add-hook 'before-save-hook 'time-stamp)

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
;; (require 'pretty-mode)
;; (global-pretty-mode t)

;; (pretty-deactivate-groups
;;  '(:equality :ordering :ordering-double :ordering-triple
;;              :arrows :arrows-twoheaded :punctuation
;;              :logic :sets))

;; (pretty-activate-groups
;;  '(:sub-and-superscripts :greek :arithmetic-nary))

;; Turn on smooth scrolling. I don't want headaches.
(smooth-scrolling-mode 1)
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

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

(define-key evil-normal-state-map (kbd "=") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "-") 'evil-numbers/dec-at-pt)
;; (global-set-key (kbd "C-c =") 'evil-numbers/inc-at-pt)
;; (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

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
             ("i" . dired-subtree-cycle)))
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

(add-hook 'org-mode-hook 'org-indent-mode)
;; (load-file "~/.emacs.default/elisp/org-habit-plus.el")

;; ───────────────────────── Evil-easymotion ────────────────────────
(evilem-default-keybindings ",")

;; ──────────────────────────── Elpy setup ────────────────────────────
(elpy-enable)

;; ─────────────────────────── Magit setup ──────────────────────────
(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-refresh-status-buffer nil)

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


;; ─────────────────────── Python checker setup ───────────────────────
(add-hook 'python-mode-hook
          (lambda ()
            (setq flycheck-python-pylint-executable "python3")
            (flycheck-add-next-checker 'python-flake8 'python-pylint)))
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-<tab>") #'elpy-black-fix-code)))


;; ─────────────────────── Unbind m  ───────────────────────
;; (define-key evil-normal-state-map (kbd "m") nil)

(define-key evil-normal-state-map (kbd "L")  'windmove-right)
(define-key evil-normal-state-map (kbd "H")  'windmove-left)
(define-key evil-normal-state-map (kbd "K")  'windmove-up)
(define-key evil-normal-state-map (kbd "J")  'windmove-down)


;; ──────────── Key-sequences setup (Key-Chord Dependency) ────────────
;; (load-file "~/.emacs.default/elisp/key-chord.el")
;; (load-file "~/.emacs.default/elisp/key-seq.el")

;; (key-chord-mode 1)
;; (key-seq-define-global "km" 'save-buffer)
;; (key-seq-define-global (kbd "km") (kbd "C-x C-s"))

;; ────────── Use qw to escape from anything and everything ─────────
(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "kj")

;; ──────────────────── Emacs Stuff for Discord ────────────────────
;; (require 'elcord)
;; (elcord-mode)

;; ────────────────── Highlighted Guides for Python ─────────────────
(load-file "~/.emacs.default/elisp/highlight-indent-guides.el")
(add-hook 'elpy-mode-hook 'highlight-indent-guides-mode)
(defun highlight-indent-guides-auto-set-faces-with-frame (frame)
  (with-selected-frame frame
    (highlight-indent-guides-auto-set-faces)))
(if (daemonp)
    (add-hook 'after-make-frame-functions #'highlight-indent-guides-auto-set-faces-with-frame))

;; ────────────────── Bindings for Block Navigation ─────────────────
;; Uncomment when package maintainer fixes recursion depth issue, and
;; edits are made to ~/.emacs.default/elisp/block-nav.el.

;; Maybe this is better done with forward-sexp anyway, and ELPY binds
;; C-down, C-up to the equivalent functions anyway.

;; (load-file "~/.emacs.default/elisp/block-nav.el")
;; (define-key evil-motion-state-map "H" 'block-nav-previous-indentation-level)
;; (define-key evil-motion-state-map "J" 'block-nav-next-block)
;; (define-key evil-motion-state-map "K" 'block-nav-previous-block)
;; (define-key evil-motion-state-map "L" 'block-nav-next-indentation-level)

;; ──────────── Move text around using M-<UP> and M-<DOWN> ────────────
(use-package move-text)
(move-text-default-bindings)

;; ────────────────── Use swiper instead of isearch ─────────────────
(use-package swiper
  :bind (("C-s" . swiper-isearch))
  :bind (("C-S-s" . swiper-isearch-thing-at-point)))

;; ──────────────────────────── Rust Setup ────────────────────────────
(add-hook 'rust-mode-hook 'cargo-minor-mode)
;; (add-hook 'rust-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-<tab>") #'rust-format-buffer)))
(require 'which-key)
(which-key-mode)
(require 'rust-mode)
(use-package lsp-mode
  :hook (rust-mode . lsp)
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  ;; (lsp-eldoc-enable-hover nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-signature-auto-activate nil)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-doc-enable nil))

(use-package company
  :ensure
  :custom
  (company-idle-delay 0.8) ;; how long to wait until popup
  ;; (company-begin-commands nil) ;; uncomment to disable popup
  :bind
  (:map company-active-map
	("C-n". company-select-next)
	("C-p". company-select-previous)
	("M-<". company-select-first)
	("M->". company-select-last)
        ("<tab>". tab-indent-or-complete)
	("TAB". tab-indent-or-complete)))

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))
;; (setq lsp-rust-analyzer-server-display-inlay-hints t)


;; ──────────────── Use M-. to jump to definitions.   ───────────────
;; ────── Configure M-?: sudo apt-get install silversearcher-ag ─────
(use-package smart-jump
  :ensure t
  :config
  (smart-jump-setup-default-registers))

;; ──────────────────────── JavaScript Support ────────────────────────
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; ───────────────────── Fix $PAGER issue in term ─────────────────────
(setenv "PAGER" "cat")

;; ───────────────────────── Matchit using % ────────────────────────
;; (require 'evil-matchit)
;; (global-evil-matchit-mode 1)

;; ─────────────────────────── Org-capture ──────────────────────────
(setq org-capture-templates
      '(
        ("s" "TODO" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/agenda/inbox.org" "Captured")
         "* TODO \nSCHEDULED: %^t\n  %U" :empty-lines 1)
        ("d" "Deadline TODO" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/agenda/inbox.org" "Captured")
         "* TODO \n  DEADLINE: %^t" :empty-lines 1)
        ("p" "Priority" entry (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/agenda/inbox.org" "Captured")
         "* TODO [#A] \n  SCHEDULED: %^t")
        ("j" "Journal" entry (file+datetree "~/journal/log.org")
         "* %U\n")))



(add-to-list 'org-latex-classes
             '("org-report"
               "\\documentclass{report}
         [DEFAULT-PACKAGES]
         [PACKAGES]
         [EXTRA]"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))



;; (if (not (daemonp))
;;     (centaur-tabs-mode)

;;   (defun centaur-tabs-daemon-mode (frame)
;;     (unless (and (featurep 'centaur-tabs) (centaur-tabs-mode-on-p))
;;       (run-at-time nil nil (lambda () (centaur-tabs-mode)))))
;;   (add-hook 'after-make-frame-functions #'centaur-tabs-daemon-mode))

;; (use-package centaur-tabs
;;   :config
;;   (setq centaur-tabs-style "bar"
;;         centaur-tabs-height 32
;;         centaur-tabs-enable-key-bindings t
;;         centaur-tabs-set-icons t
;;         centaur-tabs-cycle-scope 'tabs
;;         centaur-tabs-set-bar 'over)
;;   (centaur-tabs-headline-match)
;;   (setq centaur-tabs-gray-out-icons 'buffer)
;;   ;; (centaur-tabs-enable-buffer-reordering)
;;   ;; (setq centaur-tabs-adjust-buffer-order t)
;;   (setq uniquify-separator "/")
;;   (setq uniquify-buffer-name-style 'forward)
;;   (defun centaur-tabs-buffer-groups ()
;;     "`centaur-tabs-buffer-groups' control buffers' group rules.

;;  Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
;;  All buffer name start with * will group to \"Emacs\".
;;  Other buffer group by `centaur-tabs-get-group-name' with project name."
;;     (list
;;      (cond
;;       ;; ((not (eq (file-remote-p (buffer-file-name)) nil))
;;       ;; "Remote")
;;       ((or (string-equal "*" (substring (buffer-name) 0 1))
;;            (memq major-mode '(magit-process-mode
;;                               magit-status-mode
;;                               magit-diff-mode
;;                               magit-log-mode
;;                               magit-file-mode
;;                               magit-blob-mode
;;                               magit-blame-mode
;;                               )))
;;        "Emacs")
;;       ((derived-mode-p 'prog-mode)
;;        "Editing")
;;       ((derived-mode-p 'dired-mode)
;;        "Dired")
;;       ((memq major-mode '(helpful-mode
;;                           help-mode))
;;        "Help")
;;       ((memq major-mode '(org-mode
;;                           org-agenda-clockreport-mode
;;                           org-src-mode
;;                           org-agenda-mode
;;                           org-beamer-mode
;;                           org-indent-mode
;;                           org-bullets-mode
;;                           org-cdlatex-mode
;;                           org-agenda-log-mode
;;                           TeX-mode
;;                           tex-mode
;;                           latex-mode
;;                           LaTeX-mode
;;                           markdown-mode
;;                           markdown-view-mode
;;                           diary-mode))
;;        "Markup")
;;       (t
;;        (centaur-tabs-get-group-name (current-buffer))))))
;;   :hook
;;   (dashboard-mode . centaur-tabs-local-mode)
;;   (term-mode . centaur-tabs-local-mode)
;;   (calendar-mode . centaur-tabs-local-mode)
;;   (org-agenda-mode . centaur-tabs-local-mode)
;;   (helpful-mode . centaur-tabs-local-mode)
;;   :bind
;;   (:map evil-normal-state-map
;;         ("g t" . centaur-tabs-forward)
;;         ("g T" . centaur-tabs-backward)))


;; ────────────────────── Website Python Script ─────────────────────
(defun org-outline-overlay-data (&optional use-markers)
  "Return a list of the locations of all outline overlays.
These are overlays with the `invisible' property value `outline'.
The return value is a list of cons cells, with start and stop
positions for each overlay.
If USE-MARKERS is set, return the positions as markers."
  (let (beg end)
    (org-with-wide-buffer
     (delq nil
           (mapcar (lambda (o)
                     (when (eq (overlay-get o 'invisible) 'outline)
                       (setq beg (overlay-start o)
                             end (overlay-end o))
                       (and beg end (> end beg)
                            (if use-markers
                                (cons (copy-marker beg)
                                      (copy-marker end t))
                              (cons beg end)))))
                   (overlays-in (point-min) (point-max)))))))

(defun org-set-outline-overlay-data (data)
  "Create visibility overlays for all positions in DATA.
DATA should have been made by `org-outline-overlay-data'."
  (org-with-wide-buffer
   (org-show-all)
   (dolist (c data) (org-flag-region (car c) (cdr c) t 'outline))))

(defvar-local my-org-outline-state nil
  "Place for saving org outline state before reverting the buffer.")

(put 'my-org-outline-state 'permanent-local t)

(defun my-org-save-outline-state ()
  "Save org outline state in `my-org-outline-state'.
It can be recovered afterwards with `my-org-recover-outline-state'."
  (setq my-org-outline-state (org-outline-overlay-data t)))

(defun my-org-restore-outline-state ()
  "Save org outline state in `my-org-outline-state'.
It can be recovered afterwards with `my-org-recover-outline-state'."
  (when my-org-outline-state
    (org-set-outline-overlay-data my-org-outline-state)
    (setq my-org-outline-state nil)))

(defun my-org-install-save-outline-state ()
  "Configure org to preserve the outline state at revert-buffer."
  (add-hook 'before-revert-hook #'my-org-save-outline-state nil t)
  (add-hook 'after-revert-hook #'my-org-restore-outline-state nil t))

(add-hook 'org-mode-hook #'my-org-install-save-outline-state)

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(defun calculate-reading-time (backend)
  "Find the reading time of input file and add it to the right spot. (BACKEND)."
  (interactive "p")
  (when (string-equal "index.org" (file-name-nondirectory buffer-file-name))
    (shell-command-to-string (format "python3 ~/.emacs.default/scripts/reading_length.py %s"
                                     buffer-file-name))))

(add-hook 'org-export-before-processing-hook #'calculate-reading-time)


(load-file "~/.emacs.default/elisp/ob-racket.el")
(append '((racket . t) (scribble . t)) org-babel-load-languages)

;; ;; Timestamp stuff
;; (add-to-list 'org-export-filter-timestamp-functions
;;              #'endless/filter-timestamp)
;; (defun endless/filter-timestamp (trans back _comm)
;;   "Remove <> around time-stamps."
;;   (pcase back
;;     ((or `jekyll `html)
;;      (replace-regexp-in-string "&[lg]t;" "" trans))
;;     (`latex
;;      (replace-regexp-in-string "[<>]" "" trans))))

;; (setq-default org-display-custom-times t)
;; ;;; Before you ask: No, removing the <> here doesn't work.
;; (setq org-time-stamp-custom-formats
;;       '("<%a %d %B %Y>" . "<%Y-%m-%d %H:%M>"))


;; Some fixes for OSX's piece of shit window manager that's
;; unconfigurable, rigid, and proprietary. Why do I use Mac OS X? What
;; is wrong with me?
;; Shamelessly stolen from emacs-everywhere by tecosaur

;; some AppleScript file that needs to be executed


;; (defun emacs-everywhere-ensure-oscascript-compiled (&optional force)
;;   "Ensure that compiled oscascript files are present.
;; Will always compile when FORCE is non-nil."
;;   (unless (file-exists-p "app-name")
;;     (let ((default-directory (file-name-directory load-file-name))
;;           (app-name
;;            "tell application \"System Events\"
;;     set frontAppName to name of first application process whose frontmost is true
;; end tell
;; return frontAppName"))

;;       (dolist (script `(("app-name" . ,app-name)
;;                         ;; ("window-geometry" . ,window-geometry)
;;                         ;; ("window-title" . ,window-title))
;;                       )
;;         (write-region (cdr script) nil (concat (car script) ".applescript"))
;;         (shell-command (format "osacompile -r scpt:128 -t osas -o %s %s"
;;                                (car script) (concat (car script) ".applescript")))))))

;; ────────────────────────────── Eshell ──────────────────────────────
(require 'eshell)

(defun my-custom-func ()
  (when (not (one-window-p))
    (delete-window)))

(advice-add 'eshell-life-is-too-much :after 'my-custom-func)

;; ─────────────────────── Dim inactive buffers ───────────────────────
(use-package dimmer
  :custom (dimmer-fraction 0.2)
  :config (dimmer-mode))

;; ───────────────── Fix Dired's New Buffer Behavior ────────────────
(defun dired-up-directory-same-buffer ()
  "Go up in the same buffer."
  (find-alternate-file ".."))

(defun my-dired-mode-hook ()
  (put 'dired-find-alternate-file 'disabled nil) ; Disables the warning.
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "^") 'dired-up-directory-same-buffer))

(add-hook 'dired-mode-hook #'my-dired-mode-hook)

(setq dired-use-ls-dired nil)

;; ──────────────── Deal with long lines the right way ────────────────
(global-so-long-mode)


;; ─────────────── Fine, I give in. I'll Use Which-Key ──────────────
(use-package which-key
  :custom
  (which-key-setup-side-window-bottom)
  (which-key-enable-extended-define-key t)
  :config
  (which-key-setup-minibuffer))

;; ──────────────────── Better minibuffer quitting ────────────────────
(bind-key "C-S-g" #'abort-recursive-edit)



;; ────────────────────── Nice org-html pasting ─────────────────────
(defun org-html-yank()
  "Convert clipboard contents from HTML to Org and then paste (yank)."
  (interactive)
  (kill-new (shell-command-to-string "osascript -e 'the clipboard as \"HTML\"' | perl -ne 'print chr foreach unpack(\"C*\",pack(\"H*\",substr($_,11,-3)))' | pandoc -f html -t json | pandoc -f json -t org | sed 's/ / /g'"))
  (yank))


;; ─────────────────────── Wavedrom Org Support ───────────────────────
;; Alternately, use wavedrom-cli over wavedrompy (less strict JSON)
(defun org-babel-execute:json (body params)
  "Execute a block of Wavedrom-JSON code with org-babel. BODY PARAMS."
  (let ((in-file (org-babel-temp-file "wd" ".json")))
    (with-temp-file in-file
      (insert body))
    (org-babel-eval
     (format "wavedrompy --input %s | inkscape --pipe --export-filename=- --export-type=pdf"
             (org-babel-process-file-name in-file)) "")))


;; ──────────────────────────── LLVM Modes ────────────────────────────
(setq load-path
      (cons (expand-file-name "~/.emacs.default/llvm-utils") load-path))
(require 'llvm-mode)
(require 'tablegen-mode)

;; HTML export theme
;; (defvar my-org-html-export-theme 'doom-one-light)

;; (defun my-with-theme (orig-fun &rest args)
;;   (load-theme my-org-html-export-theme)
;;   (unwind-protect
;;       (apply orig-fun args)
;;     (disable-theme my-org-html-export-theme)))

;; (with-eval-after-load "ox-html"
;;   (advice-add 'org-export-to-buffer :around 'my-with-theme))

;; ───────────────────────── Custom set stuff ─────────────────────────
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#000000" :foreground "#f9f9f9" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Source Code Pro"))))
 '(centaur-tabs-default ((t (:background "#141621" :foreground "#141621" :box nil))))
 '(font-lock-comment-face ((t (:italic t :foreground "brown"))))
 '(hl-line ((t (:extend t :background "#141614"))))
 '(mode-line ((t (:background "#0e1019"))))
 '(org-block ((t (:extend t :background "#09090d")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#21252B" "#E06C75" "#98C379" "#E5C07B" "#61AFEF" "#C678DD" "#56B6C2" "#ABB2BF"])
 '(blink-cursor-alist nil)
 '(blink-cursor-interval 0.6)
 '(case-fold-search t)
 '(centaur-tabs-auto-hide t)
 '(centaur-tabs-show-count t)
 '(column-number-mode t)
 '(comint-scroll-show-maximum-output t)
 '(current-language-environment "UTF-8")
 '(custom-safe-themes
   '("66bdbe1c7016edfa0db7efd03bb09f9ded573ed392722fb099f6ac6c6aefce32" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e" "f6665ce2f7f56c5ed5d91ed5e7f6acb66ce44d0ef4acfaa3a42c7cfe9e9a9013" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" "da53441eb1a2a6c50217ee685a850c259e9974a8fa60e899d393040b4b8cc922" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "d6844d1e698d76ef048a53cefe713dbbe3af43a1362de81cdd3aefa3711eae0d" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "82360e5f96244ce8cc6e765eeebe7788c2c5f3aeb96c1a765629c5c7937c0b5b" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "d1af5ef9b24d25f50f00d455bd51c1d586ede1949c5d2863bef763c60ddf703a" "5b7c31eb904d50c470ce264318f41b3bbc85545e4359e6b7d48ee88a892b1915" "614a8fc7db02cb99d9f1acf1297b26f8224cf80bf6c0ec31d30c431503e8b59f" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "0d456bc74e0ffa4bf5b69b0b54dac5104512c324199e96fc9f3a1db10dfa31f3" "27b97024320d223cbe0eb73104f2be8fcc55bd2c299723fc61d20057f313b51c" default))
 '(default-input-method "rfc1345")
 '(delete-selection-mode t)
 '(dimmer-fraction 0.2)
 '(display-battery-mode t)
 '(display-line-numbers 'relative)
 '(display-line-numbers-major-tick 0)
 '(doc-view-continuous t)
 '(doc-view-resolution 400)
 '(doom-modeline-bar-width 6)
 '(doom-modeline-enable-word-count t)
 '(doom-modeline-height 36)
 '(ediff-make-buffers-readonly-at-startup t)
 '(elcord-display-buffer-details nil)
 '(elcord-display-elapsed nil)
 '(elcord-editor-icon nil)
 '(elcord-mode t nil (elcord))
 '(emacs-everywhere-paste-command t)
 '(emacs-everywhere-paste-p t)
 '(emojify-emoji-set "emojione-v2.2.6-22")
 '(evil-undo-system 'undo-tree)
 '(evil-want-keybinding nil)
 '(evil-want-minibuffer nil)
 '(exwm-floating-border-color "#d7d5d1")
 '(fci-rule-color "#405A61")
 '(flycheck-pycheckers-checkers '(pylint))
 '(flycheck-pycheckers-ignore-codes
   '("C0301" "C0326" "C0325" "C0411" "C0413" "C0103" "C0111" "W0142" "W0201" "W0232" "W0403" "W0511" "E1002" "E1101" "E1103" "R0201" "R0801" "R0903" "R0904" "R0914"))
 '(flycheck-python-pylint-executable nil)
 '(global-font-lock-mode t nil (font-lock))
 '(highlight-indent-guides-auto-character-face-perc 10)
 '(highlight-indent-guides-auto-enabled t)
 '(highlight-indent-guides-method 'character)
 '(highlight-indent-guides-responsive 'top)
 '(highlight-indentation-blank-lines nil)
 '(highlight-tail-colors ((("#343333") . 0) (("#343333") . 20)))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
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
     ("\\?\\?\\?+" . "#dc752f")))
 '(ido-auto-merge-delay-time 1.5)
 '(ido-mode 'both nil (ido))
 '(initial-scratch-message "*Nebhrajani A.'s scratch buffer. You shouldn't be here.*
")
 '(jdee-db-active-breakpoint-face-colors (cons "#073642" "#268bd2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#073642" "#859900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#073642" "#56697A"))
 '(keyboard-coding-system 'utf-8-unix)
 '(linum-relative-current-symbol "")
 '(lpr-command "lp")
 '(lsp-keymap-prefix "s-l")
 '(max-lisp-eval-depth 10000)
 '(objed-cursor-color "#dc322f")
 '(org-agenda-files
   '("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/agenda/inbox.org"))
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-window-setup 'reorganize-frame)
 '(org-babel-haskell-compiler "ghc")
 '(org-babel-load-languages
   '((C . t)
     (python . t)
     (emacs-lisp . t)
     (haskell . t)
     (java . t)
     (shell . t)))
 '(org-babel-python-command "python3")
 '(org-cite-export-processors '((t basic nil nil)))
 '(org-confirm-babel-evaluate nil)
 '(org-ellipsis "⤵")
 '(org-export-date-timestamp-format "%A %d %h %Y")
 '(org-export-latex-packages-alist
   '(("a4paper, total={6in, 9in}" "geometry" nil)
     ("" "amsmath" nil)
     ("" "tabulary" nil)))
 '(org-export-with-smart-quotes t)
 '(org-html-postamble t)
 '(org-html-postamble-format
   '(("en" "<hr><p style=\"font-size: 75%%\">Created in GNU %c.</p>")))
 '(org-latex-classes
   '(("org-report" "\\documentclass{report}
         [DEFAULT-PACKAGES]
         [PACKAGES]
         [EXTRA]"
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("extarticle" "\\documentclass{extarticle}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("article" "\\documentclass[11pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
 '(org-latex-compiler "xelatex")
 '(org-latex-default-class "article")
 '(org-latex-default-packages-alist
   '(("AUTO" "inputenc" t
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
     ("" "amsthm" nil nil)
     ("" "capt-of" nil nil)
     ("" "hyperref" nil nil)
     ("" "geometry" nil nil)
     ("" "siunitx" nil nil)
     ("" "dsfont" nil nil)))
 '(org-latex-logfiles-extensions
   '("aux" "bcf" "blg" "fdb_latexmk" "fls" "figlist" "idx" "log" "nav" "out" "ptc" "run.xml" "snm" "toc" "vrb" "xdv" "tex" "_minted*"))
 '(org-latex-minted-langs
   '((python "python")
     (emacs-lisp "common-lisp")
     (cc "c++")
     (cperl "perl")
     (shell-script "bash")
     (caml "ocaml")))
 '(org-latex-packages-alist '(("" "booktabs" nil) ("cache=false" "minted" nil)))
 '(org-latex-pdf-process (my-auto-tex-cmd))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-eww ol-gnus org-habit org-habit-plus ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-timer-default-timer 10)
 '(package-selected-packages
   '(cmake-mode ox-hugo ob-sagemath pdf-tools vterm which-key-posframe rainbow-mode evil-collection format-all which-key dimmer haskell-mode sage-shell-mode citar org yaml-mode emacs-everywhere csv csv-mode json-mode exec-path-from-shell writegood-mode lispy lispyville racket-mode ido-vertical-mode centaur-tabs latex-math-preview buffer-move selectric-mode emojify adaptive-wrap theme-magic dart-mode lsp-mode dad-joke key-chord key-seq js2-mode doom-modeline company-box ag smart-jump flycheck-rust racer swiper cargo rust-mode powerthesaurus move-text gnu-elpa-keyring-update gnu-elpa flycheck-aspell highlight-indent-guides minimap elcord evil-escape evil-leader company-fuzzy web-mode company-quickhelp atom-one-dark-theme atom-dark-theme laguna-theme doom-themes treemacs-all-the-icons twittering-mode spotify evil-mc-extras evil-magit treemacs-magit company-try-hard company-statistics elpy auctex evil-easymotion floobits common-lisp-snippets caps-lock cdlatex bbdb gnuplot-mode gnuplot dired-open dired-rainbow dired-subtree treemacs-icons-dired treemacs-evil treemacs company-emoji howdoyou zone-nyan chess flycheck-pycheckers fancy-battery spaceline smartparens ztree zone-quotes zone-matrix yasnippet-snippets xkcd xbm-life writeroom-mode whole-line-or-region use-package typing-game theme-changer spacemacs-theme smooth-scrolling smooth-scroll smex smart-mode-line-powerline-theme simple-mpc shell-pop restart-emacs rainbow-delimiters pretty-symbols pretty-mode powerline-evil ox-twbs org-pomodoro org-evil org-bullets nadvice htmlize guess-language gh-md flymd flycheck-color-mode-line eww-lnum evil-surround evil-numbers evil-mc evil-macros evil-commentary emojify-logos emms easy-kill distinguished-theme dired-hacks-utils dakrone-theme company-web company-math company-c-headers company-bibtex company-auctex browse-kill-ring beacon autopair all-the-icons ahungry-theme academic-phrases 2048-game))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#262626"))
 '(powerline-default-separator 'wave)
 '(powerline-default-separator-dir '(right . right))
 '(powerline-height nil)
 '(printer-name "sjc06-02-c612-c")
 '(ps-lpr-command "lp")
 '(python-shell-interpreter "python3")
 '(rustic-ansi-faces
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(safe-local-variable-values '((emacs-lisp-docstring-fill-column . 75)))
 '(shell-pop-shell-type
   '("terminal" "*terminal*"
     (lambda nil
       (vterm shell-pop-term-shell))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 40)
 '(show-paren-delay 0)
 '(show-paren-mode t nil (paren))
 '(size-indication-mode t)
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
 '(undo-tree-enable-undo-in-region t)
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
 '(vc-annotate-very-old-color nil)
 '(vterm-shell "/bin/zsh")
 '(which-key-enable-extended-define-key t t)
 '(which-key-setup-side-window-bottom nil t))

(use-package evil-mc
  :load-path "~/.emacs.default/elpa/evil-mc-20200228.1535/")

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
