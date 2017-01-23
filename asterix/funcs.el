;;; funcs.el --- Better Emacs Defaults Layer functions File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(unless (functionp 'asterix/reset-frame-size)
  (defun asterix/reset-frame-size (&optional frame)
    "reset frame size"
    (interactive)
    (when frame
      (select-frame frame))
    (set-frame-size (selected-frame) 96 48))
  )
