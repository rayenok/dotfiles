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