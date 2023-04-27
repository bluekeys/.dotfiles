
;; Free as much screen real-estate as possible
;; It's fine, the tooltip can stay, it'll display in the echo area.

;; [[file:../../../../../projects/home/emacs.org::*Free as much screen real-estate as possible][Free as much screen real-estate as possible:1]]
(tooltip-mode t)
;; Free as much screen real-estate as possible:1 ends here


;; I don't need scrollbars, I have nyan mode

;; [[file:../../../../../projects/home/emacs.org::*Free as much screen real-estate as possible][Free as much screen real-estate as possible:2]]
(scroll-bar-mode -1)
;; Free as much screen real-estate as possible:2 ends here


;; Bye bye pretty button bar, I prefer M-`

;; [[file:../../../../../projects/home/emacs.org::*Free as much screen real-estate as possible][Free as much screen real-estate as possible:3]]
(tool-bar-mode -1)
;; Free as much screen real-estate as possible:3 ends here


;; As above

;; [[file:../../../../../projects/home/emacs.org::*Free as much screen real-estate as possible][Free as much screen real-estate as possible:4]]
(menu-bar-mode 0) ; so long file -> menu
;; Free as much screen real-estate as possible:4 ends here

;; Taken from "The modern emacs"

;; [[file:../../../../../projects/home/emacs.org::*Taken from "The modern emacs"][Taken from "The modern emacs":1]]
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(internal-border-width . 0) default-frame-alist)

(setq-default fringes-outside-margins t)
(setq-default left-margin-width 1)
(setq-default left-margin-width 1)

(setq use-dialog-box nil)
(setq use-file-dialog nil)
(setq inhibit-startup-screen t)
;; Taken from "The modern emacs":1 ends here

;; Initialise!

;; [[file:../../../../../projects/home/emacs.org::*Initialise!][Initialise!:1]]
(defvar my/org-roam-directory "~/roam")
(defvar my/org-roam-dailies-directory "~/roam/daily")
(defvar my/org-roam-templates-directory "~/roam/Templates")
(defvar my/major-mode-key "'")
(defvar my/leader-key "#")
;; Initialise!:1 ends here

;; Stop custom
;; Custom is manageable using use-package, and I just plain don't like it, because it writes itself by default to my init file.


;; [[file:../../../../../projects/home/emacs.org::*Stop custom][Stop custom:1]]
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; Stop custom:1 ends here

;; UTF8 everywhere
;; Set up unicode all the time.

;; [[file:../../../../../projects/home/emacs.org::*UTF8 everywhere][UTF8 everywhere:1]]
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq default-buffer-file-coding-system 'utf8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; UTF8 everywhere:1 ends here

;; Variables that need setting before bootstrap
;; Because I modify all my repos in emacs anyways and they're stored in ~/.emacs.d/straight/repos, I can probably get away with only checking for modifications on save.


;; [[file:../../../../../projects/home/emacs.org::*Variables that need setting before bootstrap][Variables that need setting before bootstrap:1]]
(when
    (eq window-system 'x)
    (setq straight-check-for-modifications '(check-on-save)))
;; Variables that need setting before bootstrap:1 ends here



;; Setting the variable straight-cache-autoloads causes the autoloads of all used packages to be cached in a single file.
;; You may wish to call straight-prune-build occasionally otherwise the file may grow large over time.


;; [[file:../../../../../projects/home/emacs.org::*Variables that need setting before bootstrap][Variables that need setting before bootstrap:2]]
(setq straight-cache-autoloads t)
(setq straight-use-package-by-default t)
;; Variables that need setting before bootstrap:2 ends here



;; Straight reports process output to its buffer, I'm normally just not interested, so I add a space to the beginning of its name to hide it from view.


;; [[file:../../../../../projects/home/emacs.org::*Variables that need setting before bootstrap][Variables that need setting before bootstrap:3]]
(setq straight-process-buffer " *straight-process*")
;; Variables that need setting before bootstrap:3 ends here

;; Bootstrap code
;; This is taken verbatim from the site.


;; [[file:../../../../../projects/home/emacs.org::*Bootstrap code][Bootstrap code:1]]
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; Bootstrap code:1 ends here

;; use-package - Declarative package configuration and loading
;; use-package loads features, not packages. Features can be tested for using featurep.

;; Use the :init keyword to execute code before a package is loaded.

;; Similarly, :config can be used to execute code after a package is loaded. In cases where loading is done lazily (see more about autoloading below), this execution is deferred until after the autoload occurs: 

;; https://github.com/jwiegley/use-package

;; While use-package can often seem like magic, you can demystify it by placing a point after a use-package stanza and doing M-x pp-macroexpand-last-sexp.

;; https://emacs.stackexchange.com/questions/61276/why-does-use-package-considers-emacs-as-a-package


;; [[file:../../../../../projects/home/emacs.org::*use-package - Declarative package configuration and loading][use-package - Declarative package configuration and loading:1]]
(straight-use-package 'use-package)
;; use-package - Declarative package configuration and loading:1 ends here

;; restart-emacs
;; - Make restarting emacs just work!
;; This is a simple, convenience wrapper around functions to restart emacs. In a terminal, on windows, wherever, this package has us covered.


;; [[file:../../../../../projects/home/emacs.org::*restart-emacs][restart-emacs:1]]
(use-package restart-emacs :delight)
;; restart-emacs:1 ends here

;; no-littering - Don't litter!
;; https://github.com/emacscollective/no-littering


;; [[file:../../../../../projects/home/emacs.org::*no-littering - Don't litter!][no-littering - Don't litter!:1]]
(use-package no-littering
  :config
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))
;; no-littering - Don't litter!:1 ends here

;; Evil
;; Imitate vi / vim, mainly for movement and because of muscle memory or ergonomics
;; For more information about this package, see https://github.com/noctuid/evil-guide

;; [[file:../../../../../projects/home/emacs.org::*Evil][Evil:1]]
(use-package evil
  :delight
  :config
  (evil-mode 1))
;; Evil:1 ends here

;; evil-multiedit
;; For more information about this package, see https://github.com/hlissner/evil-multiedit

;; [[file:../../../../../projects/home/emacs.org::*evil-multiedit][evil-multiedit:1]]
(use-package evil-multiedit :delight :after (evil) :config (evil-multiedit-default-keybinds))
;; evil-multiedit:1 ends here

;; undo-tree
;; For more information about this package, see https://elpa.gnu.org/packages/undo-tree.html

;; [[file:../../../../../projects/home/emacs.org::*undo-tree][undo-tree:1]]
(use-package undo-tree :delight :after (evil))
;; undo-tree:1 ends here

;; evil-cleverparens
;; Paredit with evil awareness for more than just lisp

;; [[file:../../../../../projects/home/emacs.org::*evil-cleverparens][evil-cleverparens:1]]
(use-package evil-cleverparens :after (evil))
;; evil-cleverparens:1 ends here

;; Get ESC to behave consistently

;; [[file:../../../../../projects/home/emacs.org::*Get ESC to behave consistently][Get ESC to behave consistently:1]]
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; Get ESC to behave consistently:1 ends here

;; General - For single key presses
;; - [ ] Pressing enter on any kind of link, should follow the link, in another window

;; This library plays well with evil and use-package

;; [[file:../../../../../projects/home/emacs.org::*General - For single key presses][General - For single key presses:1]]
(use-package general 
  :delight
  :config 
  (general-evil-setup t)

  (general-create-definer my-leader-def :prefix my/leader-key)
  ; This feels more comfortable to me than the emacs defaults
  (mmap "M-j" 'scroll-other-window)
  (mmap "M-k" 'scroll-other-window-down)

  (with-eval-after-load 'hydra
    (with-eval-after-load 'all-the-icons
      (defvar my/hydra-leader--title (s-concat (all-the-icons-faicon "magic" "Leader" 0 0) " : Magic menu"))

      (general-def :states '(normal motion) my/leader-key 'my/hydra-leader/body))))
;; General - For single key presses:1 ends here

;; Hydra - For things that are just so great, you want to keep doing them - hydra
;; https://rski.github.io/emacs/hydra/2017/04/08/a-case-for-hydra.html
;; https://github.com/abo-abo/hydra/wiki
;; https://oremacs.com/2015/01/20/introducing-hydra/

;; It helps me to think of a hydra function as a vim mode.

;; [[file:../../../../../projects/home/emacs.org::*Hydra - For things that are just so great, you want to keep doing them - hydra][Hydra - For things that are just so great, you want to keep doing them - hydra:1]]
(use-package hydra :delight)
;; Hydra - For things that are just so great, you want to keep doing them - hydra:1 ends here

;; Major Mode Hydras
;; https://github.com/jerrypnz/major-mode-hydra.el
;; As I use use-package, I can use the :mode-hydra keyword to create major mode hydras. 

;; [[file:../../../../../projects/home/emacs.org::*Major Mode Hydras][Major Mode Hydras:1]]
(use-package major-mode-hydra
  :demand t ; without this, :major-mode won't reliably work for use-package definitions
  :custom
  (major-mode-hydra-invisible-quit-key "SPC") 
  (major-mode-hydra-title-generator
      '(lambda (mode)
         (s-concat "\n"
                   (s-repeat 10 " ")
                   (all-the-icons-icon-for-mode mode :v-adjust 0.05)
                   " "
                   (symbol-name mode)
                   " commands")))
  :init (general-def :states '(normal motion) my/major-mode-key 'major-mode-hydra))
;; Major Mode Hydras:1 ends here

;; Misc
;; This is a catch all column.

;; [[file:../../../../../projects/home/emacs.org::*Misc][Misc:1]]
(with-eval-after-load 'hydra
  (with-eval-after-load 'major-mode-hydra
    (pretty-hydra-define+ my/hydra-leader (:color blue)
      ("Tools" (("D" dired "Dired"))
       "Misc"
       (("h" (if (eq system-type 'windows-nt)
                 (find-file "c:/Projects/home/emacs.org")
               (find-file "~/Projects/home/emacs.org")) "emacs.org"))
       "Roam"
       (("g" org-roam-graph "Graph")
        ("r" org-roam-buffer-toggle "Roam buffer toggle")
        ("i" org-roam-node-insert "Insert")
        ("j" my/hydra-capture/body "Capture daily")
        ("J" my/hydra-daily/body "Review daily")
                                        ;("j" my/hydra-roam-dailies/body "Journal")
                                        ;("c" org-roam-capture "Capture")
        ("f" org-roam-node-find "Find"))))))
;; Misc:1 ends here

;; Capture daily

;; [[file:../../../../../projects/home/emacs.org::*Capture daily][Capture daily:1]]
(defhydra my/hydra-capture (:color blue)
  "Capture"
  ("j" org-roam-dailies-capture-today "Today" :column "Capture")
  ("d" org-roam-dailies-capture-date "Date" :column "Capture"))
;; Capture daily:1 ends here

;; Review dailies

;; [[file:../../../../../projects/home/emacs.org::*Review dailies][Review dailies:1]]
(defhydra my/hydra-daily (:color blue)
  "Review Daily Notes"
  ("J" org-roam-dailies-goto-today "Today" :column "Goto" :color pink)
  ("k" org-roam-dailies-goto-next-note "Next note" :column "Goto" :color pink)
  ("j" org-roam-dailies-goto-previous-note "Previous note" :column "Goto" :color pink)
  ("l" org-roam-dailies-goto-tomorrow "Tomorrow" :column "Goto" :color pink)
  ("h" org-roam-dailies-goto-yesterday "Yesterday" :column "Goto" :color pink)
  ("." org-roam-dailies-find-directory "Dailies dir" :column "Goto")
  ("d" org-roam-dailies-goto-date "Date" :column "Goto"))
;; Review dailies:1 ends here

;; UI

;; [[file:../../../../../projects/home/emacs.org::*UI][UI:1]]
(with-eval-after-load 'hydra
  (defhydra my/hydra-text-scale (:color cyan :quit-key "SPC")
    "scale text"
    ("j" text-scale-increase "in")
    ("k" text-scale-decrease "out"))

  (with-eval-after-load 'major-mode-hydra
    (pretty-hydra-define+ my/hydra-leader ()
      ("Misc" (("s" (my/hydra-text-scale/body) "scale text" :color blue))))))
;; UI:1 ends here

;; Straight

;; [[file:../../../../../projects/home/emacs.org::*Straight][Straight:1]]
(with-eval-after-load 'hydra
  (defhydra hydra-straight-helper (:hint nil)
    "
    _c_heck all       |_f_etch all     |_m_erge all      |_n_ormalize all   |p_u_sh all
    _C_heck package   |_F_etch package |_M_erge package  |_N_ormlize package|p_U_sh package
    ----------------^^+--------------^^+---------------^^+----------------^^+------------||_q_uit||
    _r_ebuild all     |_p_ull all      |_v_ersions freeze|_w_atcher start   |_g_et recipe
    _R_ebuild package |_P_ull package  |_V_ersions thaw  |_W_atcher quit    |prun_e_ build"
    ("c" straight-check-all)
    ("C" straight-check-package)
    ("r" straight-rebuild-all)
    ("R" straight-rebuild-package)
    ("f" straight-fetch-all)
    ("F" straight-fetch-package)
    ("p" straight-pull-all)
    ("P" straight-pull-package)
    ("m" straight-merge-all)
    ("M" straight-merge-package)
    ("n" straight-normalize-all)
    ("N" straight-normalize-package)
    ("u" straight-push-all)
    ("U" straight-push-package)
    ("v" straight-freeze-versions)
    ("V" straight-thaw-versions)
    ("w" straight-watcher-start)
    ("W" straight-watcher-quit)
    ("g" straight-get-recipe)
    ("e" straight-prune-build)
    ("q" nil))

  (with-eval-after-load 'major-mode-hydra
    (pretty-hydra-define+ my/hydra-leader ()
      ("Tools" (("S" (hydra-straight-helper/body) "Straight" :color blue))))))
;; Straight:1 ends here

;; Global org-mode

;; [[file:../../../../../projects/home/emacs.org::*Global org-mode][Global org-mode:1]]
(with-eval-after-load 'hydra
  (defhydra hydra-global-org (:color blue :hint nil)
    "
  Timer^^        ^Clock^         ^Capture^       ^Document^
  ----------------------------------------------------------
  s_t_art        _W_ clock in    _c_apture       _o_ overview
   _s_top        _O_ clock out   _l_ast capture
  _r_eset        _J_ clock goto
  _p_rint
  "
    ("t" org-timer-start)
    ("s" org-timer-stop)
    ;; Need to be at timer
    ("r" org-timer-set-timer)
    ;; Print timer value to buffer
    ("p" org-timer)
    ("W" (org-clock-in '(4)))
    ("O" org-clock-out)
    ;; Visit the clocked task from any buffer
    ("J" org-clock-goto)
    ("c" org-capture)
    ("l" org-capture-goto-last-stored)
    ("o" org-overview))

  (with-eval-after-load 'major-mode-hydra
    (pretty-hydra-define+ my/hydra-leader () ("Misc" (("o" (hydra-global-org/body) "Org" :color blue))))))
;; Global org-mode:1 ends here

;; emacs-guix

;; [[file:../../../../../projects/home/emacs.org::*emacs-guix][emacs-guix:1]]
(with-eval-after-load 'major-mode-hydra
  (pretty-hydra-define+ my/hydra-leader ()
    ("Tools" (("g" (guix-popup) "Guix" :color blue)))))
;; emacs-guix:1 ends here

;; Hercules - Never need to write another hydra again!
;; https://gitlab.com/jjzmajic/hercules.el
;; https://github.com/abo-abo/hydra/wiki

;; [[file:../../../../../projects/home/emacs.org::*Hercules - Never need to write another hydra again!][Hercules - Never need to write another hydra again!:1]]
(use-package hercules :after hydra)
;; Hercules - Never need to write another hydra again!:1 ends here

;; yes/no => y/n
;; Kiss, right?

;; [[file:../../../../../projects/home/emacs.org::*yes/no => y/n][yes/no => y/n:1]]
(fset 'yes-or-no-p 'y-or-n-p)
;; yes/no => y/n:1 ends here

;; Bell
;; I'm not a big fan of noise, but I do like the visible bell

;; [[file:../../../../../projects/home/emacs.org::*Bell][Bell:1]]
(setq visible-bell t)
(setq ring-bell-function nil)
;; Bell:1 ends here

;; Cursor blinking
;; I find a blinking cursor can be distracting

;; [[file:../../../../../projects/home/emacs.org::*Cursor blinking][Cursor blinking:1]]
(blink-cursor-mode 0)
;; Cursor blinking:1 ends here

;; Dialog boxes
;; I don't think dialog boxes are my style.

;; [[file:../../../../../projects/home/emacs.org::*Dialog boxes][Dialog boxes:1]]
(setq use-dialog-box nil)
;; Dialog boxes:1 ends here

;; Frame transparency

;; [[file:../../../../../projects/home/emacs.org::*Frame transparency][Frame transparency:1]]
(set-frame-parameter (selected-frame) 'alpha '(100 . 100))
(add-to-list 'default-frame-alist '(alpha . (100 . 100)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Frame transparency:1 ends here

;; Icons

;; [[file:../../../../../projects/home/emacs.org::*Icons][Icons:1]]
(use-package all-the-icons :delight)
;; Icons:1 ends here

;; Line numbers
;; I prefer line numbers in most modes for pair programming etc, but have found enabling them on a per-mode basis rather than globally works best.

;; [[file:../../../../../projects/home/emacs.org::*Line numbers][Line numbers:1]]
(global-display-line-numbers-mode 0)
(dolist (mode '(elisp-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))
;; Line numbers:1 ends here

;; Parenthesis colour matching

;; [[file:../../../../../projects/home/emacs.org::*Parenthesis colour matching][Parenthesis colour matching:1]]
(use-package rainbow-delimiters
  :delight
  :hook (prog-mode . rainbow-delimiters-mode))
;; Parenthesis colour matching:1 ends here

;; Scrolling
;; One line at a time.

;; [[file:../../../../../projects/home/emacs.org::*Scrolling][Scrolling:1]]
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;; Scrolling:1 ends here


;; Don't accelerate scrolling

;; [[file:../../../../../projects/home/emacs.org::*Scrolling][Scrolling:2]]
(setq mouse-wheel-progressive-speed nil)
;; Scrolling:2 ends here


;; Scroll window under mouse

;; [[file:../../../../../projects/home/emacs.org::*Scrolling][Scrolling:3]]
(setq mouse-wheel-follow-mouse 't)
;; Scrolling:3 ends here


;; Keyboard scroll one line at a time

;; [[file:../../../../../projects/home/emacs.org::*Scrolling][Scrolling:4]]
(setq scroll-step 1)
;; Scrolling:4 ends here

;; Org related UI tweaks
;; TIP: use describe-face org- if you think something isn't looking its best


;; [[file:../../../../../projects/home/emacs.org::*Org related UI tweaks][Org related UI tweaks:1]]
(defun my/org-apply-ui ()
  (interactive)
  (with-eval-after-load 'org
    (org-indent-mode) ; indent text according to outline structure
    ;(auto-fill-mode 0) ; don't automatically break lines exceeding current-fill-column
    (visual-line-mode 1) ; instead of breaking lines exceeding current-fill-column, visually wrap them

    (customize-set-variable 'org-ellipsis " ➠")
    (customize-set-variable 'org-hide-emphasis-markers t)
    (customize-set-variable 'evil-auto-indent nil)
    (customize-set-variable 'org-src-window-setup 'current-window "open org-src blocks in current window")

;;; Replace list hyphen with dot
    ;; (font-lock-add-keywords 'org-mode
    ;;                         '(("^ *\\([-]\\) "
    ;;                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) " "))))))

    ))
;; Org related UI tweaks:1 ends here

;; Bullets

;; [[file:../../../../../projects/home/emacs.org::*Bullets][Bullets:1]]
(use-package org-bullets
  :delight
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom (org-bullets-bullet-list '("➊" "➋" "➌" "➍" "➎" "➏" "➐" "➑" "➒")))
;; Bullets:1 ends here

;; Margins

;; [[file:../../../../../projects/home/emacs.org::*Margins][Margins:1]]
(setq-default fringes-outside-margins t)
(setq-default left-margin-width 1)
(setq-default right-margin-width 1)
;; Margins:1 ends here

;; Fonts

;; [[file:../../../../../projects/home/emacs.org::*Fonts][Fonts:1]]
;(set-frame-font "Fantasque Sans Mono-14" nil t)
;(set-frame-font "Source Code Pro-14" nil t)
  ;(defvar my/fixed-pitch-font "Noto Mono")
  ;(defvar my/fixed-pitch-height 110)
  ;(defvar my/variable-pitch "Cantarell")
  ;(defvar my/variable-pitch-height 160)

;; Main typeface
(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 110)

;; Proportionately spaced typeface
(set-face-attribute 'variable-pitch nil :family "DejaVu Serif" :height 1.0)

;; Monospaced typeface
(set-face-attribute 'fixed-pitch nil :family "DejaVu Sans Mono" :height 1.0)
;; Fonts:1 ends here

;; Move modeline to the top

;; [[file:../../../../../projects/home/emacs.org::*Move modeline to the top][Move modeline to the top:1]]
(setq-default header-line-format mode-line-format)
(setq-default mode-line-format nil)
; (setq-default header-line-format mode-line-format)
;(custom-set-faces header-line-format t :inherit mode-line-format)
;; Move modeline to the top:1 ends here



;; Hook window change and copy mode-line face to header-line

;; [[file:../../../../../projects/home/emacs.org::*Move modeline to the top][Move modeline to the top:2]]
(defun header-line-update-face (window)
  "Update the `header-line' face in WINDOW to indicate whether the window is selected."
  (with-current-buffer (window-buffer window)
    (if (eq (current-buffer) (window-buffer (selected-window)))
        (progn
            (set-face-attribute 'header-line nil :inherit 'mode-line)
            ;(set-face-attribute 'header-line nil :inherit 'mode-line-active)
            ;(set-face-attribute 'header-line nil :inherit 'mode-line)
            ;(set-face-attribute 'header-line nil :inherit 'mode-line)
          )
      (progn
            (set-face-attribute 'header-line nil :inherit 'mode-line-inactive)
        )))

  )
;; Move modeline to the top:2 ends here



;; Fix modeline so that it uses modus theme when moved to the top

;; [[file:../../../../../projects/home/emacs.org::*Move modeline to the top][Move modeline to the top:3]]
(defun my-modus-themes-custom-faces ()
  (set-face-attribute 'header-line nil :inherit 'mode-line)
                                        ;(set-face-attribute 'header-line-buffer-id nil :inherit 'mode-line-buffer-id)
                                        ;(set-face-attribute 'header-line-emphasis nil :inherit 'mode-line-emphasis)
                                        ;(set-face-attribute 'header-line-highlight nil :inherit 'mode-line-highlight)
                                        ;(set-face-attribute 'header-line-inactive nil :inherit 'mode-line-inactive)
  )

(add-hook 'modus-themes-after-load-theme-hook #'my-modus-themes-custom-faces)

;; (defvar my/selected-win nil)

;; (defun apply-modeline-face-to-header-line (windows)
;;   (when (not (minibuffer-window-active-p (frame-selected-window)))
;;       (setq my/selected-win (selected-window))))

;; (add-function :before pre-redisplay-function #'apply-modeline-face-to-header-line)

;; `(mode-line ((,class ,@(modus-themes--variable-pitch-ui)
;;                      ,@(modus-themes--mode-line-attrs
;;                         fg-active bg-active
;;                         fg-dim bg-active
;;                         fg-main bg-active-accent
;;                         fg-alt bg-active
;;                         'alt-style bg-main))))
;; `(mode-line-buffer-id ((,class :inherit bold)))
;; `(mode-line-emphasis ((,class :inherit bold :foreground ,blue-active)))
;; `(mode-line-highlight ((,class :inherit modus-themes-active-blue
;;                            :box (:line-width -1 :style pressed-button))))
;; `(mode-line-inactive ((,class ,@(modus-themes--variable-pitch-ui)
;;                               ,@(modus-themes--mode-line-attrs
;;                                  fg-inactive bg-inactive
;;                                  fg-alt bg-dim
;;                                  fg-inactive bg-inactive
;;                                  bg-region bg-active))))
;; Move modeline to the top:3 ends here

;; Highlight

;; [[file:../../../../../projects/home/emacs.org::*Highlight][Highlight:1]]
(hl-line-mode)
(show-paren-mode)
;; Highlight:1 ends here

;; Disable all themes

;; [[file:../../../../../projects/home/emacs.org::*Disable all themes][Disable all themes:1]]
(defun sb/disable-all-themes ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))
;; Disable all themes:1 ends here

;; Load theme

;; [[file:../../../../../projects/home/emacs.org::*Load theme][Load theme:1]]
(defun sb/load-theme (theme)
  "Enhance `load-theme' by first disabling enabled themes."
  (sb/disable-all-themes)
  (load-theme theme t)
  (sml/apply-theme 'light-powerline))
;; Load theme:1 ends here

;; A theme switching hydra

;; [[file:../../../../../projects/home/emacs.org::*A theme switching hydra][A theme switching hydra:1]]
(setq sb/hydra-selectors
      "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ")

(defun sb/sort-themes (themes)
  (sort themes
        (lambda (a b)
          (string<
           (symbol-name a)
           (symbol-name b)))))

(defun sb/hydra-load-theme-heads (themes)
  (mapcar* (lambda (a b)
             (list (char-to-string a)
                   `(sb/load-theme ',b)
                   (symbol-name b)))
           sb/hydra-selectors themes))

(defun populate-theme-hydra ()
  (interactive)
  (eval `(defhydra sb/hydra-select-themes
           (:hint nil :color pink)
           "Select Theme"
           ,@(sb/hydra-load-theme-heads
              (sb/sort-themes
               (custom-available-themes)))
           ("DEL" (sb/disable-all-themes))
           ("RET" nil "done" :color blue))))

(with-eval-after-load 'major-mode-hydra
  (pretty-hydra-define+ my/hydra-leader ()
    ("Misc"
     (("t" (progn 
             (populate-theme-hydra)
             (sb/hydra-select-themes/body)) 
       "change theme" :color blue)))))
;; A theme switching hydra:1 ends here

;; Apply modus theme
;; https://protesilaos.com/modus-themes/

;; [[file:../../../../../projects/home/emacs.org::*Apply modus theme][Apply modus theme:1]]
(use-package modus-themes
  :ensure
  ;:after (moody)
  :init
  (setq-default header-line-format mode-line-format)
                                        ;(setq-default mode-line-format nil)
                                        ;(setq-default header-line-format mode-line-format)
  ;; Add all you customizations priot to loading the themes
  (setq modus-themes-italit-constructs t
        modus-themes-success-deuteranopia t
        modus-themes-bold-constructs t
        modus-themes-italic-constructs t
        modus-themes-links '(neutral-underline faint background)
        modus-themes-prompts '(intense background gray)
        modus-themes-mode-line '(3d accented)
        face-near-same-color-threshold 70000
        x-underline-at-descent-line t
        modus-themes-completions 'opinionated
        modus-themes-fringes 'intense
        modus-themes-lang-checkers '(straight-underline)
        modus-themes-hl-line '(accented)
        modus-themes-subtle-line-numbers t
        modus-themes-paren-match '(intense underline)
        modus-themes-region '(bg-only no-extend)
        modus-themes-diffs '(bg-only)
        modus-themes-org-blocks 'tinted-background
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        modus-themes-org-agenda
        '((header-block . (variable-pitch scale-title))
          (header-date . (grayscale workaholic bold-today))
          (scheduled . uniform)
          (habit . traffic-light))
        modus-themes-headings
        '((1 . (background overline))
          (2 . (overline rainbow))
          (t . (monochrome)))
        modus-themes-scale-headings t
        modus-themes-scale-1 1.05
        modus-themes-scale-2 1.1
        modus-themes-scale-3 1.15
        modus-themes-scale-4 1.2
        modus-themes-scale-title 1.3
        )

  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-operandi) ;; OR (modus-themes-load-vivendi)

  :bind ("<f5>" . modus-themes-toggle))
;; Apply modus theme:1 ends here

;; Completion UI - Icomplete vertical

;; [[file:../../../../../projects/home/emacs.org::*Completion UI - Icomplete vertical][Completion UI - Icomplete vertical:1]]
(use-package icomplete-vertical
  :demand t
  :custom
  (completion-styles '(partial-completion substring))
  (completion-category-overrides '((file (styles basic substring))))
  (read-file-name-completion-ignore-case t)
  (read-buffer-completion-ignore-case t)
  (completion-ignore-case t)
  :config
  (icomplete-mode)
  (icomplete-vertical-mode)
  :bind (:map icomplete-minibuffer-map
              ("<down>" . icomplete-forward-completions)
              ("C-n" . icomplete-forward-completions)
              ("<up>" . icomplete-backward-completions)
              ("C-p" . icomplete-backward-completions)
              ("C-v" . icomplete-vertical-toggle)))
;; Completion UI - Icomplete vertical:1 ends here

;; Incremental narrowing

;; [[file:../../../../../projects/home/emacs.org::*Incremental narrowing][Incremental narrowing:1]]
(use-package selectrum
  :config
  (selectrum-mode +1))

(use-package selectrum-prescient
  :after (selectrum)
  :config
  (selectrum-prescient-mode +1)
  (prescient-persist-mode +1))
;; Incremental narrowing:1 ends here

;; Consult
;; https://github.com/minad/consult

;; [[file:../../../../../projects/home/emacs.org::*Consult][Consult:1]]
(use-package consult)
;; Consult:1 ends here

;; Vertico
;; https://github.com/minad/vertico

;; [[file:../../../../../projects/home/emacs.org::*Vertico][Vertico:1]]
(use-package vertico
  :init
  (vertico-mode))
;; Vertico:1 ends here

;; Acting on targets
;; https://github.com/oantolin/embark/

;; [[file:../../../../../projects/home/emacs.org::*Acting on targets][Acting on targets:1]]
(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))
;; Acting on targets:1 ends here

;; Annotations
;; https://github.com/minad/marginalia

;; [[file:../../../../../projects/home/emacs.org::*Annotations][Annotations:1]]
;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))
;; Annotations:1 ends here

;; help-macro+

;; [[file:../../../../../projects/home/emacs.org::*help-macro+][help-macro+:1]]
(use-package help-macro+ :straight (:type git :host github :repo "emacsmirror/help-macro-plus"))
;; help-macro+:1 ends here

;; help-fns+

;; [[file:../../../../../projects/home/emacs.org::*help-fns+][help-fns+:1]]
(use-package help-fns+ :straight (:type git :host github :repo "emacsmirror/help-fns-plus"))
;; help-fns+:1 ends here

;; help-find

;; [[file:../../../../../projects/home/emacs.org::*help-find][help-find:1]]
(use-package help-find :straight (:type git :host github :repo "emacsmirror/help-find"))
;; help-find:1 ends here

;; helpful

;; [[file:../../../../../projects/home/emacs.org::*helpful][helpful:1]]
(use-package helpful)
;; helpful:1 ends here

;; Org-mode

;; [[file:../../../../../projects/home/emacs.org::*Org-mode][Org-mode:1]]
(use-package org
  :delight
  :straight (:type built-in)
  :after (all-the-icons major-mode-hydra)
  :config
  (require 'ox-org)
  (require 'org-habit)
  (setq org-log-into-drawer t)
  :custom
  (org-catch-invisible-edits 'smart)
  :preface
  (defun my/org-mode-setup ()
    (my/org-apply-ui)
    (setq org-agenda-files
          (append 
           `(,my/org-roam-directory)
           `(,my/org-roam-dailies-directory)
                                            ;'("~/org/agenda")
                                            ;(file-expand-wildcards "~/Projects/*/*.org")
                                            ;FIXME, projects will differ on other boxes, link this to projectile instead of hard-coding
                                            ;(file-expand-wildcards "~/*/*.org")
           ))
    
    )
  :hook ((org-mode . my/org-mode-setup))
  :mode-hydra 
  (org-mode
   ("Clock"
    (("t" org-timer-start)
     ("s" org-timer-stop)
     ;; Need to be at timer
     ("r" org-timer-set-timer)
     ;; Print timer value to buffer
     ("p" org-timer)
     ("w" (org-clock-in '(4)))
     ("o" org-clock-out)
     ;; Visit the clocked task from any buffer
     ("j" org-clock-goto)
     ("c" org-capture)
     ("l" org-capture-goto-last-stored))
    "Move"
    (("h" org-previous-visible-heading :color red)
     ("j" org-forward-element :color red)
     ("k" org-backward-element :color red)
     ("l" org-next-visible-heading :color red))))
  )
;; Org-mode:1 ends here

;; org-roam
;; https://www.orgroam.com/manual.html
;; Installation

;; [[file:../../../../../projects/home/emacs.org::*org-roam][org-roam:1]]
(use-package org-roam
  :after org
  :custom 
  (org-roam-directory my/org-roam-directory)
  (org-roam-templates-directory my/org-roam-templates)

  :init
  (setq org-roam-v2-ack t)
  (require 'org-roam)

  :config
  (org-roam-setup)
  ;(org-roam-db-autosync-mode)
  ;(org-roam-db-sync)
  )
;; org-roam:1 ends here

;; Templates
;; - [ ] https://takeonrules.com/2020/12/08/revisiting-hydra-menu-for-org-roam-lookup-in-emacs/
;; Progfolio/doct

;; Everything starts with an idea.
;; I can either use org-capture (org)Capture
;; or, (org-roam)Daily-notes
;; Either way, this will be an inbox for processing later. In a gtd sense.
;; I'm going to lean towards using org-roam for things like capture templates.


;; [[file:../../../../../projects/home/emacs.org::*Templates][Templates:1]]
(defvar my/org-roam-capture-templates
  '(("d" "default" plain
     "%?"
     :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}") :unnarrowed t)
    ("l" "Programming language" plain
     "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n* Reference:\n\n"
     :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}") :unnarrowed t)
    ("p" "Project" plain
     (file "~/roam/Templates/Project.org")
     :if-new (file+head "%<%y%m%d%h%m%s>-${slug}.org" "#+title: project: ${title}\n#+filetags: project") :unnarrowed t)
    ("m" "Meeting" plain
     (file "~/roam/Templates/Meeting.org")
     :if-new (file+head "%<%y%m%d%h%m%s>-${slug}.org" "#+title: project: ${title}\n#+filetags: project") :unnarrowed t)
    ))
;; Templates:1 ends here

;; [[file:../../../../../projects/home/emacs.org::*Templates][Templates:2]]
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>"))))
;; Templates:2 ends here

;; Don't confirm

;; [[file:../../../../../projects/home/emacs.org::*Don't confirm][Don't confirm:1]]
(setq org-confirm-babel-evaluate nil)
;; Don't confirm:1 ends here

;; awk

;; [[file:../../../../../projects/home/emacs.org::*awk][awk:1]]
(with-eval-after-load 'org
  (add-to-list 'org-src-lang-modes '("awk" . awk))
  (org-babel-do-load-languages 'org-babel-load-languages '((awk . t))))
;; awk:1 ends here

;; C / C++ / D

;; [[file:../../../../../projects/home/emacs.org::*C / C++ / D][C / C++ / D:1]]
(with-eval-after-load 'org
  (add-to-list 'org-src-lang-modes '("C" . c))
  (org-babel-do-load-languages 'org-babel-load-languages '((C . t))))
;; C / C++ / D:1 ends here

;; Ditaa

;; [[file:../../../../../projects/home/emacs.org::*Ditaa][Ditaa:1]]
(with-eval-after-load 'org
(add-to-list 'org-src-lang-modes '("ditaa" . ditaa))
(org-babel-do-load-languages 'org-babel-load-languages '((ditaa . t))))
;; Ditaa:1 ends here

;; Dot

;; [[file:../../../../../projects/home/emacs.org::*Dot][Dot:1]]
(with-eval-after-load 'org
(add-to-list 'org-src-lang-modes '("dot" . dot))
(org-babel-do-load-languages 'org-babel-load-languages '((dot . t))))
;; Dot:1 ends here

;; eLisp

;; [[file:../../../../../projects/home/emacs.org::*eLisp][eLisp:1]]
(with-eval-after-load 'org
(add-to-list 'org-src-lang-modes '("elisp" . elisp))
(org-babel-do-load-languages 'org-babel-load-languages '((emacs-lisp . t))))
;; eLisp:1 ends here

;; Java

;; [[file:../../../../../projects/home/emacs.org::*Java][Java:1]]
(with-eval-after-load 'org
(add-to-list 'org-src-lang-modes '("java" . java))
(org-babel-do-load-languages 'org-babel-load-languages '((java . t))))
;; Java:1 ends here

;; Lisp

;; [[file:../../../../../projects/home/emacs.org::*Lisp][Lisp:1]]
(with-eval-after-load 'org
(add-to-list 'org-src-lang-modes '("lisp" . lisp))
(org-babel-do-load-languages 'org-babel-load-languages '((lisp . t))))
;; Lisp:1 ends here

;; Python

;; [[file:../../../../../projects/home/emacs.org::*Python][Python:1]]
(with-eval-after-load 'org
(add-to-list 'org-src-lang-modes '("python" . python))
(org-babel-do-load-languages 'org-babel-load-languages '((python . t))))
;; Python:1 ends here

;; Plantuml

;; [[file:../../../../../projects/home/emacs.org::*Plantuml][Plantuml:1]]
(use-package plantuml-mode
  :after org
  :config
  (if (not (eq 'system-type 'windows-nt))
      (setq org-plantuml-jar-path (expand-file-name "/home/user/.guix-profile/bin/plantuml")))
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
)
;; Plantuml:1 ends here

;; Ruby

;; [[file:../../../../../projects/home/emacs.org::*Ruby][Ruby:1]]
(with-eval-after-load 'org
(add-to-list 'org-src-lang-modes '("ruby" . ruby))
(org-babel-do-load-languages 'org-babel-load-languages '((ruby . t))))
;; Ruby:1 ends here

;; SQL

;; [[file:../../../../../projects/home/emacs.org::*SQL][SQL:1]]
(with-eval-after-load 'org
(add-to-list 'org-src-lang-modes '("sql" . sql))
(org-babel-do-load-languages 'org-babel-load-languages '((sql . t))))
;; SQL:1 ends here

;; Sqlite

;; [[file:../../../../../projects/home/emacs.org::*Sqlite][Sqlite:1]]
(with-eval-after-load 'org
(add-to-list 'org-src-lang-modes '("sqlite" . sqlite))
(org-babel-do-load-languages 'org-babel-load-languages '((sqlite . t))))
;; Sqlite:1 ends here

;; Scheme

;; [[file:../../../../../projects/home/emacs.org::*Scheme][Scheme:1]]
(with-eval-after-load 'org
(add-to-list 'org-src-lang-modes '("scheme" . scheme))
(org-babel-do-load-languages 'org-babel-load-languages '((scheme . t))))
;; Scheme:1 ends here

;; Shell

;; [[file:../../../../../projects/home/emacs.org::*Shell][Shell:1]]
(with-eval-after-load 'org
  (add-to-list 'org-src-lang-modes '("shell" . shell))
  (org-babel-do-load-languages 'org-babel-load-languages '((shell . t))))
;; Shell:1 ends here

;; Templates
;; Org mode template keywords, like 

;; | Example | Result                 |
;; |---------+------------------------|
;; | <el     | #+begin_src emacs-lisp |
;; | <sh     | #+begin_src shell      |
;; | <I      | #+include: "guix.org"  |
;; | <L      | #+latex:               |
;; | <H      | #+html:                |
;; | <A      | #+ascii:               |
;; | <i      | #+index:               |


;; [[file:../../../../../projects/home/emacs.org::*Templates][Templates:1]]
(use-package org-tempo
  :delight
  :straight (:type built-in)
  :config
  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python")))
;; Templates:1 ends here

;; Async
;; When I'm running those blocks, I'd like the option for them to run async

;; [[file:../../../../../projects/home/emacs.org::*Async][Async:1]]
(use-package ob-async
  :delight
  :config
  (setq ob-async-no-async-languages-alist '("ipython")))
;; Async:1 ends here

;; Hercules

;; [[file:../../../../../projects/home/emacs.org::*Hercules][Hercules:1]]
(hercules-def
 :toggle-funs #'org-babel-mode
 :keymap 'org-babel-map
 :transient t)

(define-key org-mode-map (kbd "C-c C-v") #'org-babel-mode)
;; Hercules:1 ends here

;; Org capture templates

;; [[file:../../../../../projects/home/emacs.org::*Org capture templates][Org capture templates:1]]
(setq org-capture-templates
      '(("r" "Risk" table-line (file+headline (lambda () (buffer-file-name)) "Risks") "|id|%u|%?||")
        ("a" "Assumption" table-line (file+headline (lambda () (buffer-file-name)) "Assumptions") "")
        ("i" "Issue" table-line (file+headline (lambda () (buffer-file-name)) "Issues") "")
        ("d" "Decision" table-line (file+headline (lambda () (buffer-file-name)) "Decisions") "")
        ("t" "Task" entry (file+headline (lambda () (buffer-file-name)) "Tasks") "** TODO %^{Description}%?\n:LOGBOOK:\n- Added: %U\n:END:")
        ("m" "Meeting" entry (file+headline (lambda () (buffer-file-name)) "Meeting")
         "")
        ))
;; Org capture templates:1 ends here

;; These are the files that are used to build the agenda
;; https://orgmode.org/manual/Agenda-Files.html#Agenda-Files
;; The files to be used for the agenda display

;; [[file:../../../../../projects/home/emacs.org::*These are the files that are used to build the agenda][These are the files that are used to build the agenda:1]]
(setq org-agenda-files
      (append 
       `(,my/org-roam-directory)
       `(,my/org-roam-dailies-directory)
                                        ;'("~/org/agenda")
                                        ;(file-expand-wildcards "~/Projects/*/*.org")
                                        ;FIXME, projects will differ on other boxes, link this to projectile instead of hard-coding
                                        ;(file-expand-wildcards "~/*/*.org")
       ))
;; These are the files that are used to build the agenda:1 ends here

;; This will show Dashboard in frames created with emacsclient -c

;; [[file:../../../../../projects/home/emacs.org::*This will show Dashboard in frames created with emacsclient -c][This will show Dashboard in frames created with emacsclient -c:1]]
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
;; This will show Dashboard in frames created with emacsclient -c:1 ends here

;; Configure the dashboard

;; [[file:../../../../../projects/home/emacs.org::*Configure the dashboard][Configure the dashboard:1]]
(use-package dashboard
  :delight
  :custom (dashboard-page-separator "\n\n\n")
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((agenda . 10)))
  (setq dashboard-set-init-info t)
  (setq dashboard-week-agenda t)
  (setq dashboard-org-agenda-categories '("Tasks" "Appointments"))
  (setq dashboard-filter-agenda-entry 'dashboard-filter-agenda-by-time)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-agenda-release-buffers t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-footer nil)
  (setq dashboard-startup-banner "~/Downloads/8afe1c4eaca4ed80b7123771b1c7e84f.png")

  ; Code to pick a random motivational startup message from a selection stored in an org-file.
  (defcustom dashboard-banner-logo-titles
    '(
      "Woooohoooo"
      "Welcome to the jungle!"
      "Emacs Rocks!"
      )
    "A list of messages, one of which dashboard chooses to display as the logo subtitle."
    :type 'list
    :group 'dashboard)

  (setq dashboard-banner-logo-title (nth (random (1- (1+ (length dashboard-banner-logo-titles)))) dashboard-banner-logo-titles))

  ;(org-roam-db-query [:select * :from nodes :where (= id "75aeefb8-8ac8-430f-b136-77c44934afad")])

  ;; (("75aeefb8-8ac8-430f-b136-77c44934afad"
  ;;   "/home/user/roam/20210828155526-motivational_quotes.org"
  ;;   0 1 nil nil nil nil
  ;;   "Motivational Quotes" (
  ;; 			   ("CATEGORY" . "20210828155526-motivational_quotes")
  ;; 			   ("ID" . "75aeefb8-8ac8-430f-b136-77c44934afad")
  ;; 			   ("BLOCKED" . "")
  ;; 			   ("FILE" . "/home/user/roam/20210828155526-motivational_quotes.org")
  ;; 			   ("PRIORITY" . "B")
  ;; 			   )
  ;;   nil))

  )
;; Configure the dashboard:1 ends here

;; Create a shortcut function to switch to the dashboard

;; [[file:../../../../../projects/home/emacs.org::*Create a shortcut function to switch to the dashboard][Create a shortcut function to switch to the dashboard:1]]
(defun my/dashboard-switch ()
  "Switch to dashboard and refresh content"
  (interactive)
  (switch-to-buffer "*dashboard*")
  (dashboard-refresh-buffer))

(with-eval-after-load 'general
  (pretty-hydra-define+ my/hydra-leader ()
    ("Tools" (("d" (my/dashboard-switch) "Goto *dashboard*")))))
;; Create a shortcut function to switch to the dashboard:1 ends here

;; Flashcards
;; I'm going to try org-fc instead of org-drill for now. No particular reason.
;; https://www.leonrische.me/fc/index.html

;; [[file:../../../../../projects/home/emacs.org::*Flashcards][Flashcards:1]]
(use-package org-fc
  :after hydra
  :straight (org-fc
             :type git
             :repo "https://git.sr.ht/~l3kn/org-fc"
             :files (:defaults "awk" "demo.org"))

  :init
  (setq org-fc-directories `(,my/org-roam-directory))
  (setq org-fc-review-history-file "~/flashcard-review-history.tsv")

  :config
  (require 'org-fc-hydra)
  (require 'org-fc-keymap-hint)

  (pretty-hydra-define+ my/hydra-leader ()
    ("Tools" (("F" org-fc-hydra/body "Flashcards" :color blue))))

  (evil-define-minor-mode-key '(normal insert emacs) 'org-fc-review-flip-mode
    (kbd "RET") 'org-fc-review-flip
    (kbd "n") 'org-fc-review-flip
    (kbd "s") 'org-fc-review-suspend-card
    (kbd "q") 'org-fc-review-quit)

  (evil-define-minor-mode-key '(normal insert emacs) 'org-fc-review-rate-mode
    (kbd "a") 'org-fc-review-rate-again
    (kbd "h") 'org-fc-review-rate-hard
    (kbd "g") 'org-fc-review-rate-good
    (kbd "e") 'org-fc-review-rate-easy
    (kbd "s") 'org-fc-review-suspend-card
    (kbd "q") 'org-fc-review-quit))
;; Flashcards:1 ends here

;; leetcode

;; [[file:../../../../../projects/home/emacs.org::*leetcode][leetcode:1]]
(use-package leetcode
  :config
    ;(setq leetcode-prefer-language "python3")
    (setq leetcode-prefer-language "javascript")
    (setq leetcode-prefer-sql "mysql")
    (setq leetcode-save-solutions t)
    (setq leetcode-directory "~/leetcode"))
;; leetcode:1 ends here

;; Git / version management / magit
;; https://lists.gnu.org/archive/html/emacs-devel/2016-01/msg01802.html

;; [[file:../../../../../projects/home/emacs.org::*Git / version management / magit][Git / version management / magit:1]]
(use-package magit
  :delight
  :custom (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  :config
  (start-process "git-fsck" nil "git" "git" "config" "--global" "transfer.fsckObjects" "true") 
  (start-process "git-config-github-user" nil "git" "git" "config" "--global" "github.user" "bluekeys" "true") 
  ;(start-process "git-config-email" nil "git" "git" "config" "--global" "user.email" "user@example.com") 
  ;(start-process "git-config-email" nil "git" "git" "config" "--global" "user.name" "user")
  ;(my/leader-key-def "m" '(magit :which-key "magit"))

  (with-eval-after-load 'general
    (pretty-hydra-define+ my/hydra-leader ()
      ("Tools"
       (("m" (magit-status) "Magit" :color blue))))))
;; Git / version management / magit:1 ends here

;; Forge
;; https://github.com/magit/forge

;; Tokens on github can be review https://github.com/settings/tokens

;; [[file:../../../../../projects/home/emacs.org::*Forge][Forge:1]]
(use-package forge :after magit) ; create a token on github and put it in .authinfo
;; Forge:1 ends here

;; Dired git info

;; [[file:../../../../../projects/home/emacs.org::*Dired git info][Dired git info:1]]
(use-package dired-git-info
  :init
  (with-eval-after-load 'dired
    (setq dgi-auto-hide-details-p nil)
    (define-key dired-mode-map ")" 'dired-git-info-mode)))
;; Dired git info:1 ends here

;; diff-hl

;; [[file:../../../../../projects/home/emacs.org::*diff-hl][diff-hl:1]]
(use-package diff-hl
  :config
  (global-diff-hl-mode)
;; (let* ((height (frame-char-height))
;;        (width 2)
;;        (ones (1- (expt 2 width)))
;;        (bits (make-vector height ones)))
;;   (define-fringe-bitmap 'my-diff-hl-bitmap bits height width))
;; (setq diff-hl-fringe-bmp-function (lambda (type pos) 'my-diff-hl-bitmap))
  )
;; diff-hl:1 ends here

;; TODO evil-magit

;; [[file:../../../../../projects/home/emacs.org::*evil-magit][evil-magit:1]]
; (use-package evil-magit :after magit)
;; evil-magit:1 ends here

;; TODO ghub

;; [[file:../../../../../projects/home/emacs.org::*ghub][ghub:1]]
; (use-package ghub
; )
;; ghub:1 ends here

;https://mike.hostetlerhome.com/emacs-as-your-restclient.html
(use-package restclient)
(use-package ob-restclient)
