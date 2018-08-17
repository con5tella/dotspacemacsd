;;; config.el --- stella Layer configuration variables File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/erstern/dotspacemacsd
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


;; ;; reset frame size
;; (stella/reset-frame-size)
;; ;; learn from liu233w
;; (add-hook 'after-make-frame-functions 'stella/reset-frame-size)

;; (unless (functionp 'stella/reset-frame-size)
;;   (defun stella/reset-frame-size (&optional frame)
;;     "reset frame size"
;;     (interactive)
;;     (when frame
;;       (select-frame frame))
;;     (set-frame-size (selected-frame) 96 48))
;;   )


;; one-key switch theme via @ksqsf at emacs-china
(defvar *my-dark-theme* 'zenburn)
(defvar *my-light-theme* 'spacemacs-light)
(defvar *current-variant* 'light)

;; (load-theme 'spacemacs-light t)
;; (global-set-key (kbd "<f8>") #'switch-theme-variant)

(defun switch-theme-variant ()
  (interactive)
  (cond ((eq *current-variant* 'light)
	       (disable-theme *my-light-theme*)
	       (load-theme *my-dark-theme*)
	       (setq *current-variant* 'dark))
	      ((eq *current-variant* 'dark)
	       (disable-theme *my-dark-theme*)
	       (load-theme *my-light-theme*)
	       (setq *current-variant* 'light))
	      (t (error "unknown variant"))))


;; ;; set face-attribute font, disabling in default theme
;; (set-face-attribute 'font-lock-function-name-face nil :weight 'bold)
;; (set-face-attribute 'font-lock-type-face nil :weight 'semi-bold :slant 'italic)
;; (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
;; ;; (set-face-attribute 'font-lock-string-face nil :foreground '"forest green")


;; ;; performance of opening large file
;; (add-hook 'find-file-hook 'spacemacs/check-large-file)
;; (defun spacemacs/check-large-file ()
;;   (when (> (buffer-size) 500000)
;;     (progn
;;       (fundamental-mode)
;;       (hl-line-mode -1)
;;       )))


;; improve the performance of opening tex file
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-engine 'xetex
                  TeX-show-compilation t
                  )
            (auto-fill-mode -1)
            (setq truncate-lines nil)  ;; truncate lines ignore words
            (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)
            ))


;; improve the performance of opening markdown file
(add-hook 'markdown-mode-hook
          (lambda ()
            ;; (auto-fill-mode)  ;; if column ==80 return
            ;; (setq truncate-lines nil)  ;; truncate lines ignore words
            ;; (visual-line-mode t)
            (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)
            ;; (spacemacs/toggle-centered-point-on)
            ))


;; improve the performance of opening org file
;; (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
(add-hook 'org-mode-hook
          (lambda ()
            ;; (auto-fill-mode)  ;; if column ==80 return
            (setq truncate-lines nil)  ;; truncate lines ignore words
            ;; (visual-line-mode t)
            (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)
            ;; (spacemacs/toggle-centered-point-on)
            ))


;; improve the performance of opening python file
(add-hook 'python-mode-hook
          (lambda ()
            ;; set conda's env path as default python interpreter
            (setq python-shell-interpreter "/opt/anaconda/bin/python")
            ))


;; poly-mode for .Rmd file
;; via stackoverflow.com/questions/16172345/how-can-i-use-emacs-ess-mode-with-r-markdown
(defun rmd-mode ()
  "ESS Markdown mode for rmd files"
  (interactive)
  ;; (setq load-path
  ;;       (append (list "path/to/polymode/" "path/to/polymode/modes/")
  ;;               load-path))
  (require 'poly-R)
  (require 'poly-markdown)
  ;; ;; markdown
  ;; (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
  ;; ;; R modes
  ;; (add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
  (poly-markdown+r-mode)
  )


;; ;; line-numbers for yaml-mode
;; (add-hook 'yaml-mode-hook (lambda () (spacemacs/toggle-line-numbers-on)) 'append)


;; ;; set default translate web as translate.google.cn
;; (eval-after-load 'google-translate-core
;;   '(setq google-translate-base-url "http://translate.google.cn/translate_a/single"
;;          google-translate-listen-url "http://translate.google.cn/translate_tts"
;;          google-translate-default-target-language "zh_CN"))
;; (eval-after-load 'google-translate-tk
;;   '(setq google-translate--tkk-url "http://translate.google.cn/"))


;; ;; pretty symbols via:
;; ;; https://github.com/MetroWind/dotfiles-mac/blob/master/.emacs-pkgs/mw-unicode-symbols-subst.el
;;
;; (defvar have-prettify-symbols
;;   (not (version< emacs-version "24.4")))
;;
;; ;; Replace stuff like `lambda', `->' with actual unicode chars.
;; (defun unicode-symbol (name)
;;   "Translate a symbolic name for a Unicode character -- e.g., LEFT-ARROW
;;   or GREATER-THAN into an actual Unicode character code. "
;;   (decode-char 'ucs (case name
;;                       ;; arrows
;;                       ('left-arrow 8592)
;;                       ('up-arrow 8593)
;;                       ('right-arrow 8594)
;;                       ('down-arrow 8595)
;;                       ('Right-arrow #x21d2)
;;                       ;; Math symbols
;;                       ('integral #x222b)
;;                       ('oint #x222e)
;;                       ('sum #x2211)
;;                       ('product #x220f)
;;                       ('infinity #x221e)
;;                       ('equal #X003d)
;;                       ('not-equal #X2260)
;;                       ('approximately #x2248)
;;                       ('identical #X2261)
;;                       ('not-identical #X2262)
;;                       ('less-than #X003c)
;;                       ('greater-than #X003e)
;;                       ('less-than-or-equal-to #X2264)
;;                       ('greater-than-or-equal-to #X2265)
;;                       ('much-less-than #x226a)
;;                       ('much-greater-than #x226b)
;;                       ('logical-and #X2227)
;;                       ('logical-or #X2228)
;;                       ('logical-neg #X00AC)
;;                       ('nil #X2205)
;;                       ('for-all #X2200)
;;                       ('there-exists #X2203)
;;                       ('element-of #X2208)
;;                       ('not-element-of #X2209)
;;                       ('cdot #x22c5)
;;                       ;; boxes
;;                       ('double-vertical-bar #X2551)
;;                       ;; relational operators
;;                       ;; logical operators
;;                       ;; misc
;;                       ('horizontal-ellipsis #X2026)
;;                       ('double-exclamation #X203C)
;;                       ('prime #X2032)
;;                       ('double-prime #X2033)
;;                       ('dagger #x2020)
;;                       ;; mathematical operators
;;                       ('square-root #X221A)
;;                       ('squared #X00B2)
;;                       ('cubed #X00B3)
;;                       ;; letters
;;                       ('lambda #X03BB)
;;                       ('alpha #X03B1)
;;                       ('beta #X03B2)
;;                       ('gamma #X03B3)
;;                       ('delta #X03B4)
;;                       ('epsilon #X03B5)
;;                       ('zeta #X03B6)
;;                       ('eta #X03B7)
;;                       ('theta #X03B8)
;;                       ('iota #X03B9)
;;                       ('kappa #X03BA)
;;                       ('mu #X03BC)
;;                       ('nu #X03BD)
;;                       ('xi #X03BE)
;;                       ('pi #X03C0)
;;                       ('rho #X03C1)
;;                       ('sigma #X03C3)
;;                       ('tau #X03C4)
;;                       ('phi #X03C6)
;;                       ('chi #X03C7)
;;                       ('psi #X03C8)
;;                       ('omega #X03C9))))
;;
;; (use-package emacs
;;   :unless have-prettify-symbols
;;   :config
;;   (defun substitute-pattern-with-unicode (pattern symbol)
;;     "Add a font lock hook to replace the matched part of PATTERN with the
;;   Unicode symbol SYMBOL looked up with UNICODE-SYMBOL."
;;     (interactive)
;;     (font-lock-add-keywords
;;      nil `((,pattern (0 (progn (compose-region (match-beginning 1) (match-end 1)
;;                                              ,(unicode-symbol symbol))
;;                              nil))))))
;;
;;   (defun substitute-patterns-with-unicode (patterns)
;;     "Call SUBSTITUTE-PATTERN-WITH-UNICODE repeatedly."
;;     (mapcar #'(lambda (x)
;;                 (substitute-pattern-with-unicode (car x)
;;                                                  (cdr x)))
;;             patterns)))
;;
;; (use-package elisp-mode
;;   :commands emacs-lisp-mode
;;   :unless have-prettify-symbols
;;   :hook (emacs-lisp-mode . elisp-unicode)
;;   :config
;;   (defun elisp-unicode ()
;;     (interactive)
;;     (substitute-patterns-with-unicode
;;      (list (cons "(\\(lambda\\>\\)" 'lambda)
;;            (cons " +\\(nil\\)[ )]" 'nil)))))
;;
;; (use-package elisp-mode
;;   :commands emacs-lisp-mode
;;   :if have-prettify-symbols
;;   :hook ((emacs-lisp-mode . prettify-symbols-mode)
;;          (emacs-lisp-mode . (lambda () (setq prettify-symbols-alist elisp-unicode))))
;;   :config
;;   (defvar elisp-unicode
;;      (list (cons "lambda" (unicode-symbol 'lambda))
;;            (cons "nil" (unicode-symbol 'nil)))))
;;
;; (use-package python
;;   :commands python-mode
;;   :if have-prettify-symbols
;;   :hook ((python-mode . prettify-symbols-mode)
;;          (python-mode . (lambda () (setq prettify-symbols-alist python-unicode))))
;;   :config
;;   (message "Setting python symbols...")
;;   (defvar python-unicode
;;     (list (cons "not in" (unicode-symbol 'not-element-of))
;;           (cons "in" (unicode-symbol 'element-of))
;;           (cons "and" (unicode-symbol 'logical-and))
;;           (cons "or" (unicode-symbol 'logical-or))
;;           (cons "not" (unicode-symbol 'logical-neg))
;;           (cons "!=" (unicode-symbol 'not-equal))
;;           (cons "==" (unicode-symbol 'identical))
;;           (cons ">=" (unicode-symbol 'greater-than-or-equal-to))
;;           (cons "<=" (unicode-symbol 'less-than-or-equal-to))
;;           ))
;;   )
;;
;; (provide 'mw-unicode-symbols-subst)
