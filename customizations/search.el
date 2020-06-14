;; http://pragmaticemacs.com/emacs/dont-search-swipe/
(use-package swiper
  :config
  (global-set-key (kbd "C-s") 'swiper)
  (setq ivy-display-style 'fancy))

;; Search and replace
;; https://sam217pa.github.io/2016/09/11/nuclear-power-editing-via-ivy-and-ag/
;; http://blog.binchen.org/posts/use-wgrep-and-evil-to-replace-text-efficiently.html
(use-package ag)
(use-package wgrep)

