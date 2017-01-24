;;; keybindings.el --- asterix Layer key bindings File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/erstern/dotspacemacsd
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; remap "SPC SPC" to avy-goto-char
;; (evil-leader/set-key "SPC" 'evil-avy-goto-char)

;; youdao dictionary
(evil-leader/set-key "oy" 'youdao-dictionary-search-at-point+)
