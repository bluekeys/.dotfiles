;; Show line numbers
(global-linum-mode)

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")

;; increase font size for better readability
(set-face-attribute 'default nil :height 140)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

;;; TODO: Only pick noto font if it exists on the system
;;; until then 
;;; fc-list can be used to find which fonts are available
;;; sudo apt install fonts-noto
;;; guix install font-google-noto; fc-cache -rv
(set-default-font "Noto Mono 14") ; Noto aims for complete UTF8 representation
(set-frame-font "Noto Mono 14")

(set-frame-parameter (selected-frame) 'internal-border-width 10)
(setq x-underline-at-descent-line t)
(setq-default line-spacing 2)
(set-default 'cursor-type  '(hbar . 5))
;; (modify-frame-parameters (selected-frame) (list (cons 'cursor-type '(hbar . 9))))

;; fringe
(fringe-mode '(14 . 0))
(set-face-attribute 'fringe nil :background nil)

(setq frame-background-mode 'light)
(set-background-color "#ffffff")
(set-foreground-color "#666666")

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)   ;; Show/hide startup page
(setq initial-scratch-message nil) ;; Show/hide *scratch* buffer message
(menu-bar-mode 0)                  ;; Show/hide menubar
(tool-bar-mode 0)                  ;; Show/hide toolbar
(tooltip-mode  0)                  ;; Show/hide tooltip
(scroll-bar-mode 0)                ;; Show/hide scrollbar
;; (setq initial-major-mode 'text-mode)
(save-place-mode 1)

(set-frame-parameter (selected-frame)
		     'internal-border-width 24)

(show-paren-mode t)

;; colourful parenthesis matching
(use-package rainbow-delimiters
  :config)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)
; (setq hl-line-face)

