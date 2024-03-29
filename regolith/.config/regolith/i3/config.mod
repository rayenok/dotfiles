###############################################################################
#
# This file uses a machine-parsable format for comments. The schema:
# ## <Category> // <Action> // <Keybinding> ##
# Learn more at https://github.com/regolith-linux/remontoire
#
###############################################################################

set_from_resource $mod  i3-wm.mod Mod4
set_from_resource $alt  i3-wm.alt Mod1
set_from_resource $meta i3-wm.alt Mod1

set_from_resource $ws1  i3-wm.workspace.01.name "1"
set_from_resource $ws2  i3-wm.workspace.02.name "2"
set_from_resource $ws3  i3-wm.workspace.03.name "3"
set_from_resource $ws4  i3-wm.workspace.04.name "4"
set_from_resource $ws5  i3-wm.workspace.05.name "5"
set_from_resource $ws6  i3-wm.workspace.06.name "6"
set_from_resource $ws7  i3-wm.workspace.07.name "7"
set_from_resource $ws8  i3-wm.workspace.08.name "8"
set_from_resource $ws9  i3-wm.workspace.09.name "9"

###############################################################################
# Launcher dialogs
###############################################################################

bindsym $mod+$meta+Return exec kitty --class "kitty"
bindsym $mod+Shift+Return exec gtk-launch $(xdg-settings get default-web-browser)

set_from_resource $rofiTheme rofi.theme /etc/regolith/styles/lascaille/rofi.rasi

set_from_resource $i3-wm.program.launcher.app i3-wm.program.launcher.app rofi -show drun -theme $rofiTheme
bindsym $meta+F2 exec $i3-wm.program.launcher.app

set_from_resource $i3-wm.program.launcher.cmd i3-wm.program.launcher.cmd rofi -show run -theme $rofiTheme
bindsym $meta+F3 exec $i3-wm.program.launcher.cmd

set_from_resource $i3-wm.program.launcher.window i3-wm.program.launcher.window rofi -show window -theme $rofiTheme
bindsym $mod+Tab exec $i3-wm.program.launcher.window

bindsym $meta+Tab workspace back_and_forth


###############################################################################
# Window and Workspace Navigation
###############################################################################

## Navigate // Relative Window // <*> k j h l ##
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

## Navigate // Workspaces 1-10 // <*> 0..4|q..r ##
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9

## Navigate // Scratchpad // <><Ctrl> a ##
bindsym $mod+y scratchpad show

###############################################################################
# Window and Workspace Configuration
###############################################################################

bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right
bindsym $mod+Shift+y move to scratchpad

bindsym $mod+$meta+Ctrl+h move workspace to output left
bindsym $mod+$meta+Ctrl+j move workspace to output down
bindsym $mod+$meta+Ctrl+k move workspace to output up
bindsym $mod+$meta+Ctrl+l move workspace to output right


workspace_layout tabbed
bindsym $mod+BackSpace layout toggle tabbed stacked splith splitv
bindsym $mod+u layout stacking
bindsym $mod+i layout tabbed
bindsym $mod+n layout default

bindsym $mod+o fullscreen toggle
bindsym $mod+z floating toggle

bindsym $mod+Ctrl+Return sticky toggle

# move focused container to workspace, move to workspace
## Modify / Carry Window to Workspace 1 - 10// <><Alt> 0..9 ##
bindsym $mod+Shift+1 move container to workspace number $ws1; workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2; workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3; workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4; workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5; workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6; workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7; workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8; workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9; workspace number $ws9


bindsym $mod+Ctrl+Shift+1 move container to workspace number $ws1
bindsym $mod+Ctrl+Shift+2 move container to workspace number $ws2
bindsym $mod+Ctrl+Shift+3 move container to workspace number $ws3
bindsym $mod+Ctrl+Shift+4 move container to workspace number $ws4
bindsym $mod+Ctrl+Shift+5 move container to workspace number $ws5
bindsym $mod+Ctrl+Shift+6 move container to workspace number $ws6
bindsym $mod+Ctrl+Shift+7 move container to workspace number $ws7
bindsym $mod+Ctrl+Shift+8 move container to workspace number $ws8
bindsym $mod+Ctrl+Shift+9 move container to workspace number $ws9


# Use Mouse+$mod to drag floating windows to their wanted position
## Modify // Mouse Floating Modifier// <*> ##
floating_modifier $mod

hide_edge_borders smart

# Force all windows to have a border when focused
for_window [class=.*] border pixel 3 title_format "<span size='smaller' font='Roboto 12'>%title</span>"

for_window [class="(?i)kitty"] mark "terminal"
for_window [con_mark="terminal"] floating disable
for_window [con_mark="terminal"] move scratchpad
bindsym $mod+Return [con_mark="terminal"] scratchpad show
bindsym $mod+p [con_mark="terminal"] scratchpad show
bindsym $meta+grave [con_mark="terminal"] scratchpad show

###############################################################################
# Session Management
###############################################################################

mode "exit: [l]ogout [r]eboot [s]hutdown [b]lock [s]leep" {
     bindsym l exec gnome-session-quit
     bindsym r exec reboot
     bindsym s exec shutdown now
     bindsym b exec i3lock
     bindsym s exec $i3-wm.program.sleep
     bindsym Escape mode "default"
     bindsym Return mode "default"
     bindsym Control+g mode "default"
}

bindsym $mod+Shift+Escape mode "exit: [l]ogout [r]eboot [s]hutdown [b]lock [s]leep"

mode "i3 control: [s] refresh session, [r]eload i3, [x] restart i3" {
     bindsym s exec --no-startup-id $i3-wm.program.refresh_ui
     bindsym r exec --no-startup-id i3-msg reload
     bindsym x exec --no-startup-id i3-msg restart
     bindsym Escape mode "default"
     bindsym Return mode "default"
     bindsym Control+g mode "default"
}

bindsym $mod+Escape mode "i3 control: [s] refresh session, [r]eload i3, [x] restart i3"


bindsym $mod+0 [con_id="__focused__"] kill
bindsym $meta+F4 [con_id="__focused__"] kill
bindsym $mod+Shift+0 [con_id="__focused__"] exec --no-startup-id kill -9 $(xdotool getwindowfocus getwindowpid)

###############################################################################
# System Management
###############################################################################

set_from_resource $i3-wm.program.settings i3-wm.program.settings gnome-control-center
bindsym $mod+m exec $i3-wm.program.settings

###############################################################################
# Workspace Management
###############################################################################

bindsym $mod+comma  exec /usr/bin/i3-snapshot -o > /tmp/i3-snapshot
bindsym $mod+period exec /usr/bin/i3-snapshot -c < /tmp/i3-snapshot

bindsym $mod+b bar mode toggle

floating_maximum_size -1 x -1
for_window [class="Gnome-control-center"] floating enable

###############################################################################
# i3 Appearance and Behavior
###############################################################################

# Disable titlebar
set_from_resource $i3-wm.window.border.size i3-wm.window.border.size 50
set_from_resource $i3-wm.floatingwindow.border.size i3-wm.floatingwindow.border.size 50
default_border pixel $i3-wm.window.border.size
default_floating_border pixel $i3-wm.floatingwindow.border.size

# Specify the distance between windows in pixels. (i3-gaps)
set_from_resource $i3-wm.gaps.inner.size i3-wm.gaps.inner.size 50
set_from_resource $i3-wm.gaps.outer.size i3-wm.gaps.outer.size 25
gaps inner $i3-wm.gaps.inner.size
gaps outer $i3-wm.gaps.outer.size

# Only enable gaps on a workspace when there is at least one container
set_from_resource $i3-wm.gaps.smart i3-wm.gaps.smart on
smart_gaps $i3-wm.gaps.smart

# Enable popup during fullscreen
set_from_resource $i3-wm.gaps.popup_during_fullscreen i3-wm.gaps.popup_during_fullscreen smart
popup_during_fullscreen $i3-wm.gaps.popup_during_fullscreen

# window focus follows your mouse movements as the mouse crosses window borders
set_from_resource $i3-wm.gaps.focus_follows_mouse i3-wm.gaps.focus_follows_mouse yes
focus_follows_mouse $i3-wm.gaps.focus_follows_mouse

###############################################################################
# i3 Colors and Fonts
###############################################################################

# Create variables from Xresources for i3's look.
set_from_resource $focused.color.border i3-wm.client.focused.color.border "#002b36"
set_from_resource $focused.color.background i3-wm.client.focused.color.background "#586e75"
set_from_resource $focused.color.text i3-wm.client.focused.color.text "#fdf6e3"
set_from_resource $focused.color.indicator i3-wm.client.focused.color.indicator "#268bd2"
set_from_resource $focused.color.child_border i3-wm.client.focused.color.child_border

set_from_resource $focused_inactive.color.border i3-wm.client.focused_inactive.color.border "#002b36"
set_from_resource $focused_inactive.color.background i3-wm.client.focused_inactive.color.background "#073642"
set_from_resource $focused_inactive.color.text i3-wm.client.focused_inactive.color.text "#839496"
set_from_resource $focused_inactive.color.indicator i3-wm.client.focused_inactive.color.indicator "#073642"
set_from_resource $focused_inactive.color.child_border i3-wm.client.focused_inactive.color.child_border

set_from_resource $unfocused.color.border i3-wm.client.unfocused.color.border "#002b36"
set_from_resource $unfocused.color.background i3-wm.client.unfocused.color.background "#073642"
set_from_resource $unfocused.color.text i3-wm.client.unfocused.color.text "#839496"
set_from_resource $unfocused.color.indicator i3-wm.client.unfocused.color.indicator "#073642"
set_from_resource $unfocused.color.child_border i3-wm.client.unfocused.color.child_border

set_from_resource $urgent.color.border i3-wm.client.urgent.color.border "#002b36"
set_from_resource $urgent.color.background i3-wm.client.urgent.color.background "#dc322f"
set_from_resource $urgent.color.text i3-wm.client.urgent.color.text "#fdf6e3"
set_from_resource $urgent.color.indicator i3-wm.client.urgent.color.indicator "#002b36"
set_from_resource $urgent.color.child_border i3-wm.client.urgent.color.child_border


# Window Border color
# class                 border                             background                         text                               indicator                          child_border
client.focused          $focused.color.border              $focused.color.background          $focused.color.text                $focused.color.indicator           $focused.color.child_border
client.focused_inactive $focused_inactive.color.border     $focused_inactive.color.background $focused_inactive.color.text       $focused_inactive.color.indicator  $focused_inactive.color.child_border
client.unfocused        $unfocused.color.border            $unfocused.color.background        $unfocused.color.text              $unfocused.color.indicator         $unfocused.color.child_border
client.urgent           $urgent.color.border               $urgent.color.background           $urgent.color.text                 $urgent.color.indicator            $urgent.color.child_border

# Create variables from Xresources for i3bars's look.
set_from_resource $i3-wm.bar.background.color i3-wm.bar.background.color "#002b36"
set_from_resource $i3-wm.bar.statusline.color i3-wm.bar.statusline.color "#93a1a1"
set_from_resource $i3-wm.bar.separator.color i3-wm.bar.separator.color "#268bd2"

set_from_resource $i3-wm.bar.workspace.focused.border.color i3-wm.bar.workspace.focused.border.color "#073642"
set_from_resource $i3-wm.bar.workspace.focused.background.color i3-wm.bar.workspace.focused.background.color "#073642"
set_from_resource $i3-wm.bar.workspace.focused.text.color i3-wm.bar.workspace.focused.text.color "#eee8d5"

set_from_resource $i3-wm.bar.workspace.active.border.color i3-wm.bar.workspace.active.border.color "#073642"
set_from_resource $i3-wm.bar.workspace.active.background.color i3-wm.bar.workspace.active.background.color "#073642"
set_from_resource $i3-wm.bar.workspace.active.text.color i3-wm.bar.workspace.active.text.color "#586e75"

set_from_resource $i3-wm.bar.workspace.inactive.border.color i3-wm.bar.workspace.inactive.border.color "#002b36"
set_from_resource $i3-wm.bar.workspace.inactive.background.color i3-wm.bar.workspace.inactive.background.color "#002b36"
set_from_resource $i3-wm.bar.workspace.inactive.text.color i3-wm.bar.workspace.inactive.text.color "#586e75"

set_from_resource $i3-wm.bar.workspace.urgent.border.color i3-wm.bar.workspace.urgent.border.color "#dc322f"
set_from_resource $i3-wm.bar.workspace.urgent.background.color i3-wm.bar.workspace.urgent.background.color "#dc322f"
set_from_resource $i3-wm.bar.workspace.urgent.text.color i3-wm.bar.workspace.urgent.text.color "#fdf6e3"

# Sets i3 font for dialogs
set_from_resource $i3-wm.font i3-wm.font pango:Source Code Pro Medium 8
font $i3-wm.font

###############################################################################
# i3 Bar
###############################################################################

set_from_resource $i3-wm.bar.position i3-wm.bar.position bottom
set_from_resource $i3-wm.bar.font i3-wm.bar.font pango:Source Code Pro Medium 13, Material Design Icons 13
set_from_resource $i3-wm.bar.separator i3-wm.bar.separator " "
set_from_resource $i3-wm.bar.trayoutput i3-wm.bar.trayoutput primary
set_from_resource $i3-wm.bar.stripworkspacenumbers i3-wm.bar.stripworkspacenumbers yes

# i3xrocks config file. Override this for custom status indicators on the bar.
set_from_resource $i3-wm.bar.status_command i3-wm.bar.status_command i3xrocks -u ~/.config/regolith/i3xrocks/conf.d -d /etc/regolith/i3xrocks/conf.d

# The bar configuration
bar {
  position $i3-wm.bar.position
  font $i3-wm.bar.font
  separator_symbol $i3-wm.bar.separator
  status_command $i3-wm.bar.status_command
  tray_output primary
  strip_workspace_numbers $i3-wm.bar.stripworkspacenumbers

  colors {
      background $i3-wm.bar.background.color
      statusline $i3-wm.bar.statusline.color
      separator  $i3-wm.bar.separator.color

#                        BORDER  BACKGROUND TEXT
      focused_workspace  $i3-wm.bar.workspace.focused.border.color      $i3-wm.bar.workspace.focused.background.color   $i3-wm.bar.workspace.focused.text.color
      active_workspace   $i3-wm.bar.workspace.active.border.color       $i3-wm.bar.workspace.active.background.color    $i3-wm.bar.workspace.active.text.color
      inactive_workspace $i3-wm.bar.workspace.inactive.border.color     $i3-wm.bar.workspace.inactive.background.color  $i3-wm.bar.workspace.inactive.text.color
      urgent_workspace   $i3-wm.bar.workspace.urgent.border.color       $i3-wm.bar.workspace.urgent.background.color    $i3-wm.bar.workspace.urgent.text.color
  }
}

###############################################################################
# Custom config
###############################################################################

client.focused #4bccf2 #4bccf2 #4bccf2 #4bccf2 #4bccf2

# move scratchpad
bindsym $meta+$mod+h move container to output left; focus output left
bindsym $meta+$mod+l move container to output right; focus output right

# Mouse shortcuts
# ---------------------------------------------------------------------------------
# button1 - left click
# button2 - wheel click
# button3 - right click

bindsym --whole-window $mod+button2 kill
bindsym --whole-window $mod+button3 fullscreen
bindsym --whole-window $mod+button4 exec xdotool key "super+y"
bindsym --whole-window $mod+Shift+button4 move to scratchpad
bindsym --whole-window $mod+button5 focus; floating toggle
bindsym --whole-window $mod+button8 focus; move left
bindsym --whole-window $mod+button9 focus; move right
bindsym --whole-window $mod+Shift+button9 focus; layout toggle tabbed stacked splith splitv default
bindsym --whole-window $mod+Shift+button8 focus; scratchpad show

# ---------------------------------------------------------------------------------

exec --no-startup-id xmodmap $HOME/.Xmodmap
exec --no-startup-id timedatectl set-timezone Europe/Madrid
# exec_always --no-startup-id $HOME/.cargo/bin/i3wsr --remove-duplicates
###############################################################################
# External programs launched with i3
###############################################################################
exec --no-startup-id kitty --class "kitty"

exec --no-startup-id (~/.dropbox-dist/dropboxd)&

set_from_resource $i3-wm.program.compositor i3-wm.program.compositor /usr/share/regolith-compositor/init
exec --no-startup-id $i3-wm.program.compositor

set_from_resource $i3-wm.program.notifications i3-wm.program.notifications /usr/bin/rofication-daemon
exec --no-startup-id $i3-wm.program.notifications

set_from_resource $i3-wm.program.ftui i3-wm.program.ftui /usr/bin/regolith-ftue
exec --no-startup-id $i3-wm.program.ftui

set_from_resource $i3-wm.program.unclutter i3-wm.program.unclutter /usr/bin/regolith-ftue /usr/bin/unclutter -b
exec --no-startup-id $i3-wm.program.unclutter