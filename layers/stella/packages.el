;;; packages.el --- stella layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/erstern/dotspacemacsd
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `stella-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `stella/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `stella/pre-init-PACKAGE' and/or
;;   `stella/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst stella-packages
  '(
    ace-pinyin
    ;; beacon
    bing-dict
    ;; company-english-helper
    ;; eaf
    fcitx
    general
    ;; latex-preview-pane
    ;; org
    pangu-spacing
    polymode
    ;; proxy-mode
    ;; pyim
    quickrun
    )
  "The list of Lisp packages required by the stella layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


;; ace-pinyin
(defun stella/init-ace-pinyin ()
  (use-package ace-pinyin
    :defer t
    :init
    ;; (setq ace-pinyin-use-avy nil) ;; uncomment if you want to use `ace-jump-mode
    (ace-pinyin-global-mode +1)
    ;; (setq ace-pinyin-simplified-chinese-only-p nil)
    ))

;; (defun stella/init-beacon()
;;   "Initialize beacon"
;;   (use-package beacon
;;     :init
;;     (beacon-mode 1)
;;     (setq beacon-color "#666600")))

;; bing-dict
(defun stella/init-bing-dict ()
  (use-package bing-dict
    :defer t
    :init
    (setq bing-dict-show-thesaurus 'both)
    ;; (setq bing-dict-pronunciation-style 'uk)
    ))

;; (defun stella/init-company-english-helper ()
;;   )

;; (defun stella/init-eaf ()
;;   )

(defun stella/init-fcitx ()
  ;; Make sure the following comes before `(fcitx-aggressive-setup)'
  (setq fcitx-active-evil-states '(insert emacs hybrid)) ;; if you use hybrid mode
  (fcitx-aggressive-setup)
  (fcitx-prefix-keys-add "M-m") ;; M-m is common in Spacemacs
  (when (spacemacs/system-is-linux)
    (setq fcitx-use-dbus t) ;; uncomment if you're using Linux
    ))

(defun stella/init-general ()
  (use-package general
    ))

;; (defun stella/post-init-org ()
;;   (with-eval-after-load 'org
;;     (;; load-languages in org-mode
;;      org-babel-do-load-languages
;;      'org-babel-load-languages
;;      '(
;;        (sh . t)
;;        (python . t)
;;        (R . t)
;;        (ruby . t)
;;        (ditaa . t)
;;        (dot . t)
;;        (octave . t)
;;        (sqlite . t)
;;        (perl . t)
;;        (C . t)
;;        ))
;;     ))

;; (defun stella/init-latex-preview-pane ()
;;   (use-package latex-preview-pane
;;     ))

(defun stella/init-pangu-spacing ()
  (use-package pangu-spacing
    :defer t
    :init
    (global-pangu-spacing-mode 1)
    ;; (setq pangu-spacing-real-insert-separtor t)
    (defcustom pangu-spacing-inhibit-mode-alist '(eshell-mode shell-mode term-mode yaml-mode)
      "Inhibit mode alist for pangu-spacing-mode."
      :group 'pangu-spacing
      :type 'list)
    ))

(defun stella/init-polymode ()
  (use-package polymode
    ))

;; (defun stella/init-proxy-mode ()
;;   (use-package proxy-mode
;;     :ensure t
;;   (setq url-gateway-local-host-regexp
;;         (concat "\\`" (regexp-opt '("localhost" "127.0.0.1")) "\\'"))
;;   ))

(defun stella/init-quickrun ()
  )

;;; packages.el ends here
