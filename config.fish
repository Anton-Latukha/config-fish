## Using heavy quotation to speed-up execution process

function 'l' --description 'alias ls -lahvF --group-directories-first --time-style=iso --color'

  ls -lahvF --group-directories-first --time-style='iso' --color='auto' $argv;

end

# Crazy: Enable vi key bindings
set -g 'fish_key_bindings' 'fish_vi_key_bindings'

set -gu 'O' '/home/pyro/org'
set -gu 'OO' '/home/pyro/org/org'
set -gu 'HN' '/home/pyro/org/haskell'
set -gu 'S' '/home/pyro/src'
set -gu 'H' '/home/pyro/src/haskell'
set -gu 'HH' '/home/pyro/src/haskell/hnix'
set -gu 'N' '/home/pyro/src/nix'
set -gu 'NP' '/home/pyro/src/nix/pkgs'
set -gu 'C' '/home/pyro/.config'
set -gu 'G' '/home/pyro/.config/git'
set -gu 'F' '/home/pyro/.config/fish'
set -gu 'FF' '/home/pyro/.config/fish/functions'
set -gu 'FS' '/home/pyro/.config/fish/scripts'
set -gu 'D' '/home/pyro/Downloads'

alias 'vi' 'nvim'
alias 'vim' 'nvim'
alias 'cd..' 'cd ..'

alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

#### Emacs support
# emacs ansi-term support
if test -n "$EMACS"
  set -x 'TERM' 'eterm-color'
end

# this function may be required
function 'fish_title'
  true
end
#### \Emacs support


#### Modifying the vi mode prompts
function 'fish_mode_prompt' --description 'Displays the current mode'
  # Do nothing if not in vi mode
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case 'default'
        set_color --bold 'FF6600'
        echo '🅽'
      case 'insert'
        set_color --bold 'green'
        echo '🅸'
      case 'replace_one'
        set_color --bold 'green'
        echo '🆁'
      case visual
        set_color --bold 'brmagenta'
        echo '🆅'
    end
    set_color 'normal'
    printf ' '
  end
end

function rWakatime
  ## Hook Wakatime to the terminal
  set 'curPath' (pwd)
  set 'gitProj' (/run/current-system/sw/bin/git 'config' --get 'remote.u.url' ^ '/dev/null')
  if test -n "$gitProj"
    set 'proj' (/run/current-system/sw/bin/basename -s '.git' "$gitProj")
  else
    set 'proj' 'Terminal'
  end
  /run/current-system/sw/bin/wakatime --write --plugin 'fish-wakatime/0.0.1' --entity-type 'app' --project "$proj" --entity (echo $history[1] | cut -d' ' -f1) 2>&1 > '/dev/null' &
end
