;;; init.el --- Marco's Emacs config
;;; Commentary:

(require 'package)

;;; Code:

;;; use-package
(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(eval-when-compile
  (require 'use-package))

;;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(elpy-project-ignored-directories
   (quote
    (".tox" "build" "dist" ".cask" ".ipynb_checkpoints" "virtual" ".git" ".mypy_cache" ".pytest_cache" ".coverage")))
 '(elpy-rpc-virtualenv-path (quote current))
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(fci-rule-color "#073642")
 '(flycheck-cppcheck-include-path
   (quote
    ("/home/marco/devel/feedstock/feedstock-smtp-inlet/feedstock/queue/include")))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (dockerfile-mode elpy powershell xclip solarized-theme gruvbox-theme dracula-theme base16-theme monokai-theme feature-mode go-mode rust-mode counsel-gtags company-jedi nord-theme yaml-mode markdown-mode use-package flycheck)))
 '(python-check-command "flake8")
 '(python-indent-def-block-scale 1)
 '(safe-local-variable-values
   (quote
    ((js-indent-level . 2)
     (flycheck-clang-include-path delete-dups
				  (quote
				   ("X")))
     (flycheck-clang-include-path delete-dups
				  ("X"))
     (flycheck-clang-include-path concat "x" "y")
     (eval progn
	   (require
	    (quote projectile))
	   (setq flycheck-clang-include-path
		 (delete-dups
		  (append flycheck-clang-include-path
			  (list
			   (concat
			    (projectile-project-root)
			    "feedstock/queue/include"))))))
     (eval setq flycheck-clang-include-path
	   (list
	    (expand-file-name "./")))
     (eval setq flycheck-clang-include-path
	   (list
	    (expand-file-name "./include/")))
     (column-number-mode . 120)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ;; Python-mode + jedi
;; (use-package python-mode
;;   :ensure t
;;   :init
;;   (autoload 'python-mode "python-mode" "Python Mode." t)
;;   :config
;;   (global-eldoc-mode -1)
;;   ;;(setq py-shell-name "ipython")
;;   ;;(setq py-python-command "ipython --profile django")
;;   ;; (setq py-python-command-args "--profile django --quiet --no-banner --")
;;   (setq py-ipython-command-args "--profile django --quiet --no-banner --")
;;   (add-hook 'python-mode-hook (lambda () (local-set-key (kbd "<f5>") "import pdb; pdb.set_trace()"))))
;; (use-package jedi
;;   :ensure t
;;   :init
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (setq jedi:complete-on-dot nil))

;; Anaconda mode https://github.com/proofit404/anaconda-mode ???

(load-theme 'tango-dark)

;; Elpy+flycheck
(use-package company
  :ensure t)
(use-package company-jedi
  :ensure t)
(use-package elpy
  :ensure t
  :after (company company-jedi)
  :config
  (elpy-enable)
  (setq python-shell-interpreter "ipython"
  	python-shell-interpreter-args "-i --simple-prompt --no-banner")
  (setq elpy-test-runner 'elpy-test-pytest-runner)
  ;; (setq python-shell-interpreter "jupyter"
  ;; 	python-shell-interpreter-args "console --simple-prompt"
  ;; 	python-shell-prompt-detect-failure-warning nil)
  ;; (add-to-list 'python-shell-completion-native-disabled-interpreters
  ;;           "jupyter")
  (add-hook 'elpy-mode-hook (lambda() (define-key elpy-mode-map (kbd "M-.") 'elpy-goto-assignment)))
  (add-hook 'elpy-mode-hook (lambda () (local-set-key (kbd "<f5>") "import pdb; pdb.set_trace()"))))

(use-package flycheck
  :ensure t
  :after (elpy)
  :init (global-flycheck-mode)
  :config
  ;; use flycheck instead of flymake in elpy
  (when (load "flycheck" t t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
  (setq flycheck-clang-include-path '("/usr/include/python3.6m")))

;; js
(defun my-js-mode-hook ()
  "Custom `js-mode' behaviours."
  (setq indent-tabs-mode nil)
  (setq js-indent-level 2))
(add-hook 'js-mode-hook 'my-js-mode-hook)
(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-hook 'js2-mode-hook 'my-js-mode-hook))
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-formater-before-save)))

(use-package xref-js2
  :ensure t
  :after (js2-mode))

;; YAML

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

;; project
(use-package projectile
  :ensure t
  :after (ivy)
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy))
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))
(use-package xclip
  :ensure t
  :config
  (setq xclip-mode 1))
;; (use-package zenburn-theme
;;   :ensure t
;;   :config
;;   (load-theme 'zenburn t))
(use-package feature-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))
;; (use-package nord-theme
;;   :ensure t
;;   :config
;;  )
;; (use-package gruvbox-theme
;;   :ensure t
;;   :config
;;   (load-theme 'gruvbox-light-medium t))
(use-package ivy
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package whitespace
  :ensure t
  :config
  (setq whitespace-line-column 120)
  (setq whitespace-style '(face lines-tail))
  (global-whitespace-mode))
(use-package go-mode
  :ensure t
  :config
  (autoload 'go-mode "go-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode)))
;; C
;; - https://blog.binchen.org/posts/emacs-as-c-ide-easy-way.html
;; - https://tuhdo.github.io/c-ide.html
;; - https://www.emacswiki.org/emacs/IndentingC
(use-package counsel-gtags
  :ensure t
  :init
  ;; To update gtags do:
  ;; > apt install global
  ;; > mkdir -p ~/.gtags
  ;; > cd /usr/include/python3.6m && MAKEOBJDIRPREFIX=~/.gtags/ gtags -O
  (setenv "MAKEOBJDIRPREFIX" (file-truename "~/.gtags/"))
  (setenv "GTAGSLIBPATH" (concat "/usr/include"
                               ":"
                               "/usr/src/linux/include"
                               ":"
			       "/usr/include/python3.6m"))
  :config
  (setq company-backends '((company-dabbrev-code company-gtags)))
  (add-hook 'c-mode-hook 'counsel-gtags-mode)
  (add-hook 'c++-mode-hook 'counsel-gtags-mode)
  (add-hook 'c-mode-hook 'company-mode)
  (add-hook 'c++-mode-hook 'company-mode)
  (define-key counsel-gtags-mode-map (kbd "C-c .") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
  (define-key counsel-gtags-mode-map (kbd "C-c ,") 'counsel-gtags-go-backward))


(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 120) ; chars
              (height . 55) ; lines
              (left . 0)
              (top . 50)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 120)
              (height . 55)
              (left . 0)
              (top . 50))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))
    (menu-bar-mode -1)
    ))

;;; init.el ends here
