;###################################################################################
;
;                             emacs-keys.el
;
;###################################################################################
;
; This file contains the global key bindings for Emacs 19.19.
;
; Created : September 19, 1995.
; By      : Vijay A. Nebhrajani, HDEG, CDAC, Pune, 411 007, INDIA.
;
; Documentation : These are the global key bindings that will be used
;                 by Emacs 19.19.
;
; In case of problems : Get to Vijay A. Nebhrajani, Hardware Developmemt and
;                       Engineering Group, Centre for Development of Advanced
;                       Computing, Pune University Campus, Ganeshkhind, Pune
;                       411018, INDIA. Ph: (0212)352531/352461/352479/352483.
;                       E-mail: vijayn@parcom.ernet.in
;
;###################################################################################


(global-set-key (quote [f1])     (quote find-file))
(global-set-key (quote [S-f1])   (quote find-file-other-window))
(global-set-key (quote [C-f1])   (quote find-file-other-frame))
(global-set-key (quote [f2])     (quote copy-to-register))
(global-set-key (quote [S-f2])   (quote insert-register))
(global-set-key (quote [C-f2])   (quote view-register))
(global-set-key (quote [f3])     (quote kill-region))
(global-set-key (quote [S-f3])   (quote kill-rectangle))
(global-set-key (quote [C-f3])   (quote kill-line))
(global-set-key (quote [f4])     (quote shell))
(global-set-key (quote [S-f4])   (quote shell-command))
(global-set-key (quote [C-f4])   (quote shell))
(global-set-key (quote [f5])     (quote call-last-kbd-macro))
(global-set-key (quote [S-f5])   (quote start-kbd-macro))
(global-set-key (quote [C-f5])   (quote end-kbd-macro))
(global-set-key (quote [f6])     (quote other-window))
(global-set-key (quote [S-f6])   (quote other-frame))
(global-set-key (quote [C-f6])   (quote other-frame))
(global-set-key (quote [f7])     (quote delete-other-windows))
(global-set-key (quote [S-f7])   (quote delete-window))
(global-set-key (quote [C-f7])   (quote enlarge-window))
(global-set-key (quote [f8])     (quote split-window-vertically))
(global-set-key (quote [S-f8])   (quote split-window-horizontally))
(global-set-key (quote [C-f8])   (quote delete-other-windows))
(global-set-key (quote [f9])     (quote list-buffers))
(global-set-key (quote [S-f9])   (quote switch-to-buffer))
(global-set-key (quote [C-f9])   (quote insert-buffer))
(global-set-key (quote [f10])    (quote toggle-frame-maximized))
(global-set-key (quote [f11])    (quote toggle-frame-fullscreen))
(global-set-key (quote [f14])    (quote undo))
(global-set-key (quote [f18])    (quote yank))
(global-set-key (quote [f19])    (quote isearch-forward))
(global-set-key (quote [f20])    (quote delete-region))
(global-set-key (quote [f27])    (quote beginning-of-buffer))
(global-set-key (quote [f29])    (quote scroll-down))
(global-set-key (quote [f31])    (quote kill-buffer))
(global-set-key (quote [f33])    (quote end-of-buffer))
(global-set-key (quote [f35])    (quote scroll-up))
(global-set-key (quote [help])   (quote help-for-help))
(global-set-key (quote [home])   (quote beginning-of-buffer))
(global-set-key (quote [end])    (quote end-of-buffer))
(global-set-key (quote [M-kp-0]) (quote overwrite-mode))
