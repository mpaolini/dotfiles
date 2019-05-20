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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(ansi-term-color-vector
   [unspecified "#f7f9fb" "#bf8b56" "#56bf8b" "#8bbf56" "#8b56bf" "#bf568b" "#8b56bf" "#405c79"] t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "cd4d1a0656fee24dc062b997f54d6f9b7da8f6dc8053ac858f15820f9a04a679" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "7d2e7a9a7944fbde74be3e133fc607f59fdbbab798d13bd7a05e38d35ce0db8d" "c856158cc996d52e2f48190b02f6b6f26b7a9abd5fea0c6ffca6740a1003b333" "ef98b560dcbd6af86fbe7fd15d56454f3e6046a3a0abd25314cfaaefd3744a9e" "a5956ec25b719bf325e847864e16578c61d8af3e8a3d95f60f9040d02497e408" "f27c3fcfb19bf38892bc6e72d0046af7a1ded81f54435f9d4d09b3bff9c52fc1" "62c81ae32320ceff5228edceeaa6895c029cc8f43c8c98a023f91b5b339d633f" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "8543b328ed10bc7c16a8a35c523699befac0de00753824d7e90148bca583f986" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "cc71cf67745d023dd2e81f69172888e5e9298a80a2684cbf6d340973dd0e9b75" "25c06a000382b6239999582dfa2b81cc0649f3897b394a75ad5a670329600b45" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "25c242b3c808f38b0389879b9cba325fb1fa81a0a5e61ac7cae8da9a32e2811b" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "b46ee2c193e350d07529fcd50948ca54ad3b38446dcbd9b28d0378792db5c088" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "dad1453029a183e5837ebfd7de65f74df7e06554e39468c758c8197bfa749fec" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "5f27195e3f4b85ac50c1e2fac080f0dd6535440891c54fcfa62cdcefedf56b1b" "84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" "40da996f3246a3e99a2dff2c6b78e65307382f23db161b8316a5440b037eb72c" default)))
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(fci-rule-color "#073642")
 '(flycheck-cppcheck-include-path
   (quote
    ("/home/marco/devel/feedstock/feedstock-smtp-inlet/feedstock/queue/include")))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (xclip solarized-theme gruvbox-theme dracula-theme base16-theme monokai-theme feature-mode vue-mode vue-html-mode go-mode rust-mode counsel-gtags company-jedi nord-theme yaml-mode markdown-mode use-package flycheck)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
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
     (column-number-mode . 120))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Python-mode + jedi
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

;; Elpy
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
  (setq elpy-test-runner (quote elpy-test-pytest-runner))
  ;; (setq python-shell-interpreter "jupyter"
  ;; 	python-shell-interpreter-args "console --simple-prompt"
  ;; 	python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters
            "jupyter")
  (add-hook 'elpy-mode-hook (lambda () (local-set-key (kbd "<f5>") "import pdb; pdb.set_trace()")))
 )

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (setq flycheck-clang-include-path '("/usr/include/python3.6m")))

;; js
(defun my-js-mode-hook ()
  "Custom `js-mode' behaviours."
  (setq indent-tabs-mode nil)
  (setq js-indent-level 2))
(add-hook 'js-mode-hook 'my-js-mode-hook)

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
(use-package nord-theme
  :ensure t
  :config
 )
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))
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
