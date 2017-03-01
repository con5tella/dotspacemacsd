;;; config.el --- asterix Layer configuration variables File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/erstern/dotspacemacsd
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; reset frame size
(asterix/reset-frame-size)
;; learn from liu233w
(add-hook 'after-make-frame-functions 'asterix/reset-frame-size)

;; improve the performance of opening org file
(add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
(add-hook 'find-file-hook 'spacemacs/check-large-file)
(add-hook 'org-mode-hook (lambda ()
                           ;; (auto-fill-mode)  ;; if column ==80 return
                           ;; (setq truncate-lines nil)  ;; truncate lines ignore words
                           ;; (visual-line-mode t)
                           (spacemacs/toggle-centered-point-on)))

;; centered point when reviewing files
(add-hook 'markdown-mode-hook (lambda ()
                                ;; (visual-line-mode t)
                                (spacemacs/toggle-centered-point-on)))
