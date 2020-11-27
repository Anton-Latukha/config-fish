## Using heavy quotation to speed-up execution process

function 'l' --description 'alias ls -lahvF --group-directories-first --time-style=iso --color'

  ls -lahvF --group-directories-first --time-style='long-iso' --color='auto' $argv;

end

# Crazy: Enable vi key bindings
set -g 'fish_key_bindings' 'fish_vi_key_bindings'

set -gu 'O' "$HOME"'/org'
set -gu 'OO' "$HOME"'/org/org'
set -gu 'OD' "$HOME"'/org/dictionary'
set -gu 'HN' "$HOME"'/org/haskell'
set -gu 'OH' "$HOME"'/org/haskell'
set -gu 'FH' "$HOME"'/org/haskell'
set -gu 'S' "$HOME"'/src'
set -gu 'H' "$HOME"'/src/haskell'
set -gu 'HH' "$HOME"'/src/haskell/hnix'
set -gu 'HS' "$HOME"'/src/haskell/hnix-store'
set -gu 'HZ' "$HOME"'/src/haskell/zen'
set -gu 'ZEN' "$HOME"'/src/haskell/zen'
set -gu 'HB' "$HOME"'/src/haskell/Haskell-Programming-From-First-Principles'
set -gu 'HV' '/m/v/haskell'
set -gu 'N' '/home/pyro/src/nix'
set -gu 'NP' '/home/pyro/src/nix/pkgs'
set -gu 'C' '/home/pyro/.config'
set -gu 'G' '/home/pyro/.config/git'
set -gu 'F' '/home/pyro/.config/fish'
set -gu 'FF' '/home/pyro/.config/fish/functions'
set -gu 'FS' '/home/pyro/.config/fish/scripts'
set -gu 'FE' '/home/pyro/.config/fish/externalModules'
set -gu 'D' '/home/pyro/Downloads'
set -gu 'VID' '/m/v'

# Load LS_COLORS into LS colors DB
# dircolors --c-shell "$FE/LS_COLORS/LS_COLORS"

set 'normal_color'     (set_color 'normal')
set 'success_color'    (set_color "$fish_pager_color_progress" ^ '/dev/null'; or set_color 'cyan')
set 'error_color'      (set_color "$fish_color_error" ^ '/dev/null'; or set_color 'red' --bold)
set 'repository_color' (set_color "$fish_color_quote" ^ '/dev/null'; or set_color 'brown')

set 'fish' '>'
set 'fishNrm' (set_color 'green')"$fish"(set_color 'normal')
set 'fishErr' "$error_color""$fish"(set_color 'normal')
set 'ahead' (set_color 'green')'↑'
set 'behind' (set_color 'brown')'↓'
set 'diverged' (set_color 'brown')'⥄'
set 'dirty' (set_color 'brown')'⨯'
set 'none' (set_color 'green')'◦'

set 'dirClrR' (set_color 'red')
set 'dirClrU' (set_color 'green')

set 'bGreen' (set_color 'brgreen')

alias 'h' 'hoogle'
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

set 'vicm' (set_color --bold 'FF6600')'🅽 '(set_color 'normal')
set 'viim' (set_color 'green')'🅸 '(set_color 'normal')
set 'virm' (set_color 'green')'🆁 '(set_color 'normal')
set 'vivm' (set_color --bold 'brmagenta')'🆅 '(set_color 'normal')

#### Modifying the vi mode prompts
# Do nothing if not in vi mode
function 'fish_mode_prompt' --description 'Displays the current mode'
  if test "$fish_key_bindings" = 'fish_vi_key_bindings'
    switch "$fish_bind_mode"
      case 'default'
        printf "$vicm"
      case 'insert'
        printf "$viim"
      case 'replace_one'
        printf "$virm"
      case visual
        printf "$vivm"
    end
  end
end

set 'repository_color' (set_color "$fish_color_quote" ^ '/dev/null'; or set_color 'brown')

## Function that runs Wakatime, executed further
function rWakatime
  ## Hook Wakatime to the terminal
  set 'curPath' (pwd)
  set 'gitProj' (git 'config' --get 'remote.u.url' ^ '/dev/null')
  if test -n "$gitProj"
    set 'proj' (basename -s '.git' "$gitProj")
  else
    set 'proj' 'Terminal'
  end
  wakatime --write --plugin 'fish-wakatime/0.0.1' --entity-type 'app' --project "$proj" --entity 'Tilix' &
end

## Setup Fisher, if fishfile is present - loads all packages
if not functions -q fisher
  set -q 'XDG_CONFIG_HOME'; or set 'XDG_CONFIG_HOME' "$HOME"/.config
  curl 'https://git.io/fisher' --create-dirs -sLo "$XDG_CONFIG_HOME"/fish/functions/fisher.fish
  fish -c fisher
end

## acomagu/fish-async-prompt configuration
#### Inheritence of variables to async processes
set -gu 'async_prompt_inherit_variables' 'all'
#### Offload UI functions to async process
set -gu 'async_prompt_functions' 'fish_prompt rWakatime done git_is_repo git_branch_name git_is_touched git_ahead prompt_pwd fish_right_prompt'

## franciscolourenco/done configuration
#### display notifications if a command longer then
set -gu '__done_min_cmd_duration' '10000'
set -gu '__done_exclude' '(git (?!push|pull|clone)|emacs|e |uEmacs|dEmacs)'  # default: all git commands, except push and pull. accepts a regex.

## Modify the PATH
set -gu fish_user_paths $HOME/.cabal/bin $HOME/.ghcup/bin
