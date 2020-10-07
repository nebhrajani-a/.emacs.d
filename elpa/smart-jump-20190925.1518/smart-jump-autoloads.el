;;; smart-jump-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "smart-jump" "smart-jump.el" (24445 20598 854620
;;;;;;  186000))
;;; Generated autoloads from smart-jump.el

(autoload 'smart-jump-setup-default-registers "smart-jump" "\
Register a default set of modes for `smart-jump'.

\(fn)" t nil)

(autoload 'smart-jump-diag "smart-jump" "\
Pop a buffer with information about `smart-jump'.

\(fn)" t nil)

(autoload 'smart-jump-peek "smart-jump" "\
Peek at definition.

\(fn)" t nil)

(autoload 'smart-jump-go "smart-jump" "\
Go to the function/variable declartion for thing at point.

SMART-LIST will be set (or nil) if this is a continuation of a previous jump.

CONTINUE will be non nil if this is a continuation of a previous jump.

\(fn &optional SMART-LIST CONTINUE)" t nil)

(autoload 'smart-jump-back "smart-jump" "\
Jump back to where the last jump was done.

\(fn)" t nil)

(autoload 'smart-jump-references "smart-jump" "\
Find references with fallback.
Optional argument SMART-LIST This will be non-nil of continuation of previous
call to `smart-jump-references'.

CONTINUE will be set if this is a continuation of a previous call to
`smart-jump-references'.

\(fn &optional SMART-LIST CONTINUE)" t nil)

;;;***

;;;### (autoloads nil "smart-jump-cc-mode" "smart-jump-cc-mode.el"
;;;;;;  (24445 20598 866620 201000))
;;; Generated autoloads from smart-jump-cc-mode.el

(autoload 'smart-jump-cc-mode-register "smart-jump-cc-mode" "\
Register `cc-mode' for `smart-jump'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-clojure-mode" "smart-jump-clojure-mode.el"
;;;;;;  (24445 20598 754620 66000))
;;; Generated autoloads from smart-jump-clojure-mode.el

(autoload 'smart-jump-clojure-mode-register "smart-jump-clojure-mode" "\
Register `clojure-mode' for `smart-jump'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-csharp-mode" "smart-jump-csharp-mode.el"
;;;;;;  (24445 20598 766620 79000))
;;; Generated autoloads from smart-jump-csharp-mode.el

(autoload 'smart-jump-csharp-mode-register "smart-jump-csharp-mode" "\
Register `smart-jump' for `csharp-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-eglot" "smart-jump-eglot.el" (24445
;;;;;;  20598 798620 119000))
;;; Generated autoloads from smart-jump-eglot.el

(autoload 'smart-jump-eglot-register "smart-jump-eglot" "\
Register `eglot' for `smart-jump'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-elisp-mode" "smart-jump-elisp-mode.el"
;;;;;;  (24445 20598 730620 37000))
;;; Generated autoloads from smart-jump-elisp-mode.el

(autoload 'smart-jump-elisp-mode-register "smart-jump-elisp-mode" "\
Register `smart-jump' for `elisp-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-elixir-mode" "smart-jump-elixir-mode.el"
;;;;;;  (24445 20598 746620 57000))
;;; Generated autoloads from smart-jump-elixir-mode.el

(autoload 'smart-jump-elixir-mode-register "smart-jump-elixir-mode" "\
Register `smart-jump' for `elixir-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-elm-mode" "smart-jump-elm-mode.el"
;;;;;;  (24445 20598 790620 109000))
;;; Generated autoloads from smart-jump-elm-mode.el

(autoload 'smart-jump-elm-mode-register "smart-jump-elm-mode" "\
Register `elm-mode' for `smart-jump'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-erlang-mode" "smart-jump-erlang-mode.el"
;;;;;;  (24445 20598 762620 75000))
;;; Generated autoloads from smart-jump-erlang-mode.el

(autoload 'smart-jump-erlang-mode-register "smart-jump-erlang-mode" "\
Register `erlang-mode' for `smart-jump'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-go-mode" "smart-jump-go-mode.el"
;;;;;;  (24445 20598 802620 124000))
;;; Generated autoloads from smart-jump-go-mode.el

(autoload 'smart-jump-go-mode-register "smart-jump-go-mode" "\
Register `go-mode' for `smart-jump'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-haskell-mode" "smart-jump-haskell-mode.el"
;;;;;;  (24445 20598 862620 196000))
;;; Generated autoloads from smart-jump-haskell-mode.el

(autoload 'smart-jump-haskell-mode-register "smart-jump-haskell-mode" "\
Register `smart-jump' for `haskell-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-js2-mode" "smart-jump-js2-mode.el"
;;;;;;  (24445 20598 830620 158000))
;;; Generated autoloads from smart-jump-js2-mode.el

(autoload 'smart-jump-js2-mode-register "smart-jump-js2-mode" "\
Register `js2-mode' for `smart-jump'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-lisp-mode" "smart-jump-lisp-mode.el"
;;;;;;  (24445 20598 846620 177000))
;;; Generated autoloads from smart-jump-lisp-mode.el

(autoload 'smart-jump-lisp-mode-register "smart-jump-lisp-mode" "\
Register `smart-jump' for `lisp-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-lispy" "smart-jump-lispy.el" (24445
;;;;;;  20598 738620 46000))
;;; Generated autoloads from smart-jump-lispy.el

(autoload 'smart-jump-lispy-register "smart-jump-lispy" "\
Register `smart-jump' for `lispy'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-lsp-mode" "smart-jump-lsp-mode.el"
;;;;;;  (24445 20598 850620 182000))
;;; Generated autoloads from smart-jump-lsp-mode.el

(autoload 'smart-jump-lsp-mode-register "smart-jump-lsp-mode" "\
Register `lsp-mode' for `smart-jump'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-lua-mode" "smart-jump-lua-mode.el"
;;;;;;  (24445 20598 774620 90000))
;;; Generated autoloads from smart-jump-lua-mode.el

(autoload 'smart-jump-lua-mode-register "smart-jump-lua-mode" "\
Register `smart-jump' for `lua-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-python" "smart-jump-python.el"
;;;;;;  (24445 20598 838620 167000))
;;; Generated autoloads from smart-jump-python.el

(autoload 'smart-jump-python-register "smart-jump-python" "\
Register `smart-jump' for `python'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-ruby-mode" "smart-jump-ruby-mode.el"
;;;;;;  (24445 20598 810620 133000))
;;; Generated autoloads from smart-jump-ruby-mode.el

(autoload 'smart-jump-ruby-mode-register "smart-jump-ruby-mode" "\
Register `smart-jump' for `ruby-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-rust-mode" "smart-jump-rust-mode.el"
;;;;;;  (24445 20598 826620 152000))
;;; Generated autoloads from smart-jump-rust-mode.el

(autoload 'smart-jump-rust-mode-register "smart-jump-rust-mode" "\
Register `smart-jump' for `rust-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-scheme" "smart-jump-scheme.el"
;;;;;;  (24445 20598 786620 105000))
;;; Generated autoloads from smart-jump-scheme.el

(autoload 'smart-jump-scheme-register "smart-jump-scheme" "\
Register `smart-jump' for `scheme'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-swift-mode" "smart-jump-swift-mode.el"
;;;;;;  (24445 20598 750620 61000))
;;; Generated autoloads from smart-jump-swift-mode.el

(autoload 'smart-jump-swift-mode-register "smart-jump-swift-mode" "\
Register `smart-jump' for `swift-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-typescript-mode" "smart-jump-typescript-mode.el"
;;;;;;  (24445 20598 738620 46000))
;;; Generated autoloads from smart-jump-typescript-mode.el

(autoload 'smart-jump-typescript-mode-register "smart-jump-typescript-mode" "\
Register `smart-jump' for `typescript-mode'.

\(fn &optional MODE)" nil nil)

;;;***

;;;### (autoloads nil "smart-jump-web-mode" "smart-jump-web-mode.el"
;;;;;;  (24445 20598 778620 95000))
;;; Generated autoloads from smart-jump-web-mode.el

(autoload 'smart-jump-web-mode-register "smart-jump-web-mode" "\
Register `smart-jump' for `web-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("smart-jump-pkg.el") (24445 20598 818620
;;;;;;  143000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; smart-jump-autoloads.el ends here
