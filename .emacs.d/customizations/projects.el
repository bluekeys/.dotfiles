;;; https://docs.projectile.mx/en/latest/
(use-package projectile
  :after (ivy)
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path 
	(seq-filter 'file-directory-p (seq-filter 'stringp my-project-directories)))
  (projectile-mode +1))

(use-package counsel-projectile
  :after (counsel projectile)
  :config
  (counsel-projectile-mode))

