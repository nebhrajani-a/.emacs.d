;;; ghub-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "ghub" "ghub.el" (24350 44536 772576 586000))
;;; Generated autoloads from ghub.el

(autoload 'ghub-clear-caches "ghub" "\
Clear all caches that might negatively affect Ghub.

If a library that is used by Ghub caches incorrect information
such as a mistyped password, then that can prevent Ghub from
asking the user for the correct information again.

Set `url-http-real-basic-auth-storage' to nil
and call `auth-source-forget+'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("buck.el" "ghub-graphql.el" "ghub-pkg.el"
;;;;;;  "glab.el" "gogs.el" "gsexp.el" "gtea.el") (24350 44536 796576
;;;;;;  521000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ghub-autoloads.el ends here
