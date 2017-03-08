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

;; remap with leader-key
(setq general-leader ",")
(general-define-key
 :keymaps 'global
 :states '(normal visual)
 :prefix general-leader
 "SPC" 'evil-avy-goto-char
 "f" 'counsel-describe-function
 "k" 'describe-key
 "p" 'counsel-projectile-find-file
 "r" 'ranger
 "R" '(dotspacemacs/sync-configuration-layers)
 "u" 'undo-tree-visualize
 "w" 'save-buffer
 )

;; remap with modifier-key
(general-define-key
 :keymaps 'global
 :states '(normal visual insert emacs)
 (kbd "C-a") 'mwim-beginning-of-code-or-line-or-comment
 (kbd "C-e") 'mwim-end-of-code-or-line
 (kbd "H-g") 'magit-status
 (kbd "H-h") 'ivy-spacemacs-help
 (kbd "H-i") '(spacemacs/find-dotfile)
 (kbd "H-r") 'ranger
 (kbd "H-u") 'undo-tree-visualize
 (kbd "H-w") '(spacemacs/window-manipulation-transient-state/body)
 )

;; remap without leader-key or modifier-key
(general-define-key
 :keymaps 'global
 :states '(normal visual)
 "/" 'swiper
 ";" 'spacemacs/comment-or-uncomment-lines
 )

;; remap navigate org-mode-map
(general-define-key
 :states '(normal visual)
 :keymaps 'org-mode-map
 (kbd "C-a") 'evil-beginning-of-visual-line
 (kbd "C-e") 'evil-end-of-visual-line
 "j" 'evil-next-visual-line
 "k" 'evil-previous-visual-line
 "gj" 'org-next-visible-heading
 "gk" 'org-previous-visible-heading
 )
