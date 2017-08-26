;;; config.el --- stella Layer configuration variables File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/erstern/dotspacemacsd
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; ;; reset frame size
;; (stella/reset-frame-size)
;; ;; learn from liu233w
;; (add-hook 'after-make-frame-functions 'stella/reset-frame-size)

;; (unless (functionp 'stella/reset-frame-size)
;;   (defun stella/reset-frame-size (&optional frame)
;;     "reset frame size"
;;     (interactive)
;;     (when frame
;;       (select-frame frame))
;;     (set-frame-size (selected-frame) 96 48))
;;   )

;; set face-attribute font, disabling in default theme
(set-face-attribute 'font-lock-function-name-face nil :weight 'bold)
(set-face-attribute 'font-lock-type-face nil :weight 'semi-bold :slant 'italic)
(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
;; (set-face-attribute 'font-lock-string-face nil :foreground '"forest green")

;; performance of opening large file
(add-hook 'find-file-hook 'spacemacs/check-large-file)
(defun spacemacs/check-large-file ()
  (when (> (buffer-size) 500000)
    (progn
      (fundamental-mode)
      (hl-line-mode -1)
      )))

;; improve the performance of opening org file
;; (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
(add-hook 'org-mode-hook (lambda ()
                           ;; (auto-fill-mode)  ;; if column ==80 return
                           (setq truncate-lines nil)  ;; truncate lines ignore words
                           ;; (visual-line-mode t)
                           (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)
                           ;; (spacemacs/toggle-centered-point-on)
                           ))

;; improve the performance of opening markdown file
(add-hook 'markdown-mode-hook (lambda ()
                           ;; (auto-fill-mode)  ;; if column ==80 return
                           ;; (setq truncate-lines nil)  ;; truncate lines ignore words
                           ;; (visual-line-mode t)
                           (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)
                           ;; (spacemacs/toggle-centered-point-on)
                           ))

;; line-numbers for yaml-mode
(add-hook 'yaml-mode-hook (lambda () (spacemacs/toggle-line-numbers-on)) 'append)
