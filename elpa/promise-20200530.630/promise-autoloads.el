;;; promise-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "promise" "promise.el" (24304 16022 199569
;;;;;;  726000))
;;; Generated autoloads from promise.el

(autoload 'promise-chain "promise" "\
Extract PROMISE, BODY include then, catch, done and finally.

Extract the following code...

    (promise-chain (promise-new ...)
      (then
       (lambda (value)
         ...))

      (catch
       (lambda (reason)
         ...))

      (done
       (lambda (value)
         ...))

      (finally
       (lambda () ...))

as below.

    (let ((promise (promise-new ...)))
      (setf promise (promise-then promise
                                  (lambda (value)
                                    ...)))

      (setf promise (promise-catch promise
                                   (lambda (value)
                                     ...)))

      (setf promise (promise-done promise
                                  (lambda (reason)
                                    ...)))

      (setf promise (promise-finally promise
                                     (lambda ()
                                       ...)))
      promise)

\(fn PROMISE &rest BODY)" nil t)

(function-put 'promise-chain 'lisp-indent-function '1)

;;;***

;;;### (autoloads nil nil ("promise-core.el" "promise-done.el" "promise-es6-extensions.el"
;;;;;;  "promise-finally.el" "promise-pkg.el" "promise-rejection-tracking.el")
;;;;;;  (24304 16022 259569 618000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; promise-autoloads.el ends here
