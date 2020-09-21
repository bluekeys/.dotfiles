;; key bindings and code colorization for Clojure
;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds ‘<2>’, ‘<3>’, etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
;; (use-package uniquify
;; :config
;; (setq uniquify-buffer-name-style 'forward))

;; https://github.com/clojure-emacs/clojure-mode
;; syntax hilighting for midje
(use-package clojure-mode
  :config
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))
            (rainbow-delimiters-mode)))

;; extra syntax highlighting for clojure
(use-package clojure-mode-extra-font-locking)

;; integration with a Clojure REPL
;; https://github.com/clojure-emacs/cider
(use-package cider
  :config
    ;; provides minibuffer documentation for the code you're typing into the repl
    (add-hook 'cider-mode-hook 'eldoc-mode)

    ;; go right to the REPL buffer when it's finished connecting
    (setq cider-repl-pop-to-buffer-on-connect t)

    ;; When there's a cider error, show its buffer and switch to it
    (setq cider-show-error-buffer t)
    (setq cider-auto-select-error-buffer t)

    ;; Where to store the cider history.
    (setq cider-repl-history-file "~/.emacs.d/cider-history")

    ;; Wrap when navigating history.
    (setq cider-repl-wrap-history t)

    ;; enable paredit in your REPL
    (add-hook 'cider-repl-mode-hook 'paredit-mode)

    ;; Use clojure mode for other extensions
    (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
    (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
    (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
    (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))
    ;; key bindings
;; these help me out with the way I usually develop web apps
(defun cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))

(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
     (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))
)
