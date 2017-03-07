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

;; ;; youdao dictionary
;; (evil-leader/set-key "oy" 'youdao-dictionary-search-at-point)
;; (evil-leader/set-key "oi" 'youdao-dictionary-search-from-input)

;; bing-dict-brief
(evil-leader/set-key "ob" 'bing-dict-brief)

;; remap C-n and C-p for next and previous candidate
(define-key company-active-map (kbd "C-n") (lambda () (interactive) (company-complete-common-or-cycle 1)))
(define-key company-active-map (kbd "C-p") (lambda () (interactive) (company-complete-common-or-cycle -1)))

;; remap "C-a" to beginning-of-code-or-line
(define-key evil-normal-state-map (kbd "C-a") 'mwim-beginning-of-code-or-line-or-comment)
(define-key evil-insert-state-map (kbd "C-a") 'mwim-beginning-of-code-or-line-or-comment)
;; remap "C-e" to end-of-code-or-line
(define-key evil-normal-state-map (kbd "C-e") 'mwim-end-of-code-or-line)
(define-key evil-insert-state-map (kbd "C-e") 'mwim-end-of-code-or-line)

;; remap ; comment-or-uncomment
(define-key evil-normal-state-map (kbd ";") 'spacemacs/comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ";") 'comment-or-uncomment-region)

;; remap ", SPC" to avy-goto-char
(general-define-key :prefix ","
                    "SPC" 'evil-avy-goto-char)

;; remap org-mode navigate
(general-define-key
 :states '(normal visual)
 :keymaps 'org-mode-map
 "C-a" 'evil-beginning-of-visual-line
 "C-e" 'evil-end-of-visual-line
 "j" 'evil-next-visual-line
 "k" 'evil-previous-visual-line
 )
