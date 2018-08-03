;;; keybindings.el --- stella Layer key bindings File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/erstern/dotspacemacsd
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; owner's config key-bindings
(spacemacs/declare-prefix "o" "owner's config")

;; bing-dict-brief
(evil-leader/set-key "od" 'bing-dict-brief)

;; switch diff modes
(evil-leader/set-key "oe" 'emacs-lisp-mode)
(evil-leader/set-key "ol" 'latex-mode)
(evil-leader/set-key "om" 'markdown-mode)
(evil-leader/set-key "oo" 'org-mode)
(evil-leader/set-key "op" 'python-mode)
(evil-leader/set-key "or" 'R-mode)
(evil-leader/set-key "oy" 'yaml-mode)

;; macros for TeX-mode
(evil-leader/set-key "of" 'TeX-macro-frame)
(evil-leader/set-key "ob" 'TeX-macro-block)
(fset 'TeX-macro-frame
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([111 92 98 101 103 105 110 123 102 114 97 109 101 right 123 right return 92 98 101 103 105 110 123 98 108 111 99 107 right return return 92 101 110 100 123 98 108 111 99 107 right return 92 101 110 100 123 102 114 97 109 101 escape 36 118 107 107 107 107 48 61 106 106] 0 "%d") arg)))
(fset 'TeX-macro-block
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([111 92 98 101 103 105 110 123 98 108 111 99 107 right return return 92 101 110 100 123 98 108 111 99 107 escape 36 118 107 107 48 61 106] 0 "%d") arg)))

;; quickrun
(evil-leader/set-key "oq" 'quickrun)

;; switch-Theme
(evil-leader/set-key "ot" 'switch-theme-variant)

;; toggle to write with company-english-helper or not
(evil-leader/set-key "ow" 'toggle-company-english-helper)

;; toggle-fullscreen-frame (maximized-frame-at-startup t in .spacemacs|init.el)
(evil-leader/set-key "oF" 'spacemacs/toggle-fullscreen-frame)
(evil-leader/set-key "oM" 'spacemacs/toggle-maximize-frame)

;; clear highlight
(evil-leader/set-key "DEL" 'spacemacs/evil-search-clear-highlight)

;; ;; remap C-n and C-p for next and previous candidate
;; (define-key evil-insert-state-map (kbd "C-n") (lambda () (interactive) (company-complete-common-or-cycle 1)))
;; (define-key evil-insert-state-map (kbd "C-p") (lambda () (interactive) (company-complete-common-or-cycle -1)))

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
 "q" 'quickrun
 "u" 'undo-tree-visualize
 "w" 'save-buffer
 )

;; remap with Meta-key
(general-define-key
 :keymaps 'global
 :states '(normal visual)
 ;; (kbd "M-b") 'bing-dict-brief
 ;; (kbd "M-d") 'find-by-pinyin-dired
 (kbd "M-f") 'counsel-projectile-find-file
 (kbd "M-g") 'magit-status
 (kbd "M-n") 'sp-next-sexp
 ;; (kbd "M-r") 'ranger
 (kbd "M-u") 'undo-tree-visualize
 (kbd "M-[") 'sp-backward-slurp-sexp
 (kbd "M-]") 'sp-forward-slurp-sexp
 (kbd "M-{") 'sp-backward-barf-sexp
 (kbd "M-}") 'sp-forward-barf-sexp
 )

;; remap with Ctrl-key
(general-define-key
 :keymaps 'global
 :states '(normal visual insert emacs)
 (kbd "C-a") 'sp-beginning-of-sexp
 (kbd "C-e") 'sp-end-of-sexp
 (kbd "C-o") 'next-line-insert-mode
 (kbd "C-t") 'query-replace-regexp
 )

;; macros for open new line in insert mode
(fset 'previous-line-insert-mode
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 79] 0 "%d") arg)))
(fset 'next-line-insert-mode
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 111] 0 "%d") arg)))

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
 ;; "c" 'bing-dict-brief
 "f" 'evil-avy-goto-char
 "ga" 'describe-char
 ;; "j" 'evil-next-visual-line
 ;; "k" 'evil-previous-visual-line
 "S" 'sp-backward-unwrap-sexp
 "U" 'undo-tree-visualize
 )

;; remap without leader-key or modifier-key in insert state
(general-define-key
 :keymaps 'global
 :states '(insert)
 (kbd "C-n") (lambda () (interactive) (company-complete-common-or-cycle 1))
 (kbd "C-p") (lambda () (interactive) (company-complete-common-or-cycle -1))
 )

;; ;; git-commit insert
;; (general-define-key
;;  :keymaps '(git-commit-mode-map)
;;  :states '(insert)
;;  (kbd "C-n") 'hippie-expand
;;  )

;; remap heading markdown-mode
(general-define-key
 :states '(normal visual)
 :keymaps 'markdown-mode-map
 :prefix general-leader
 "1" 'markdown-insert-header-atx-1
 "2" 'markdown-insert-header-atx-2
 "3" 'markdown-insert-header-atx-3
 "4" 'markdown-insert-header-atx-4
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
 )
