;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     emacs-lisp
     ;;git
     ;; markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;;spell-checking
     python
     ;; syntax-checking
     ;; version-control
     twitter
     slack
     c-c++
     ;; nasm-mode
     shell-scripts
     cscope
     vim-powerline
     ;; elfeed
     gtags
     plantuml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(badwolf-theme cyberpunk-theme load-theme-buffer-local eziam-theme org-super-agenda)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(org-bullets)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete
-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;; disable check for updates
   dotspacemacs-check-for-update nil
   ;;themes
   dotspacemacs-themes '(
                         ;;sanityinc-tomorrow-night
                         ;; badwolf
                         ;; cyberpunk
                         ;; eziam-theme
                         busybee
                         gruber-darker
                         solarized-dark
                         spacemacs-dark
                         spacemacs-light
                         leuven
                         solarized-light
                         monokai
                         ;; badwolf
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Monego"
                               :size 14
                               :foundry pyrs
                               :weight normal
                               :slant normal
                               :width normal
                               :spacing 100
                               :scalable true
                               :powerline-scale 1.1)

   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 13
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil

   dotspacemacs-distinguish-gui-tab t
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  ;; (let ((org-super-agenda-groups
  ;;       '(;; Each group has an implicit boolean OR operator between its selectors.
  ;;         (:name "Today"  ; Optionally specify section name
  ;;                 :time-grid t  ; Items that appear on the time grid
  ;;                 :todo "TODAY")  ; Items that have this TODO keyword
  ;;         )))
  ;;   (org-agenda nil "a"))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (setq-default dotspacemacs-configuration-layers '(
                                                    (auto-completion :variables
                                                                     auto-completion-return-key-behavior 'complete
                                                                     auto-completion-tab-key-behavior 'complete
                                                                     auto-completion-complete-with-key-sequence nil
                                                                     auto-completion-complete-with-key-sequence-delay 0.1
                                                                     auto-completion-private-snippets-directory nil)
                                                    ))
   ;; (setq-default spacemacs-default-company-backends '((company-dabbrev-code company-gtags company-etags company-keywords) company-files company-dabbrev))
  (setq company-backends-org-mode '((company-dabbrev-code company-gtags company-etags company-keywords) company-files company-dabbrev))
    ;;(define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
    ;;(define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort
    (setq base_path "/home/emacs/agenda/")
    (setq to_todo (concatenate 'string base_path "todo.org"))
    (setq to_done (concatenate 'string base_path "done.org"))
    (setq to_notes (concatenate 'string base_path "notes.org"))

    (add-hook 'prog-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

    (setq org-hide-block-startup t)
    (setq org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
    (define-key evil-normal-state-map (kbd "-") 'evil-search-forward)
    (define-key evil-normal-state-map (kbd "_") 'evil-search-backward)

    ;;(define-key evil-insert-state-map "jj" 'evil-normal-state)
    (global-set-key [capslock] '[esc])

    ;;Twitter - put to false to remove the images
    (setq twittering-icon-mode t)
    ;;Agenda/TodoList
    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
    ;; (load-theme 'eziam-dark)

    ;; org-super-agenda
    ;; (let ((org-super-agenda-groups
    ;;        '((:auto-group t))))
    ;;   (org-agenda-list))

    ;; (use-package org-super-agenda
    ;;   :config (org-super-agenda-mode))


    ;; (setq org-agenda-custom-commands
    ;;       '(("a" "Super Agenda" agenda
    ;;          (org-super-agenda-mode)
    ;;          (message "executed agenda custom command")
    ;;          ((org-super-agenda-groups
    ;;            '(
    ;;              (:name "Next Items"
    ;;                     :time-grid t
    ;;                     :tag ("NEXT" "outbox"))
    ;;              (:name "Important"
    ;;                     :priority "A")
    ;;              (:name "Quick Picks"
    ;;                     :effort< "0:30"
    ;;                     )
    ;;              (:priority<= "B"
    ;;                           :scheduled > "tomorrow"
    ;;                           :order 1)
    ;;              )))
    ;;          (org-agenda nil "a"))))

    ;; (let ((org-super-agenda-groups '(
    ;;         (:name "Today"  ; Optionally specify section name
    ;;                 :todo "TODO")  ; Items that have this TODO keyword
    ;;         )))
    ;;   (org-agenda nil "a"))

    (setq org-todo-keywords
          '((sequence "TODO(t)" "IDEA(i)" "STARTED(s@/!)" "BLOCKED(b@/!)" "WAITING(w@/!)" "DELEGATED(y@/!)" "MAYBE(m@/!)" "INACTIVE(I@/!)" "|" "DONE(d@/!)"  "DEFERRED(a@/!)" "CANCELLED(c@/!)")))

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


    ;; (add-hook 'org-mode-hook (lambda()(load-theme-buffer-local 'cyberpunk)))


    (setq org-capture-templates '(
            ("t" "Todo" entry(file+headline to_todo "Tasks") "* TODO %? %^G")
            ;; ("T" "Todo" entry(file+headline to_todo "Tasks") "* TODO %? [[%F][link]] %u %^G") 
            ("o" "Target" entry(file+headline to_todo "Targets") (file "~/org/templates/target.org"))
            ("p" "Target" entry(file+headline to_todo "Targets") (file "/home/emacs/agenda/personal.org"))
            ("h" "Helping" entry(file+datetree to_todo "Notes") "* Helping %^{prompt|default|Jordi Sayeras|Victor Mico|Natalia|Jordi Mujal|Raul} %T :%\\1:helping:unexpected: \n %?" :clock-in t :clock-keep t :clock-resume t) 
            ("m" "Meeting" entry(file+datetree to_todo "Notes") "* Meeting %^{prompt|undefined|CCESLW003|CCEBAE001|TSSGEM001|TSSDAR001} :%\\1:meeting: \n %?") 
            ("M" "Meeting" entry(file+datetree to_todo "Notes") "* Meeting %^{prompt|undefined|CCESLW003|CCEBAE001|TSSGEM001|TSSDAR001} :%\\1:meeting: \n %?" :clock-in t :clock-keep t :clock-resume t) 
            ("u" "Unexpected" entry(file+datetree to_todo "Notes") "* %? %U :unexpected: \n" :clock-in t :clock-keep t :clock-resume t) 
            ("n" "Notes" entry(file+datetree to_todo "Notes") "* %? %U")
            ("x" "Notes" entry(file+datetree to_todo "Notes") "* %? %U  %^G \n \n #+BEGIN_EXAMPLE \n %x \n #+END_EXAMPLE")
          ))

    (custom-set-variables
    ;; custom-set-variables was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
    '(ediff-split-win-window-function (quote split-window-horizontally))
    '(org-agenda-custom-commands (quote (
                                        ("t" todo "TODO|STARTED|INACTIVE|IDEA" nil)
                                        ("d" todo "DELEGATED" nil)
                                        ("c" todo "DONE|DEFERRED|CANCELLED" nil)
                                        ("w" todo "WAITING" nil)
                                        ("z" tags-todo "seguridad")
                                        ("b" "Super Agenda" agenda
                                                 (org-super-agenda-mode)
                                                 ((org-super-agenda-groups
                                                   '(
                                                     (:name "Active or Overdue"
                                                            :deadline past)
                                                     (:name "Today"  ; Optionally specify section name
                                                            :time-grid t  ; Items that appear on the time grid
                                                            :todo "TODAY"
                                                            :deadline today)  ; Items that have this TODO keyword
                                                     (:name "Important"
                                                            ;; Single arguments given alone
                                                            :tag "bills"
                                                            :priority "A")
                                                     (:name "Bass" :tag "bass" :order 5)  ; Set order of this section
                                                     (:name "Meetings" :tag "meeting" :order 6)  ; Set order of this section
                                                     (:todo "WAITING" :order 7)  ; Set order of this section
                                                     (:todo "DELEGATED" :order 8)  ; Set order of this section
                                                     (:todo "BLOCKED" :order 6)  ; Set order of this section
                                                     (:todo ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING" "MAYBE" "INACTIVE")
                                                            ;; Show this group at the end of the agenda (since it has the
                                                            ;; highest number). If you specified this group last, items
                                                            ;; with these todo keywords that e.g. have priority A would be
                                                            ;; displayed in that group instead, because items are grouped
                                                            ;; out in the order the groups are listed.
                                                            :order 10)
                                                     (:priority<= "B"
                                                                  ;; Show this section after "Today" and "Important", because
                                                                  ;; their order is unspecified, defaulting to 0. Sections
                                                                  ;; are displayed lowest-number-first.
                                                                  :order 1)
                                                     )))
                                                 (org-agenda nil "a"))
                                        ("o" tags-todo "target")
                                        ("W" agenda "" ((org-agenda-ndays 21)))
                                        ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: ")))
                                        ("u" alltodo "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "]+>"))) (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
    '(org-agenda-files (quote ("/home/emacs/agenda/todo.org" "/home/emacs/agenda/personal.org")))
    ;; '(org-agenda-files (quote (to_todo)))
    '(org-agenda-text-search-extra-files (quote (to_done)))
    '(org-agenda-ndays 7)
    '(org-confirm-babel-evaluate nil)
    '(setq case-fold-search t)
    '(org-agenda-show-all-dates t)
    '(org-agenda-use-time-grid t)
    '(org-agenda-skip-deadline-if-done nil)
    '(org-agenda-skip-scheduled-if-deadline-is-shown t)
    '(org-agenda-skip-scheduled-if-done t)
    '(org-agenda-start-on-weekday nil)
    '(org-clock-into-drawer "CLOCK")
    '(org-deadline-warning-days 30)
    '(org-default-notes-file to_notes))

    ;; Theme
    ;; (add-to-list 'custom-theme-load-path "C:\\Users\\emacs\\.emacs.d\\themes")
    ;; (load-theme 'leuven-theme  t)

    ;;spelling
    ;; (require 'ispell)
    ;; ;;IMPORTANT: Define env variable LANG = es_ES for hunspell or wont work
    ;; (add-to-list 'ispell-local-dictionary-alist '("spanish-hunspell"
    ;;                                           "[[:alpha:]]"
    ;;                                           "[^[:alpha:]]"
    ;;                                           "[']"
    ;;                                           t
    ;;                                           ("-d" "es_ES"); Dictionary file name
    ;;                                           nil
    ;;                                           iso-8859-1))

    ;; (add-to-list 'ispell-local-dictionary-alist '("english-hunspell"
    ;;                                               "[[:alpha:]]"
    ;;                                               "[^[:alpha:]]"
    ;;                                               "[']"
    ;;                                               t
    ;;                                               ("-d" "en_US")
    ;;                                               nil
    ;;                                               iso-8859-1))

    ;; (setq ispell-program-name "hunspell"          ; Use hunspell to correct mistakes
    ;;       ispell-dictionary   "spanish-hunspell") ; Default dictionary to use
    ;; (setq flyspell-issue-welcome-flag nil) 
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((emacs-lisp . nil)
       (C . t)
       (python . t)
       (plantuml . t)
       (shell . t)))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(ansi-term-color-vector
   [unspecified "#000000" "#5f8787" "#dd9999" "#a06666" "#888888" "#999999" "#888888" "#c1c1c1"] t)
 '(background-color "#202020")
 '(background-mode dark)
 '(beacon-color "#ec4780")
 '(company-minimum-prefix-length 5)
 '(company-quickhelp-color-background "#b0b0b0")
 '(company-quickhelp-color-foreground "#232333")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#cccccc")
 '(cursor-type (quote bar))
 '(custom-safe-themes
   (quote
    ("5e2dc1360a92bb73dafa11c46ba0f30fa5f49df887a8ede4e3533c3ab6270e08" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "9deeab438d1d798c26d41c759d74a2406802427ff6acb7dec8cec961bcb4e7d5" "19ba41b6dc0b5dd34e1b8628ad7ae47deb19f968fe8c31853d64ea8c4df252b8" "a25c42c5e2a6a7a3b0331cad124c83406a71bc7e099b60c31dc28a1ff84e8c04" "868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" "44247f2a14c661d96d2bff302f1dbf37ebe7616935e4682102b68c0b6cc80095" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "6ecd762f08fd5c3aab65585d5aa04f6ae8b44d969df4be669259975dac849687" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "040eab9c119c33f184e9fd21290ecea9691efc807a89c328e12a50d3a0fe60f8" default)))
 '(ediff-split-win-window-function (quote split-window-horizontally))
 '(elfeed-feeds
   (quote
    ("http://bits-please.blogspot.com/feeds/posts/default" "https://www.reddit.com/.rss?feed=529636eff879fa1a8121ae951969884e8a031d40&user=halflifewaiting")))
 '(evil-emacs-state-cursor (quote ("#E57373" hbar)) t)
 '(evil-escape-key-sequence "kj")
 '(evil-insert-state-cursor (quote ("#E57373" bar)) t)
 '(evil-normal-state-cursor (quote ("#FFEE58" box)) t)
 '(evil-visual-state-cursor (quote ("#C5E1A5" box)) t)
 '(evil-want-Y-yank-to-eol t)
 '(eziam-scale-headings nil)
 '(fci-rule-character-color "#452E2E")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(foreground-color "#cccccc")
 '(frame-background-mode (quote dark))
 '(frame-brackground-mode (quote dark))
 '(fringe-mode 6 nil (fringe))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#3E3D31" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#3E3D31" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-background-colors (quote ("#e8fce8" "#c1e7f8" "#f8e8e8")))
 '(hl-paren-colors nil)
 '(hl-paren-delay 0.2)
 '(hl-sexp-background-color "#1c1f26")
 '(ispell-complete-word-dict "")
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#80A0C2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#A2BF8A"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#3f3f3f"))
 '(linum-format "%3i")
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(main-line-separator-style (quote chamfer))
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-custom-commands
   (quote
    (("t" todo "TODO|STARTED|INACTIVE|IDEA" nil)
     ("d" todo "DELEGATED" nil)
     ("c" todo "DONE|DEFERRED|CANCELLED" nil)
     ("w" todo "WAITING" nil)
     ("z" tags-todo "seguridad")
     ("b" "Super Agenda" agenda
      (org-super-agenda-mode)
      ((org-super-agenda-groups
        (quote
         ((:name "Active or Overdue" :deadline past)
          (:name "Today" :time-grid t :todo "TODAY" :deadline today)
          (:name "Important" :tag "bills" :priority "A")
          (:name "Bass" :tag "bass" :order 5)
          (:name "Meetings" :tag "meeting" :order 6)
          (:todo "WAITING" :order 7)
          (:todo "DELEGATED" :order 8)
          (:todo "BLOCKED" :order 6)
          (:todo
           ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING" "MAYBE" "INACTIVE")
           :order 10)
          (:priority<= "B" :order 1)))))
      (org-agenda nil "a"))
     ("o" tags-todo "target")
     ("W" agenda ""
      ((org-agenda-ndays 21)))
     ("A" agenda ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote notregexp)
           "\\=.*\\[#A\\]")))
       (org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's Priority #A tasks: ")))
     ("u" alltodo ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if
           (quote scheduled)
           (quote deadline)
           (quote regexp)
           "]+>")))
       (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-agenda-files
   (quote
    ("/home/emacs/agenda/todo.org" "/home/emacs/agenda/personal.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done nil)
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-text-search-extra-files (quote (to_done)))
 '(org-agenda-use-time-grid t)
 '(org-clock-into-drawer "CLOCK")
 '(org-confirm-babel-evaluate nil)
 '(org-deadline-warning-days 30)
 '(org-default-notes-file to_notes)
 '(org-link-translation-function (quote toc-org-unhrefify))
 '(org-log-into-drawer t)
 '(org-src-block-faces (quote (("emacs-lisp" (:background "#F0FFF0")))))
 '(org-super-agenda-mode t)
 '(package-selected-packages
   (quote
    (emojify circe oauth2 websocket plantuml-mode highlight-symbol helm-gtags ggtags elfeed-web simple-httpd elfeed-org elfeed-goodies ace-jump-mode noflet elfeed helm-cscope xcscope org-super-agenda zenburn-theme zen-and-art-theme yapfify ws-butler winum white-sand-theme which-key volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twittering-mode twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme slack seti-theme reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el paradox organic-green-theme org-projectile org-present org-pomodoro org-mime org-download open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mustang-theme move-text monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme macrostep lush-theme lorem-ipsum load-theme-buffer-local live-py-mode linum-relative link-hint light-soap-theme jbeans-theme jazz-theme ir-black-theme insert-shebang inkpot-theme indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gandalf-theme fuzzy flx-ido flatui-theme flatland-theme fish-mode fill-column-indicator farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme elisp-slime-nav dumb-jump dracula-theme django-theme disaster diminish define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-statistics company-shell company-c-headers company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmake-mode clues-theme clean-aindent-mode clang-format cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(powerline-color1 "#3d3d68")
 '(powerline-color2 "#292945")
 '(setq case-fold-search t)
 '(show-smartparens-global-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(tabbar-background-color "#353535")
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3E3D31" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(when
      (or
       (not
        (boundp
         (quote ansi-term-color-vector)))
       (not
        (facep
         (aref ansi-term-color-vector 0)))))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monego" :foundry "pyrs" :slant normal :weight normal :height 105 :width normal))))
 '(bold ((t (:foreground "green" :weight bold))))
 '(button ((t (:foreground "medium spring green" :underline t))))
 '(ediff-even-diff-A ((t (:background "light grey" :foreground "black"))))
 '(ediff-even-diff-Ancestor ((t (:background "Grey" :foreground "black"))))
 '(ediff-even-diff-B ((t (:background "Grey" :foreground "black"))))
 '(ediff-even-diff-C ((t (:background "light grey" :foreground "black"))))
 '(ediff-fine-diff-B ((t (:background "forest green"))))
 '(ediff-odd-diff-A ((t (:background "Grey" :foreground "black"))))
 '(ediff-odd-diff-B ((t (:background "light grey" :foreground "black"))))
 '(ediff-odd-diff-C ((t (:background "Grey" :foreground "black"))))
 '(font-lock-builtin-face ((t (:foreground "white"))))
 '(helm-selection ((t (:background "dim gray" :distant-foreground "white"))))
 '(helm-visible-mark ((t (:background "dim gray" :foreground "white"))))
 '(hi-black-b ((t (:background "dark olive green" :foreground "white"))))
 '(hi-black-hb ((t (:inherit variable-pitch :background "blue" :foreground "white"))))
 '(hi-blue-b ((t (:background "deep sky blue" :foreground "white"))))
 '(hi-green-b ((t (:background "dark sea green" :foreground "black"))))
 '(hi-red-b ((t (:background "firebrick" :foreground "white"))))
 '(org-block ((t (:background "black" :foreground "white"))))
 '(org-block-begin-line ((t (:inherit org-meta-line :background "gray7"))))
 '(org-default ((t (:inherit default :foreground "white"))))
 '(org-drawer ((t (:foreground "orange"))))
 '(org-link ((t (:foreground "deep sky blue" :underline t))))
 '(org-table ((t (:background "black" :foreground "LightSkyBlue"))))
 '(region ((t (:background "black" :foreground "white"))))
 '(shadow ((t (:foreground "chartreuse")))))
