;;; funcs.el --- asterix Layer functions File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/erstern/dotspacemacsd
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; (unless (functionp 'asterix/reset-frame-size)
;;   (defun asterix/reset-frame-size (&optional frame)
;;     "reset frame size"
;;     (interactive)
;;     (when frame
;;       (select-frame frame))
;;     (set-frame-size (selected-frame) 96 48))
;;   )

(defun spacemacs/check-large-file ()
  (when (> (buffer-size) 500000)
    (progn (fundamental-mode)
           (hl-line-mode -1))))
