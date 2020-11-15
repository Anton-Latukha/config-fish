#!/usr/bin/env fish

run-maximized-app-on-desktop 'emacsclient -c' 0
rename-current-window 'emacs1'

run-maximized-app-on-desktop 'emacsclient -c' 1
rename-current-window 'emacs2'

run-app-on-desktop 'emacsclient -c' 2
rename-current-window 'emacs3'
