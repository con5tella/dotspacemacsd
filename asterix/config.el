;;; config.el --- Better Emacs Defaults Layer configuration variables File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Thomas de Beauchêne <thomas.de.beauchene@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; reset frame size
(asterix/reset-frame-size)
;; learn from liu233w
(add-hook 'after-make-frame-functions 'asterix/reset-frame-size)
