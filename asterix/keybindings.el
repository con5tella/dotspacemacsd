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

;; ;; bing-dict-brief
(evil-leader/set-key "ob" 'bing-dict-brief)

;; ;; youdao dictionary
;; (evil-leader/set-key "oy" 'youdao-dictionary-search-at-point)
;; (evil-leader/set-key "oi" 'youdao-dictionary-search-from-input)

;; remap C-n and C-p for next and previous candidate
(define-key company-active-map (kbd "C-n") (lambda () (interactive) (company-complete-common-or-cycle 1)))
(define-key company-active-map (kbd "C-p") (lambda () (interactive) (company-complete-common-or-cycle -1)))

;; remap with leader-key ","
(setq generaleader ",")
(general-define-key
 :prefix generaleader
 "SPC" 'evil-avy-goto-char
 "f" 'counsel-find-file
 "o" 'other-window
 "p" 'counsel-projectile-find-file
 "u" 'undo-tree-visualize
 "w" 'save-buffer
 )

;; remap without leader-key
(general-define-key
 :states '(normal visual)
 :keymaps 'global
 "/" 'swiper
 (kbd ";") 'spacemacs/comment-or-uncomment-lines
 (kbd "C-a") 'mwim-beginning-of-code-or-line-or-comment
 (kbd "C-e") 'mwim-end-of-code-or-line
 )

;; remap navigate org-mode-map
(general-define-key
 :states '(normal visual)
 :keymaps 'org-mode-map
 "C-a" 'evil-beginning-of-visual-line
 "C-e" 'evil-end-of-visual-line
 "j" 'evil-next-visual-line
 "k" 'evil-previous-visual-line
 "gj" 'org-next-visible-heading
 "gk" 'org-previous-visible-heading
 )
