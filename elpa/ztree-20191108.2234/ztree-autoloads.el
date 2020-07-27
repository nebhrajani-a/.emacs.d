;;; ztree-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ztree-diff ztreediff-mode) "ztree-diff" "ztree-diff.el"
;;;;;;  (24299 12820 976101 179000))
;;; Generated autoloads from ztree-diff.el

(autoload 'ztreediff-mode "ztree-diff" "\
A minor mode for displaying the difference of the directory trees in text mode.

\(fn &optional ARG)" t nil)

(autoload 'ztree-diff "ztree-diff" "\
Create an interactive buffer with the directory tree of the path given.
Argument DIR1 left directory.
Argument DIR2 right directory.

\(fn DIR1 DIR2)" t nil)

;;;***

;;;### (autoloads (ztree-dir) "ztree-dir" "ztree-dir.el" (24299 12820
;;;;;;  992101 180000))
;;; Generated autoloads from ztree-dir.el

(autoload 'ztree-dir "ztree-dir" "\
Create an interactive buffer with the directory tree of the PATH given.

\(fn PATH)" t nil)

;;;***

;;;### (autoloads (ztree-view-on-window-configuration-changed ztree-mode)
;;;;;;  "ztree-view" "ztree-view.el" (24299 12820 988101 180000))
;;; Generated autoloads from ztree-view.el

(autoload 'ztree-mode "ztree-view" "\
A major mode for displaying the directory tree in text mode.

\(fn)" t nil)

(autoload 'ztree-view-on-window-configuration-changed "ztree-view" "\
Hook called then window configuration changed to resize buffer's contents

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("ztree-diff-model.el" "ztree-pkg.el" "ztree-util.el"
;;;;;;  "ztree.el") (24299 12821 17876 923000))

;;;***

(provide 'ztree-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ztree-autoloads.el ends here
