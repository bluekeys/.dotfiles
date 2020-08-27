;;;
;;; STARTUP
;;;
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t) ; Go straight to scratch buffer on startup
(setq initial-scratch-message nil)

(fset 'yes-or-no-p 'y-or-n-p) ; Changes all yes/no questions to y/n type

;;;
;;; MINIBUFFER
;;;
;;; eldoc-mode shows documentation in the minibuffer when writing code
;;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;;
;;; MENUS AND SCROLLBARS
;;;
;(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ; Saves screen real-estate
(menu-bar-mode 0)                  ; Show/hide menubar
(tool-bar-mode 0)                  ; Show/hide toolbar
(tooltip-mode  0)                  ; Prefer help in echo area to pop-up window
(scroll-bar-mode 0)                ; Show/hide scrollbar
(global-set-key (kbd "s-t") '(lambda () (interactive))) ; don't pop up font menu

;;;
;;; LINE NUMBERS
;;;
(global-linum-mode) ; Helps with pair programming and tracing

;;;
;;; FRINGE
;;;
(fringe-mode '(25 . 25)) ;; fringe
(set-face-attribute 'fringe nil :background nil)

;;;
;;; BORDER
;;;
(set-frame-parameter (selected-frame) 'internal-border-width 10)

;;;
;;; FONT
;;;
;;; fc-list can be used to find which fonts are available
;;; sudo apt install fonts-noto
;;; guix install font-google-noto; fc-cache -rv
;;; TODO: Should only pick a font if it exists on the system
(set-default-font "Noto Mono 14") ; Noto aims for complete UTF8 representation
(set-frame-font "Noto Mono 14")   ; TODO: Use a variable
(set-face-attribute 'default nil :height 140) ; increase font size for better readability

;;;
;;; CURSOR
;;;
(blink-cursor-mode 0) ; Limit the distraction
(set-default 'cursor-type  '(hbar . 5)) ; Increase visibility

;;;
;;; BELL
;;;
(setq ring-bell-function 'ignore) ; no bell

;;;
;;; TITLE
;;;
(setq-default frame-title-format "%b (%f)") ; full path in title bar

;;;
;;; LINE AND UNDERLINE
;;;
(setq x-underline-at-descent-line t) ; give it space to work its magic
(setq-default line-spacing 2) ; just a smidge
(global-hl-line-mode 1)                  ; Highlight current line

;;;
;;; PARENTHESIS
;;;
(use-package rainbow-delimiters :config) ; colourful parenthesis matching
; FIXME colourful parenthesis don't work as I expect
(show-paren-mode 1) ; Highlights matching parenthesis

