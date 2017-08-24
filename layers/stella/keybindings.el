;;; keybindings.el --- stella Layer key bindings File for Spacemacs
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

;; ;; find by Pinyin directory
;; (evil-leader/set-key "od" 'find-by-pinyin-dired)

;; ;; youdao dictionary
;; (evil-leader/set-key "oy" 'youdao-dictionary-search-at-point)
;; (evil-leader/set-key "oi" 'youdao-dictionary-search-from-input)

;; remap C-n and C-p for next and previous candidate
(define-key evil-insert-state-map (kbd "C-n") (lambda () (interactive) (company-complete-common-or-cycle 1)))
(define-key evil-insert-state-map (kbd "C-p") (lambda () (interactive) (company-complete-common-or-cycle -1)))

;; remap with leader-key
(setq general-leader ",")
(general-define-key
 :keymaps 'global
 :states '(normal visual)
 :prefix general-leader
 "SPC" 'evil-avy-goto-char
 "/" 'evil-search-forward ;; mainly used in fundamental-mode for large-file
 "f" 'counsel-describe-function
 "k" 'describe-key
 ;; "r" 'deer
 "R" '(dotspacemacs/sync-configuration-layers)
 "u" 'undo-tree-visualize
 "w" 'save-buffer
 )

;; remap with Meta-key
(general-define-key
 :keymaps 'global
 :states '(normal visual)
 (kbd "M-b") 'bing-dict-brief
 ;; (kbd "M-d") 'find-by-pinyin-dired
 (kbd "M-f") 'counsel-find-file
 (kbd "M-g") 'magit-status
 (kbd "M-i") '(spacemacs/find-dotfile)
 (kbd "M-p") 'counsel-projectile-find-file
 ;; (kbd "M-r") 'ranger
 (kbd "M-s") '(spacemacs/search-project-auto)
 (kbd "M-u") 'undo-tree-visualize
 (kbd "M-w") '(spacemacs/window-manipulation-transient-state/body)
 )

;; remap with Ctrl-key
(general-define-key
 :keymaps 'global
 :states '(normal visual insert emacs)
 (kbd "C-a") 'mwim-beginning-of-code-or-line-or-comment
 (kbd "C-e") 'mwim-end-of-code-or-line
 )

;; remap with Shift-key
(general-define-key
 :keymaps 'global
 :states '(normal visual)
 (kbd "S-<left>") 'previous-buffer
 (kbd "S-<right>") 'next-buffer
 )

;; remap without leader-key or modifier-key
(general-define-key
 :keymaps 'global
 :states '(normal visual)
 "/" 'swiper
 ";" 'spacemacs/comment-or-uncomment-lines
 "c" 'bing-dict-brief
 "f" 'evil-avy-goto-char
 "ga" 'describe-char
 "j" 'evil-next-visual-line
 "k" 'evil-previous-visual-line
 "K" '(spacemacs/kill-this-buffer)
 "U" 'undo-tree-visualize
 "W" '(spacemacs/window-manipulation-transient-state/body)
 )

;; insert state
(general-define-key
 :keymaps 'global
 :states '(insert)
 (kbd "C-n") 'hippie-expand
 )

;; remap heading markdown-mode
(general-define-key
 :states '(normal visual)
 :keymaps 'markdown-mode-map
 :prefix general-leader
 "1" 'markdown-insert-header-atx-1
 "2" 'markdown-insert-header-atx-2
 "3" 'markdown-insert-header-atx-3
 "e" 'markdown-insert-header-atx-3
 "4" 'markdown-insert-header-atx-4
 "r" 'markdown-insert-header-atx-4
 "5" 'markdown-insert-header-atx-5
 "6" 'markdown-insert-header-atx-6
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