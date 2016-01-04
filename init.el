;; ENVIRONNEMENT VARIABLE
;;----------------------------

;; set GOPATH and PATH : needed for some package dedicated to go coding
(setenv "PATH" "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/selmak/android/android-sdk-linux/tools:/home/selmak/android/android-sdk-linux/platform-tools:/usr/local/go/bin:/home/selmak/go/bin")
(setenv "GOPATH" "/home/selmak/go")


;; MELPA PACKAGE CONFIGURATION
;;----------------------------
(require 'package)
(package-initialize)

;; BACKUP-FILES
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))


(custom-set-variables
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-safe-themes (quote ("e292ec749f785d348969926448e25790356a7ce1a8fda6e695f5e8b70bed786b" "d6e27431f8cafb4a9136aebb1d4061f895b120bf88d34ff60c390d9905bd4e36" default)))
 '(initial-scratch-message ";; This buffer is for notes you don't want to save.")
 '(package-archives (quote (("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(projectile-enable-caching t)
 '(regex-tool-backend (quote perl))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(setq truncate-partial-width-windows nil)


;;THEME CONFIGURATION
;;--------------------
(load-theme 'monokai t)



;; STARTUP CONFIGURATION
;;----------------------
;; no startup 
(setq inhibit-startup-message t) 

;; PROJECTILE CONFIGURATION
;;-------------------------
(projectile-global-mode)
(setq projectile-indexing-method 'git)
(setq projectile-enable-caching t)
(custom-set-faces
 )

(require 'go-projectile)

;; GLOBAL CONFIGURATION
;;---------------------

;; Auto-revert
(global-auto-revert-mode 1)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140618.2217/dict")
(ac-config-default)
(global-auto-complete-mode t)

;; YAsnippet
(require 'yasnippet)
(yas-global-mode 1)

;; smart-parens
(require 'smartparens-config)
(smartparens-global-mode t)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)




;; MODE-CONFIGURATION
;;--------------------------

;; --- HTML

;; web-mode : for html and templates files
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; twig-mode
(require 'twig-mode)
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . twig-mode))


;; --- PHP

;; Fly-make for PHP
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)
(setq flymake-run-in-place nil)
(setq temporary-file-directory "~/.emacs.d/tmp/")
(setq flymake-no-changes-timeout 10)
(setq flymake-start-syntax-check-on-newline nil) 

;; php-auto-yasnippet
(require 'php-auto-yasnippets)
(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

;; --- JS

;; js3-mode
(require 'js3-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))


;; --- YAML

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; --- CSS / SASS
;; css-mode
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))


;; --- GO LANG

;; go-mode
(require 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; gofmt : reformat go code before saving
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/home/selmak/go")

;; go-jump
(defun my-go-mode-hook ()
  ; Call Gofmt before saving                                                    
   (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding                                                      
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; go-autocomplete
;;(require 'go-autocomplete)

;; go-direx
(require 'go-direx)
(define-key go-mode-map (kbd "C-c C-j") 'go-direx-pop-to-buffer)

;; go-eldoc
;; (require 'go-eldoc)
;; (add-hook 'go-mode-hook 'go-eldoc-setup)

;; GIT CONFIGURATION
;;------------------
(require 'git)


