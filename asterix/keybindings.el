;;; keybindings.el --- Better Emacs Defaults Layer key bindings File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; remap "SPC SPC" to avy-goto-char
;; (evil-leader/set-key "SPC" 'evil-avy-goto-char)

;; remap "C-n" to hippie-expand in hybrid-mode
(global-set-key (kbd "C-n") 'hippie-expand)

;; youdao dictionary
(evil-leader/set-key "oy" 'youdao-dictionary-search-at-point+)
