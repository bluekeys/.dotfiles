;;; (debug-on-entry do-after-load-evaluation)

;;; Places to learn from
;; https://github.com/emacs-tw/awesome-emacs
;; https://github.com/DamienCassou/emacs.d/blob/master/init.el

;;; Things to remember
;; -= How to pipe selected text into an external tool =-
;; Select text, M-x shell-command-on-region (which is fittingly bound to M-| by default).
;; If you want the selected text to be replaced, press C-u M-| instead of just M-| before entering the command.

;; C-u C-h a  -- apropos for functions and commands

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

(require 'seq) ;; http://ergoemacs.org/emacs/elisp_filter_list.html

(defcustom my-project-directories nil
  "Put project directories here. To be supplied to projectile et al."
  :type '(repeat directory))

(load "package-management.el")
(load "editing.el")
(load "clojure.el")
(load "setup-js.el")
(load "ui.el")
(load "projects.el")
(load "search.el") ;; search, replace, tags

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

;; Counsel
;; https://oremacs.com/2015/04/09/counsel-completion/

;; Counsel lives in the same repository as swiper and uses ivy to
;; - Complete Elisp at point with counsel-el.
;; - Complete Clojure at point with counsel-clj.
;; - Open a git-managed file with counsel-git.
;; - Describe an Elisp variable with counsel-describe-variable.
;; - Describe an Elisp function with counsel-describe-function.
;; - Look up an Elisp symbol in the info with counsel-info-lookup-symbol.
;; - Insert a Unicode character at point with counsel-unicode-char.
(use-package counsel
  :bind (("C-h f" . counsel-describe-function)
	 ("C-h u" . counsel-unicode-char)
	 ("C-h v" . counsel-describe-variable)
	 ("C-h s" . counsel-info-lookup-symbol)))

(use-package hydra)

(use-package magit
  :ensure-system-package git
  :config
    (async-shell-command "git config --global transfer.fsckObjects true") ;; https://lists.gnu.org/archive/html/emacs-devel/2016-01/msg01802.html
    (async-shell-command "git config --global user.email git-david@bluekeys.eu")
    (async-shell-command "git config --global user.name David"))

(use-package cider
  :bind ("C-c r" . cider-jack-in))

(use-package general
  :config
  (general-def 'normal
	       "M-." 'xref-find-definitions))

;;;
;;;
;;;
;;; CUSTOM SET VARS BELOW
;;;
;;;
;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(*project-directories* "~/Projects/ ~/src/")
 '(coffee-tab-width 2)
 '(global-hl-line-mode t)
 '(my-project-directories (quote ("~/Projects/" "~/doesntexist/")))
 '(package-selected-packages
   (quote
    (counsel-projectile wgrep ag general counsel uniquify no-littering paredit evil-multiedit cider clojure-mode-extra-font-locking clojure-mode tagedit rainbow-delimiters rainbow-delimeters evil-mc evil-collection undo-tree magit hydra projectile swiper ivy company evil use-package-ensure-system-package auto-package-update use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:inherit highlight :background "gold")))))

;;; TRAMP
(setq tramp-default-method "ssh")
