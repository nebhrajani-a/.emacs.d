;How to Install Verilog-Mode for Emacs
;
;OK, you want to use the verilog emacs mode, but have never used emacs, or
;always had some one else do the messy set up details. Here is a step by step
;ecipe for installing the verilog-mode:
;
; 1.  Take the mail message your received, and save it into a file.
;
; 2.  Edit the file, deleting everything before the line:
;
;     ;;; verilog-mode.el --- major mode for editing verilog source in
;     Emacs
;
; 3.  Make a directory called elisp in your home directory.
;
; 4.  put the file you've just edited in this directory, and call the file
;
;    verilog-mode.el
;
; 5.  edit the file .emacs in your home directory. Create this file if it does
;     not already exist.
;
; 6.  Add the lines below (starting with (defun) to that file. Then run a new
;     emacs process. You are all set; this new emacs and all subsequent emacses
;    now will know about verilog files and how to indent them, and colorize
;     them.
;
;To learn more about how to use emacs, type control-h t to this emacs process;
;it will lead you through a step by step tutorial about emacs.
;
;Take heart; The learning curve is steep; but the view from the top is
;wonderful!

;-------------------------------------------------------------------------------

(defun prepend-path ( my-path )
  (setq load-path (cons (expand-file-name my-path) load-path)))

(defun append-path ( my-path )
  (setq load-path (append load-path (list (expand-file-name my-path)))))

(setq emacs-minor-version 19)

(prepend-path "~/emacs")

(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(setq auto-mode-alist (cons  '("\\.v\\'" . verilog-mode) auto-mode-alist))

(defvar background-mode 'light)
(defvar display-type 'color)
  ;; figure out background color.  We could ask the user, but that would be too easy
(cond
 ((and
   (fboundp 'device-type)
   (string= "x" (device-type)))
  (setq display-type (device-class)
        background-mode
        (condition-case nil
            (let ((bg-resource (x-get-resource ".backgroundMode" "BackgroundMode" 'string))
                  (params (frame-parameters)))
              (cond (bg-resource (intern (downcase bg-resource)))
                    ((and (cdr (assq 'background-color params))
                          (< (apply '+ (x-color-values
                                        (cdr (assq 'background-color params))))
                             (/ (apply '+ (x-color-values "white")) 3)))
                     'dark)
                    ((and (cdr (assq 'border-color params))
                          (> (apply '+ (color-instance-rgb-components
                                        (make-color-instance (cdr (assq 'border-color params)))))
                             (/ 255 3)))
                     'dark)
                    (t 'light)))
          (error 'light))
        )
  )
 ((and
   (boundp 'window-system)
   (string= window-system "x"))
  (setq display-type
        (condition-case nil
            (let ((display-resource (x-get-resource ".displayType" "DisplayType")))
              (cond (display-resource (intern (downcase display-resource)))
                    ((x-display-color-p) 'color)
                    ((x-display-grayscale-p) 'grayscale)
                    (t 'mono)))
          (error 'mono))
        )
  (setq background-mode
        (condition-case nil
            (let ((bg-resource (x-get-resource ".backgroundMode"
                                               "BackgroundMode" ))
                  (params (frame-parameters)))
              (cond (bg-resource (intern (downcase bg-resource)))
                    ((and (cdr (assq 'background-color params))
                          (< (apply '+ (x-color-values
                                        (cdr (assq 'background-color params))))
                             (/ (apply '+ (x-color-values "white")) 3)))
                     'dark)
                    ((and (fboundp 'color-instance-rgb-components )
                          (cdr (assq 'border-color params))
                          (> (apply '+ (color-instance-rgb-components
                                        (make-color-instance (cdr (assq 'border-color params)))))
                             (/ 255 3)))
                     'dark)
                    (t 'light)))
          (error 'light))
        )
  ))

(message "It appears you have a %s background" background-mode)

 ; Now do emacs version specific color setup
(cond
 ((and (string-match "GNU Emacs" emacs-version)
       (boundp 'emacs-major-version)
       (= emacs-major-version 19)
       (>= emacs-minor-version 12))

  ;; If you want the default colors, you could do this:
  ;; (setq font-lock-use-default-fonts nil)
  ;; (setq font-lock-use-default-colors t)
  ;; but I want to specify my own colors, so I turn off all
  ;; default values.
  (setq font-lock-use-default-fonts nil)
  (setq font-lock-use-default-colors nil)
  (require 'font-lock)

  ;; Mess around with the faces a bit.  Note that you have
  ;; to change the font-lock-use-default-* variables *before*
  ;; loading font-lock, and wait till *after* loading font-lock
  ;; to customize the faces.

  ;; (use copy-face instead of make-face-italic/make-face-bold because
  ;; the startup code does intelligent things to the 'italic and 'bold
  ;; faces to ensure that they are different from the default face.
  ;; For example, if the default face is bold, then the 'bold face
  ;; will be unbold.)
  ;; Underling comments looks terrible on tty's
  (set-face-underline-p 'font-lock-comment-face nil 'global 'tty)
  (set-face-highlight-p 'font-lock-comment-face t 'global 'tty)

  (make-face-unitalic 'font-lock-comment-face)
  (make-face-unitalic 'font-lock-string-face)
  (copy-face 'bold 'font-lock-function-name-face)
  (cond
   ((eq background-mode 'light)
    (set-face-foreground 'font-lock-comment-face "orchid")
    (set-face-foreground 'font-lock-function-name-face "red")
    (set-face-foreground 'font-lock-keyword-face "blue")
    (set-face-foreground 'font-lock-string-face  "steelblue")
    (set-face-foreground 'font-lock-type-face    "darkgreen")
    )
   ((eq background-mode 'dark)
    (set-face-foreground 'font-lock-comment-face "#efc80c")
    (set-face-foreground 'font-lock-function-name-face "red")
    (set-face-foreground 'font-lock-keyword-face "tan")
    (set-face-foreground 'font-lock-string-face  "lightskyblue")
    (set-face-foreground 'font-lock-type-face    "Aquamarine")
    )
   )
  ;; misc. faces
  (and (find-face 'font-lock-preprocessor-face) ; 19.13 and above
       (copy-face 'bold 'font-lock-preprocessor-face))
  )
   ((> emacs-minor-version 29)
    (if (eq background-mode 'light)
        (setq font-lock-face-attributes
              '(
                (font-lock-comment-face "orchid"                nil nil t   nil)
                (font-lock-function-name-face "red"             nil t   nil nil)
                (font-lock-keyword-face "blue"          nil nil nil nil)
                (font-lock-reference-face "indianred"         nil t nil nil  )
                (font-lock-string-face  "steelblue"     nil nil nil nil)
                (font-lock-type-face      "darkgreen"          nil nil nil nil)
                (font-lock-variable-name-face "brown")
                )
              )
      (setq font-lock-face-attributes
              '(
                (font-lock-comment-face "#efc80c"               nil nil t   nil)
                (font-lock-function-name-face "red"             nil t   nil nil)
                (font-lock-keyword-face "tan"           nil nil nil nil)
                (font-lock-reference-face "indianred"         nil t nil nil  )
                (font-lock-string-face  "lightskyblue"  nil nil nil nil)
                (font-lock-type-face      "Aquamarine"          nil nil nil nil)
                (font-lock-variable-name-face "LightGoldenrod")
                )
              )
      )
    )
   (t
    (if (eq background-mode 'dark)
        (progn
          (make-face 'my-font-lock-function-name-face)
          (set-face-foreground 'my-font-lock-function-name-face "red")
          (setq  font-lock-function-name-face  'my-font-lock-function-name-face)

          (make-face 'my-font-lock-keyword-face)
          (set-face-foreground 'my-font-lock-keyword-face "tan")
          (setq  font-lock-keyword-face  'my-font-lock-keyword-face)

          (make-face 'my-font-lock-string-face)
          (set-face-foreground 'my-font-lock-string-face      "lightskyblue")
          (setq  font-lock-string-face  'my-font-lock-string-face)

          (make-face 'my-font-lock-type-face)
          (set-face-foreground 'my-font-lock-type-face        "#efc80c") ; yellow
          (setq  font-lock-type-face  'my-font-lock-type-face)

          (make-face 'my-font-lock-variable-name-face)
          (set-face-foreground 'my-font-lock-variable-name-face "LightGoldenrod")
          (setq  font-lock-variable-name-face  'my-font-lock-variable-name-face)
          )
      (progn
        (make-face 'my-font-lock-function-name-face)
        (set-face-foreground 'my-font-lock-function-name-face "DarkGreen")
        (setq  font-lock-function-name-face  'my-font-lock-function-name-face)

        (make-face 'my-font-lock-keyword-face)
        (set-face-foreground 'my-font-lock-keyword-face "indianred")
        (setq  font-lock-keyword-face  'my-font-lock-keyword-face)

        (make-face 'my-font-lock-string-face)
        (set-face-foreground 'my-font-lock-string-face      "RoyalBlue")
        (setq  font-lock-string-face  'my-font-lock-string-face)

        (make-face 'my-font-lock-type-face)
        (set-face-foreground 'my-font-lock-type-face        "#003800") ; yellow
        (setq  font-lock-type-face  'my-font-lock-type-face)

        (make-face 'my-font-lock-variable-name-face)
        (set-face-foreground 'my-font-lock-variable-name-face "LightGoldenrod")
        (setq  font-lock-variable-name-face  'my-font-lock-variable-name-face)
        )
      )
    )
 )

(cond
 ((eq display-type 'color)
  ;; Pretty Colors in source windows.
  (require 'font-lock)
  (autoload 'turn-on-fast-lock "fast-lock"
    "Unconditionally turn on Fast Lock mode.")
  (add-hook 'c-mode-hook 'font-lock-mode)
  (add-hook 'verilog-mode-hook 'font-lock-mode)
  (add-hook 'perl-mode-hook 'font-lock-mode)
  (add-hook 'elisp-mode-hook 'font-lock-mode)
  (add-hook 'asm-mode-hook 'font-lock-mode)
  (setq fast-lock-cache-directories '("~/.backups" "."))
  (setq c-font-lock-keywords c-font-lock-keywords-2)
;  (setq c++-font-lock-keywords c++-font-lock-keywords-2)
  (autoload 'verilog-make-faces "verilog-mode" "Set up faces for verilog")
  (if (not (string-match "XEmacs" emacs-version))
      (progn
        (cond
         ((eq background-mode 'dark)
          ;; Make background a light gray
          (set-face-background (quote region) "gray30"))
         ;; Make background a dark gray
         ((eq background-mode 'light)
          (set-face-background (quote region) "gray70"))
         )
        )
    )
  )
 ((eq display-type 'mono)
  (progn
    ;; Frames are too expensive to create
    ;; on my NCD running x-remote, which happens
    ;; to be the only place I run X mono color
    (setq vm-frame-per-composition nil
          vm-frame-per-folder nil)
    )
  )
 )
