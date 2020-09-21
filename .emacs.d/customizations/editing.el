;; Customizations relating to editing a buffer.
(save-place-mode 1)
(use-package undo-tree) ; https://elpa.gnu.org/packages/undo-tree.html

;;;
;;; Evil
;;;
;;; https://github.com/noctuid/evil-guide
(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

;; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; https://github.com/hlissner/evil-multiedit
(use-package evil-multiedit
  :after evil
  :config
  (evil-multiedit-default-keybinds))

;; https://github.com/gabesoft/evil-mc
;; (use-package evil-mc
;;   :after evil
;;   :config
;;   (global-evil-mc-mode 1))

;; | Key Binding | Description                        |
;; |-------------+------------------------------------|
;; |  g r f      | evil-mc-make-and-goto-first-cursor |
;; |  g r h      | evil-mc-make-cursor-here           |
;; |  g r j      | evil-mc-make-cursor-move-next-line |
;; |  g r k      | evil-mc-make-cursor-move-prev-line |
;; |  g r l      | evil-mc-make-and-goto-last-cursor  |
;; |  g r m      | evil-mc-make-all-cursors           |
;; |  g r n      | evil-mc-skip-and-goto-next-match   |
;; |  g r N      | evil-mc-skip-and-goto-next-cursor  |
;; |  g r p      | evil-mc-skip-and-goto-prev-match   |
;; |  g r P      | evil-mc-skip-and-goto-prev-cursor  |
;; |  g r r      | evil-mc-resume-cursors             |
;; |  g r s      | evil-mc-pause-cursors              |
;; |  g r u      | evil-mc-undo-all-cursors           |
;; 
;; For easy navigation you also have the following:
;; 
;; | Key Binding | Description                        |
;; |-------------+------------------------------------|
;; |  M-n        | evil-mc-make-and-goto-next-cursor  |
;; |  M-p        | evil-mc-make-and-goto-prev-cursor  |
;; |  C-n        | evil-mc-make-and-goto-next-match   |
;; |  C-p        | evil-mc-make-and-goto-prev-match   |
;; |  C-t        | evil-mc-skip-and-goto-next-match   |
;; |  C-M-j      | evil-mc-make-cursor-move-next-line |
;; |  C-M-k      | evil-mc-make-cursor-move-prev-line |

;; makes handling lisp expressions much, much easier
;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
(use-package paredit
  :hook ((emacs-lisp-mode
         eval-expression-minibuffer-setup
	 ielm-mode
	 clojure-mode
         lisp-mode
	 lisp-interaction-mode
         scheme-mode
         geiser-repl-mode) 
	 . enable-paredit-mode)) 
  
;; edit html like paredit
(use-package tagedit)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(use-package saveplace
  :config
    (setq-default save-place t)
    ;; keep track of saved places in ~/.emacs.d/places
    (setq save-place-file (concat user-emacs-directory "places")))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(setq electric-indent-mode nil)
