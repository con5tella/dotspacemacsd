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

;; remap "C-n" to hippie-expand
(define-key evil-insert-state-map (kbd "C-n") 'hippie-expand)
(define-key git-commit-mode-map (kbd "C-n") 'hippie-expand)

;; remap "C-a" to beginning-of-code-or-line
(define-key evil-normal-state-map (kbd "C-a") 'mwim-beginning-of-code-or-line-or-comment)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)

;; remap "C-e" to end-of-code-or-line
(define-key evil-normal-state-map (kbd "C-e") 'mwim-end-of-code-or-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
