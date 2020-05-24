;;; Places to learn from
;; https://github.com/emacs-tw/awesome-emacs
;; https://github.com/DamienCassou/emacs.d/blob/master/init.el

;;; Things to remember
;; -= How to pipe selected text into an external tool =-
;; Select text, M-x shell-command-on-region (which is fittingly bound to M-| by default).
;; If you want the selected text to be replaced, press C-u M-| instead of just M-| before entering the command.

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

(load "package-management.el")
(load "editing.el")
(load "clojure.el")
(load "setup-js.el")
(load "ui.el")

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

(use-package no-littering
  :demand t)

(use-package company)

(use-package ivy)

(use-package swiper)

;;; https://docs.projectile.mx/en/latest/
(use-package projectile
  :config
  (projectile-global-mode))

(use-package hydra)

(use-package magit
  :ensure-system-package git
  :config
    (async-shell-command "git config --global user.email git-david@bluekeys.eu")
    (async-shell-command "git config --global user.name David"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (uniquify no-littering paredit evil-multiedit cider clojure-mode-extra-font-locking clojure-mode tagedit rainbow-delimiters rainbow-delimeters evil-mc evil-collection undo-tree magit hydra projectile swiper ivy company evil use-package-ensure-system-package auto-package-update use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
