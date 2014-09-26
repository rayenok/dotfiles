;; -*- folded-file: t; -*-
(add-to-list 'load-path "org-root-dir/contrib/lisp")

;; Variables
(setq user-full-name "Eric Nova Ibáñez")
(setq user-mail-address "ericnova3@gmail.com")

;; Packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Cursor
(setq evil-default-cursor (quote (t "green")))

;; Accents
(require 'iso-transl)

;; Codification
(prefer-coding-system 'utf-8)

;; Font
;; (set-face-attribute 'default nil :height 90)
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight bold :height 86 :width normal))))
;;  '(org-level-1 ((t (:inherit outline-1 :background "gray21" :foreground "white")))))
;; (add-to-list 'load-path "~/.emacs.d/lisp/org-7.6/contrib/lisp")


;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(provide 'init-themes)
;; (load-theme 'badwolf t)
(load-theme 'cyberpunk t)

;; Fullscreen
;; (defun fullscreen ()
;;  (interactive)
;;  (set-frame-parameter nil 'fullscreen
;;               (if (frame-parameter nil 'fullscreen) nil 'fullboth))
;; (progn
;;   (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))  ;; no toolbar
;;   (menu-bar-mode -1) ;;no menubar
;;   (scroll-bar-mode -1) ;; no scroll bar
;;   )
;; )
;; (fullscreen)


(set-default-font "Inconsolata-10")

;; window 70%
(defun window-resize-to-70-percent ()
  (interactive)
  (window-resize nil (- (truncate (* 0.7 (frame-width))) (window-width)) t))

(defun window-resize-to-70-percent-height ()
  (interactive)
  (window-resize nil (- (truncate (* 0.7 (frame-height))) (window-height)) t))
;;Tabs
(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 4) ; set tab width to 4 for all buffers

;; linum

;; If you want relative numeration uncomment these lines
;; (add-to-list 'load-path "~/.emacs.d/elpa/linum-relative-20131210.2053")
;; (require 'linum-relative)
;; (global-linum-mode t) ;; Mostrar el numero de linea

;; Highline
;;(toggle-hl-line-when-idle 1)
;;(hl-line-toggle-when-idle 1)
;;(hl-line-when-idle-interval 20)
;;(global-hl-line-mode 1)

;; Winner-mode
(winner-mode t)

;; PLUGINS

;; Evil mode/ Evil-leader
(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/plugins/evil-leader")
(require 'evil)
(require 'evil-leader)
(evil-mode 1)
(setq evil-leader/in-all-states t)
(global-evil-leader-mode 1)
(evil-leader/set-leader ",")

;; | letra mapeada | funcion                      |
;; |---------------+------------------------------|
;; | ,e?           | abrir ficheros configuracion |
;; | ,h?           | abrir ficheros hobbies       |
;; | ,f?           | abrir ficheros salud         |
;; | ,ex           | abrir experienciasVida       |
;; | ,d?           | abrir documentacion          |
;; | ,r?           | funciones remember           |
;; | ,vs           | split vertical               |
;; | ,s            | split horizontal             |
;; | ,w            | guardar buffer               |
;; | ,q            | cerrar ventana               |
;; | ,c            | commentar/descomentar        |
;; | ,t            | cambiar estado cabezera      |
;; | ,ms           | marcar fecha                 |
;; | ,md           | marcar dead line             |
;; | ,a            | agenda                       |
;; | ,ff           | buscar fichero               |
;; | ,fb           | buscar buffer                |
;; | ,o            | focus ventana activa         |
;; | ,n?           | narrow area a otro buffer    |
;; | ,g            | magit                        |
;; | ,j            | compilar/ejecutar programa   |
;; | ,z            | debugger                     |
;; | ,h?           | helm calls                   |
;; | ,p            | helm flycheck                |
;; 
;; libres = [i,j,k,u,y]

;; (evil-leader/set-key "r" 'remember)
(evil-leader/set-key "r" 'org-capture)

;; Hard to customize as i want
;; | ,u            | gnus                         |
;; (evil-leader/set-key "u" 'gnus)

(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "q" 'evil-quit)
(evil-leader/set-key "c" 'evilnc-comment-or-uncomment-lines)
(evil-leader/set-key "a" 'org-agenda)
(evil-leader/set-key "ff" 'find-file)
(evil-leader/set-key "fb" 'helm-buffers-list)
(evil-leader/set-key "o" 'delete-other-windows)
(evil-leader/set-key "nn" 'narrow-to-region)
(evil-leader/set-key "ns" 'org-narrow-to-subtree)
(evil-leader/set-key "nw" 'widen)
(evil-leader/set-key "g" 'magit-status)
(evil-leader/set-key "hc" 'helm-calcul-expression)
(evil-leader/set-key "ht" 'helm-top)
(evil-leader/set-key "hl" 'helm-locate)
(evil-leader/set-key "hf" 'helm-find)
(evil-leader/set-key "hs" 'helm-occur)
(evil-leader/set-key "pr" 'winner-redo)
(evil-leader/set-key "pp" 'winner-undo)

(evil-leader/set-key "mci" 'org-clock-in)
(evil-leader/set-key "mco" 'org-clock-out)
(evil-leader/set-key "mcc" 'org-clock-jump-to-current-clock)
(evil-leader/set-key "mcs" 'org-clock-select-task)
(evil-leader/set-key "mcx" 'org-clock-cancel)

(define-key evil-normal-state-map "-" 'evil-search-forward)
;; Org mode special shortcuts
(add-hook 'org-mode-hook
      '(lambda ()
        (evil-leader/set-key "t" 'org-todo)
        (evil-leader/set-key "ms" 'org-schedule)
        (evil-leader/set-key "md" 'org-deadline)
        (evil-leader/set-key "lj" 'outline-next-visible-heading)
        (evil-leader/set-key "lk" 'outline-previous-visible-heading)
        (evil-leader/set-key "lh" 'outline-up-heading)
        (evil-leader/set-key "ls" 'org-screenshot-take)))

;; Insert mode movement
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(define-key evil-insert-state-map "\C-u" 'backward-kill-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
;;(define-key evil-insert-state-map "\C-k" 'kill-line)
;; C-a begining of the line
;; C-e end of line
;; C-f character forward
;; C-b character backward
;; M-f word forward
;; M-b word backward

;;Movement buffers
(define-key evil-normal-state-map "\C-h" 'evil-window-left)
(define-key evil-normal-state-map "\C-l" 'evil-window-right)
(define-key evil-normal-state-map "\C-k" 'evil-window-up)
(define-key evil-normal-state-map "\C-j" 'evil-window-down)

(define-key evil-normal-state-map "\C-S-h" (lambda () (interactive) (evil-window-decrease-width 1)(evil-window-decrease-width 1)(evil-window-decrease-width 1)(evil-window-decrease-width 1)))
(define-key evil-normal-state-map "\C-S-l" (lambda() (interactive) (evil-window-increase-width 1)(evil-window-increase-width 1)(evil-window-increase-width 1)(evil-window-increase-width 1)))

;; (define-key evil-insert-state-map "\C-j" 'evil-window-next)
;; (define-key evil-insert-state-map "\C-k" 'evil-window-prev)
;; (define-key evil-insert-state-map "\C-h" (lambda () (interactive) (evil-window-decrease-width 1)(evil-window-decrease-width 1)(evil-window-decrease-width 1)(evil-window-decrease-width 1)))
;; (define-key evil-insert-state-map "\C-l" (lambda() (interactive) (evil-window-increase-width 1)(evil-window-increase-width 1)(evil-window-increase-width 1)(evil-window-increase-width 1)))

;; Evil-numbers
(load-file "~/.emacs.d/evil-numbers/evil-numbers.el")
(define-key evil-normal-state-map "\C-a" 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map "\C-x" 'evil-numbers/dec-at-pt)

;; Org mode
(add-to-list 'load-path "~/.emacs.d")
(require 'org-screenshot)
;; (add-to-list 'org-export-latex-packages-alist' ("" "listings"))
;; (add-to-list 'org-export-latex-packages-alist' ("" "color"))




;; (defun nolinum ()
;;   (global-linum-mode 0)
;; )
;; (add-hook 'org-mode-hook 'nolinum)
;; (add-hook 'org-agenda-mode-map 'nolinum)

;; (add-hook 'org-mode-hook
;; 	  (lambda()
;; 	    ((evil-leader/set-key "zm" '))
;; 	   t)

;; Para abrir las imagenes con eog
(add-hook 'org-mode-hook
      '(lambda ()
             (setq org-file-apps
                   (append'(
                             ("\\.png\\'" . "eog %s")
                             ) org-file-apps ))))
(add-hook 'org-mode-hook
      '(lambda ()
             (setq org-file-apps
                   (append'(
                             ("\\.jpg\\'" . "eog %s")
                             ) org-file-apps ))))

(add-hook 'org-mode-hook
      '(lambda ()
             (setq org-file-apps
                   (append'(
                             ("\\.gif\\'" . "eog %s")
                             ) org-file-apps ))))

(add-hook 'org-mode-hook 'org-hide-block-all)

(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/plantuml.jar"))

;; (require 'org-babel-gnuplot)
;;Ejecutar codigo en org mode
(org-babel-do-load-languages 'org-babel-load-languages
       '((sh . t)
         (python . t)
         (gnuplot . t)
         (java . t)
         (js . t)
         (octave . t)
         (sql . t)
         (awk . t)
         (C . t)
         (emacs-lisp . t)
         (sqlite . t)
         (latex . t)
         (perl . t)
         (plantuml . t)
         (ditaa . t)

))

(put 'downcase-region 'disabled nil)

;;(define-key evil-insert-state-map "jj" 'evil-normal-state)
(global-set-key [capslock] '[esc])

(require 'goto-chg)
(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)

;;Default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")
;; Si es windows
;; (setq browse-url-browser-function 'browse-url-default-windows-browser)


;;Agenda/TodoList
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-todo-keywords
  '((sequence "TODO(t)" "HABIT(h)" "STARTED(s@/!)" "WAITING(w@/!)" "DELEGATED(y@/!)" "|" "DONE(d!)" "DEFERRED(a@/!)" "CANCELLED(c@/!)")))

(define-key mode-specific-map [?a] 'org-agenda)

(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))

     ; (define-key org-agenda-mode-map "\C-n" 'next-line)
     ; (define-key org-agenda-keymap "\C-n" 'next-line)
     ; (define-key org-agenda-mode-map "\C-p" 'previous-line)
     ; (define-key org-agenda-keymap "\C-p" 'previous-line)))
     ))

;; (setq org-todo-keyword-faces
;;   (quote (("STARTED" :foreground "red" :weight bold))))

;; (setq org-todo-keyword-faces
;;   (quote (("STARTED" :foreground "cyan" :weight bold))))

;; (setq org-todo-keyword-faces
;;   (quote (("WAITING" :foreground "yellow" :weight bold))))

;; (setq org-todo-keyword-faces
;;   (quote (("DELEGATED" :foreground "yellow" :weight bold))))


;; (require 'remember)

;; (add-hook 'remember-mode-hook 'org-remember-apply-template)

;; (define-key global-map [(control meta ?x)] 'remember)

; (setq org-agenda-files '("~/test/"))
; (load-library "find-lisp")
; (setq org-agenda-files (find-lisp-find-files "~/org" "\.org$"))

;; desactivar linum para org-mode
;; (defun nolinum()
;;   (linum-mode 0))
;; (add-hook 'org-mode-hook 'nolinum)

;;Flyspell enable in orgmode
(add-hook 'org-mode-hook 'flyspell-mode)

(evil-leader/set-key "bt" 'org-match-sparse-tree)

;; Helm
(add-to-list 'load-path "~/.emacs.d/helm")
(require 'helm-config)
(setq helm-display-function
      (lambda (buf)
        ;; (split-window-horizontally)
        (split-window-vertically)
        (other-window 1)
        (switch-to-buffer buf)))
(global-set-key (kbd "M-x") 'helm-M-x)

;; Helm-flycheck
(add-to-list 'load-path "~/.emacs.d/helm-flycheck")
(load-file "~/.emacs.d/helm-flycheck/helm-flycheck.el")
;; (require 'helm-flycheck) ;; Not necessary if using ELPA package
;; (eval-after-load 'flycheck
;;   '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck)

(evil-leader/set-key "u" 'helm-flycheck)

;; Copy and paste
(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard!")
        (call-interactively 'clipboard-kill-ring-save)
        )
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )

(evil-define-command paste-from-clipboard()
  (if (display-graphic-p)
      (progn
        (clipboard-yank)
        (message "graphics active")
        )
    (insert (shell-command-to-string "xsel -o -b"))
    )
  )

(global-set-key [f8] 'copy-to-clipboard)
(global-set-key [f9] 'paste-from-clipboard)

;; Autopair
(require 'autopair)

;; Parenthesis highlight
(show-paren-mode 1)

;; Flycheck
(global-flycheck-mode t)
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; Python tools

(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

;;Use ipython
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
(setq py-force-py-shell-name-p t)

;;Don't split windows
(setq py-split-windows-on-execute-p nil)

(setq py-electric-colon-active t)
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
;; jedi (python-autocompletion)
(add-to-list 'load-path "~/.emacs.d/elpa/jedi-0.1.2")
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; ipython
;;(add-to-list 'load-path "~/.emacs.d/elpa/ipython-2927")
;; (require 'ipython)

;;Python mode folding enable
(add-hook 'python-mode-hook
      (lambda ()
	(folding-mode t))
      t)

(add-hook 'python-mode-hook
      (lambda ()
	(evil-leader/set-key "z" 'pdb)
	(evil-leader/set-key "jj" 'py-execute-buffer)
	(evil-leader/set-key "jk" '(lambda()
                                 (interactive)
                                 (py-execute-buffer)
                                 (evil-window-vsplit)
                                 (window-resize-to-70-percent)
                                 (other-window 1)
                                 (switch-to-buffer "*Ipython*")
                                 (evil-insert-state)))
	(evil-leader/set-key "jh" '(lambda()
                                 (interactive)
                                 (py-execute-buffer)
                                 (evil-window-vsplit)
                                 (other-window 1)
                                 (window-resize-to-70-percent)
                                 (other-window -1)
                                 (switch-to-buffer "*Ipython*")
                                 (evil-insert-state)))
	(evil-leader/set-key "jn" '(lambda()
                                 (interactive)
                                 (py-execute-buffer)
                                 (evil-window-split)
                                 (other-window 1)
                                 (switch-to-buffer "*Ipython*")
                                 (evil-insert-state)))
	(evil-leader/set-key "ju" '(lambda()
                                 (interactive)
                                 (py-execute-buffer)
                                 (evil-window-split)
                                 (switch-to-buffer "*Ipython*")
                                 (evil-insert-state)))
	(evil-leader/set-key "jr" 'py-execute-region))
      t)


;; Powerline
(add-to-list 'load-path "~/.emacs.d/powerline")
(require 'powerline)

(add-hook 'evil-normal-state-entry-hook
          '(lambda ()
             (set-face-background 'mode-line "#483d8b")
             (set-face-foreground 'mode-line "#dcdcdc")

             (set-face-background 'powerline-active1 "#373b41")
             (set-face-foreground 'powerline-active1 "#dcdcdc")

             (set-face-background 'powerline-active2 "#282a2e")
             (set-face-foreground 'powerline-active2 "#dcdcdc")

             (powerline-reset)))

(add-hook 'evil-replace-state-entry-hook
          '(lambda ()
             (set-face-background 'mode-line "#D70000")
             (set-face-foreground 'mode-line "#FFFFFF")

             (set-face-background 'powerline-active1 "#373b41")
             (set-face-foreground 'powerline-active1 "#dcdcdc")

             (set-face-background 'powerline-active2 "#282a2e")
             (set-face-foreground 'powerline-active2 "#dcdcdc")

             (powerline-reset)))

(add-hook 'evil-visual-state-entry-hook
          '(lambda ()
             (set-face-background 'mode-line "#FF8700")
             (set-face-foreground 'mode-line "#870000")

             (set-face-background 'powerline-active1 "#373b41")
             (set-face-foreground 'powerline-active1 "#dcdcdc")

             (set-face-background 'powerline-active2 "#282a2e")
             (set-face-foreground 'powerline-active2 "#dcdcdc")

             (powerline-reset)))

(add-hook 'evil-insert-state-entry-hook
          '(lambda ()
             (set-face-background 'mode-line "#ffffff")
             (set-face-foreground 'mode-line "#005F5F")

             (set-face-background 'powerline-active1 "#0087AF")
             (set-face-foreground 'powerline-active1 "#ffffff")

             (set-face-background 'powerline-active2 "#005F87")
             (set-face-foreground 'powerline-active2 "#87D7FF")

             (powerline-reset)))

(set-face-background 'mode-line-inactive "#333333")
(set-face-foreground 'mode-line-inactive "#000000")
(set-face-background 'powerline-inactive1 "#222222")
(set-face-foreground 'powerline-inactive1 "#000000")
(set-face-background 'powerline-inactive2 "#1a1a1a")
(set-face-foreground 'powerline-inactive2 "#000000")

(powerline-default-theme)


;; Minted Python highlight export pdf
;;Url: http://praveen.kumar.in/2012/03/10/org-mode-latex-and-minted-syntax-highlighting/
(require 'org-latex)
;; (setq org-export-latex-listings 'minted)
;; (add-to-list 'org-export-latex-packages-alist '("" "minted"))

;; Auto-complete
;;FIXME: algunas veces se parte el popup y no se ven algunas opciones
(add-to-list 'load-path "~/.emacs.d/plugins/autocomplete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/autocomplete/ac-dict")
(ac-config-default)
(global-auto-revert-mode t)
(setq ac-auto-start nil)
(setq ac-dwim nil)
;; (setq ac-auto-start 2)
(setq ac-candidate-limit 20)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; Ido mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;; Yasnippet
;; (add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode t)
;;FIXME: Me gustaria poner C-n y C-p para moverme, pero no se porque no funciona
;;(setq yas/next-field-key "")
;;(setq yas/prev-field-key "")

;; Folding
;;FIXME: zr folding-show-all no funciona
;;FIXME: hay algunos folds que hay que añadir un espacio y no se puede subir bien por ellos
(add-to-list 'load-path "~/.emacs.d")
(load "folding")
;; (autoload 'folding-mode "folding"
;;  "Minor mode that simulates a folding editor" t)

(folding-mode-add-find-file-hook)
;; (folding-add-to-marks-list 'emacs-lisp-mode ";{{{" ";}}}" nil t)


 (defun folding-mode-find-file-hook ()
   "One of the hooks called whenever a `find-file' is successful."
   (and (assq 'folded-file (buffer-local-variables))
 	folded-file
 	(folding-mode 1)
 	(kill-local-variable 'folded-file)))

 (or (memq 'folding-mode-find-file-hook find-file-hooks)
     (setq find-file-hooks (append find-file-hooks
 				   '(folding-mode-find-file-hook))))

;;(define-key evil-normal-state-map "zR" 'folding-show-all)
(define-key evil-normal-state-map "za" 'folding-toggle-show-hide)
(define-key evil-normal-state-map "zm" 'folding-whole-buffer)


;; iimage-mode
;;(require 'iimage-mode)
(iimage-mode t)
;; (add-to-list 'iimage-mode-image-regex-alist
;;              (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]") 1))

;;(setq org-image-actual-width nil)
;; add a hook so we can display images on load
(add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))

;; function to setup images for display on load
(defun org-turn-on-iimage-in-org ()
    "display images in your org file"
    (interactive)
    (turn-on-iimage-mode)
    (set-face-underline-p 'org-link nil))
    ;; function to toggle images in a org bugger
    (defun org-toggle-iimage-in-org ()
	"display images in your org file"
	(interactive)
	(if (face-underline-p 'org-link)
	(set-face-underline-p 'org-link nil)
	(set-face-underline-p 'org-link t))
(call-interactively 'iimage-mode))


;; Recentf
(require 'recentf)
(recentf-mode 1)
(setq recent-max-menu-items 25)
;; (evil-leader/set-key "fr" 'recentf-open-files)
(evil-leader/set-key "fr" 'helm-recentf)

;; Packages
(require 'package)
(package-initialize)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                             ("gnu" . "http://elpa.gnu.org/packages/")
                             ("marmalade" . "http://marmalade-repo.org/packages/")))
(add-to-list 'load-path "~/.emacs.d/elpa")


;; Toggle comment/uncomment
;; (require 'evil-nerd-commenter)
;; (evilnc-default-hotkeys)
;; (global-set-key (kbd "C-c c") 'evilnc-comment-or-uncomment-lines)
;;(evil-leader/set-key "cl" 'evilnc-comment-or-uncomment-lines)

;; Popwin
;; (add-to-list 'load-path "~/.emacs.d/popwin-el")
;; (require 'popwin)
;; (popwin-mode 1)

;; Eshell
(defmacro with-face (str &rest properties)
    `(propertize ,str 'face (list ,@properties)))
  
  (defun shk-eshell-prompt ()
    (let ((header-bg "blue"))
      (concat
       (with-face (concat (eshell/pwd) " ") :background header-bg :foreground "yellow")
       (with-face (format-time-string "(%Y-%m-%d %H:%M) " (current-time)) :background header-bg :foreground "green")
       (with-face
        (or (ignore-errors (format "(%s)" (vc-responsible-backend default-directory))) "")
        :background header-bg)
       (with-face "\n" :background header-bg)
       (with-face user-login-name :foreground "light grey")
       "@"
       (with-face "localhost" :foreground "dim grey")
       (if (= (user-uid) 0)
           (with-face " #" :foreground "red")
         " $")
       " ")))
  (setq eshell-prompt-function 'shk-eshell-prompt)
  (setq eshell-highlight-prompt nil)


(global-set-key (kbd "<f12>") 'eshell)
(add-hook 'eshell-mode-hook (lambda()(yas-minor-mode -1)))


;; ;; gnus
;; (add-to-list 'load-path "~/.emacs.d/emacs-w3m")
;;(require 'w3m)
;; (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)




;; Splits
(define-key evil-normal-state-map ",vs" (lambda () (interactive)(evil-window-vsplit)(other-window 1)))
(define-key evil-normal-state-map ",s" (lambda () (interactive)(evil-window-split)(other-window 1)))

(evil-leader/set-key "fvs" (lambda () (interactive)(evil-window-vsplit)(other-window 1)(ido-find-file)))
(evil-leader/set-key "fs" (lambda () (interactive)(evil-window-split)(other-window 1)(ido-find-file)))
(evil-leader/set-key "bvs" (lambda () (interactive)(evil-window-vsplit)(other-window 1)(helm-buffers-list)))
(evil-leader/set-key "bs" (lambda () (interactive)(evil-window-split)(other-window 1)(helm-buffers-list)))
;; Quick Editings

(evil-leader/set-key "ee" (lambda() (interactive)(evil-window-vsplit)(other-window -1)(find-file "~/.emacs.d/init.el")))
(evil-leader/set-key "ev" (lambda() (interactive)(evil-window-vsplit)(other-window -1)(find-file "~/.vim/vimrc")))
(evil-leader/set-key "eb" (lambda() (interactive)(evil-window-vsplit)(other-window -1)(find-file "~/.bashrc")))
(evil-leader/set-key "ec" (lambda() (interactive)(evil-window-vsplit)(other-window -1)(find-file "/usr/local/src/dwm-6.0/config.h")))
(evil-leader/set-key "ed" (lambda() (interactive)(evil-window-vsplit)(other-window -1)(find-file "~/software/init/dwmstart")))
(evil-leader/set-key "x" (lambda() (interactive)(switch-to-buffer "*scratch*")))


;; Backups
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)


;; Esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))


(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; C configuration
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(setq-default c-basic-offset 4 c-default-style "linux")

(add-hook 'c-mode-hook
      (lambda ()
	(evil-leader/set-key "jk" '(lambda()
                                 (interactive)
                                 (evil-window-vsplit)
                                 (window-resize-to-70-percent)
                                 (other-window 1)
                                 (eshell)
                                 (evil-insert-state))
	(evil-leader/set-key "jh" '(lambda()
                                 (interactive)
                                 (evil-window-vsplit)
                                 (eshell)
                                 (other-window 1)
                                 (window-resize-to-70-percent)
                                 (other-window 1)
                                 (evil-insert-state)))
	(evil-leader/set-key "jn" '(lambda()
                                 (interactive)
                                 (evil-window-split)
                                 (other-window 1)
                                 (eshell)
                                 (evil-insert-state)))
	(evil-leader/set-key "ju" '(lambda()
                                 (interactive)
                                 (evil-window-split)
                                 (eshell)
                                 (evil-insert-state)))))
      t)

(add-hook 'c++-mode-hook
      (lambda ()
	(evil-leader/set-key "jk" '(lambda()
                                 (interactive)
                                 (evil-window-vsplit)
                                 (window-resize-to-70-percent)
                                 (other-window 1)
                                 (eshell)
                                 (evil-insert-state))
	(evil-leader/set-key "jh" '(lambda()
                                 (interactive)
                                 (evil-window-vsplit)
                                 (eshell)
                                 (other-window 1)
                                 (window-resize-to-70-percent)
                                 (other-window 1)
                                 (evil-insert-state)))
	(evil-leader/set-key "jn" '(lambda()
                                 (interactive)
                                 (evil-window-split)
                                 (other-window 1)
                                 (eshell)
                                 (evil-insert-state)))
	(evil-leader/set-key "ju" '(lambda()
                                 (interactive)
                                 (evil-window-split)
                                 (eshell)
                                 (evil-insert-state)))))
      t)


;;clock setup
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)

(setq org-capture-templates 
      '(("t" "Todo" entry(file+headline "~/org/todo.org" "Tasks") "* TODO %? %^G") 
        ("T" "Todo" entry(file+headline "~/org/todo.org" "Tasks") "* TODO %? [[%F][link]] %u %^G") 
        ("o" "Target" entry(file+headline "~/org/todo.org" "Targets") (file "~/org/templates/target.org"))
        ("m" "Música" entry(file+olp "~/org/todo.org" "Tasks" "Descargar música") "* TODO [[%^{Link}][%^{Nombre y grupo}]] ") 
        ("p" "Película" entry(file+olp "~/org/todo.org" "Tasks" "Descargar película") "* TODO %^{Película} ") 
        ("s" "Serie" entry(file+olp "~/org/todo.org" "Tasks" "Descargar serie") "* TODO %^{Serie} ") 
        ("n" "Notes" entry(file "~/org/notes.org" "Notes") "* %U  %?")))

;; Habits
(require 'org)
(require 'org-install)
(require 'org-habit)
(add-to-list 'org-modules "org-habit")
(setq org-habit-preceding-days 0
      org-habit-following-days 0
      ;; org-habit-graph-column 90
      org-habit-show-habits-only-for-today t
      ;; org-habit-show-habits-only-for-today nil
      org-habit-show-all-today nil)

;; Keyword habit
(org-map-entries '(org-set-property "REPEAT_TO_STATE" "HABIT")
                 "+STYLE=\"HABIT\"" 'agenda)

;; Clean view - org mode
(add-hook 'org-mode-hook 'org-indent-mode)

;; Agenda full screen
(defadvice org-agenda-list (around org-agenda-fullscreen activate)
  ad-do-it
  (delete-other-windows))
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-sticky nil)

;; Place tags close to the right-hand side of the window
(add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
(defun place-agenda-tags ()
  "Put the agenda tags by the right border of the agenda window."
  (setq org-agenda-tags-column (- 4 (window-width)))
  (org-agenda-align-tags))

;; Evil mode and agenda
(define-key org-agenda-mode-map "j" 'evil-next-line)
(define-key org-agenda-mode-map "k" 'evil-previous-line)
(define-key org-agenda-mode-map "l" 'evil-forward-char)
(define-key org-agenda-mode-map "h" 'evil-backward-char)
(define-key org-agenda-mode-map "\C-f" 'evil-scroll-page-down)
(define-key org-agenda-mode-map "\C-b" 'evil-scroll-page-up)
(define-key org-agenda-mode-map "\C-d" 'evil-scroll-down)
(define-key org-agenda-mode-map "\C-u" 'evil-scroll-up)
(define-key org-agenda-mode-map "G" 'evil-goto-line)
;; FIXME: Try to define gg in agenda-mode
;; (define-key org-agenda-mode-map "gg" 'evil-goto-first-line)
(define-key org-agenda-mode-map "L" 'evil-window-bottom)
(define-key org-agenda-mode-map "M" 'evil-window-middle)
(define-key org-agenda-mode-map "H" 'evil-window-top)
(define-key org-agenda-mode-map "m" 'org-agenda)
(define-key org-agenda-mode-map "-" 'evil-search-forward)
(define-key org-agenda-mode-map "r" 'org-capture)
(define-key org-agenda-mode-map "n" 'evil-search-next)
(define-key org-agenda-mode-map "N" 'evil-search-previous)
(define-key org-agenda-mode-map (kbd "SPC") 'org-agenda-bulk-mark)


(setq org-agenda-todo-ignore-scheduled 'future)
(setq org-agenda-tags-todo-honor-ignore-options t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-split-win-window-function (quote split-window-horizontally))
 '(org-agenda-custom-commands (quote (
                                      ("d" todo "DELEGATED" nil)
                                      ("c" todo "DONE|DEFERRED|CANCELLED" nil)
                                      ("w" todo "WAITING" nil)
                                      ("z" tags-todo "seguridad")
                                      ("x" tags-todo "mistic")
                                      ("o" tags-todo "target")
                                      ("W" agenda "" ((org-agenda-ndays 21)))
                                      ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: ")))
                                      ("u" alltodo "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "]+>"))) (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-agenda-files (quote ("~/org/todo.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-use-time-grid nil)
 '(org-agenda-skip-deadline-if-done nil)
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-clock-into-drawer "CLOCK")
 '(org-deadline-warning-days 3)
 '(org-default-notes-file "~/notes.org")
 '(org-emphasis-alist (quote (("*" bold verbatim) ("/" italic) ("_" underline) ("=" org-code verbatim) ("~" org-verbatim verbatim) ("+" (:strike-through t)))))
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-log-done t)
 '(org-log-into-drawer t)
 '(org-reverse-note-order t)
 '(org-todo-keyword-faces (quote (("STARTED" :foreground "cyan3" :weight bold :box (:line-width 1 :style none)) ("TODO" :foreground "red" :weight bold :box (:line-width 1 :style none)) ("HABIT" :foreground "white" :weight bold :box (:line-width 1 :style none)) ("WAITING" :foreground "yellow" :weight bold :box (:line-width 1 :style none)) ("DONE" :foreground "green" :weight bold :box (:line-width 1 :style none)) ("DEFERRED" :foreground "grey" :weight bold :box (:line-width 1 :style none)) ("CANCELLED" :foreground "orange" :weight bold :box (:line-width 1 :style none)) ("DELEGATED" :foreground "yellow" :weight bold :box (:line-width 1 :style none)))))
 '(py-force-py-shell-name-p t)
 '(py-shell-name "ipython")
 '(py-split-windows-on-execute-p nil)
 '(py-switch-buffers-on-execute-p nil)
 '(safe-local-variable-values (quote ((folded-file . t))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(transient-mark-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight bold :height 86 :width normal))))
 '(org-block-background ((t (:background "gray12"))))
 '(org-clock-overlay ((t nil)))
 '(org-level-1 ((t (:inherit outline-1 :background "gray21" :foreground "white")))))
(put 'narrow-to-region 'disabled nil)
