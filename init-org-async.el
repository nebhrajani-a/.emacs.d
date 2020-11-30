(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

(setq user-full-name "Nebhrajani A.V.")
(setq user-mail-address "aditya.v.nebhrajani@gmail.com")
(require 'org) ;; loads from site lisp
(require 'ox)
(require 'cl)  ;; stupid bug in one of the org-packages?
(setq org-export-async-debug nil)
(defun ask-user-about-lock (file opponent) "Always steal lock." t)
