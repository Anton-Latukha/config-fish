#!/usr/bin/env fish

# Emacs service
systemctl --user import-environment PATH S O H HH HB NP N XDG_RUNTIME_DIR SSH_AUTH_SOCK
systemctl --user start emacs

# Telegram
run-app-on-desktop telegram-desktop 2

# Firefox
run-maximized-app-on-desktop firefox 2

# Chromium
run-maximized-app-on-desktop chromium 2
sleep 1
move-current-window-to-desktop 2


# Emacs clients

## Wait until Emacs initialized
emacsclient --eval '(daemonp)'
## Run and kill first frame (to workaround the Spacemacs specific first buffer and load org-agenda on second launch)
emacsclient -c --eval "(run-with-timer 2 nil (delete-frame))"

run-maximized-app-on-desktop 'emacsclient -c' 0

run-maximized-app-on-desktop 'emacsclient -c' 1

run-app-on-desktop 'emacsclient -c' 2

# Switch to Desktop 0
wmctrl -s 0

# Launch KeePass
run-app-on-desktop keepass 0
