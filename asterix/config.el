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
