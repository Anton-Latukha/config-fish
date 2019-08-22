function l --description 'alias ls -lahvF --group-directories-first --time-style=iso --color'

  ls -lahvF --group-directories-first --time-style='iso' --color='auto' $argv;

end

# Crazy: Enable vi key bindings
set -g fish_key_bindings 'fish_vi_key_bindings'

set -gu O '/home/pyro/org'
set -gu S '/home/pyro/src'
set -gu H '/home/pyro/src/haskell'
set -gu HH '/home/pyro/src/haskell/hnix'
set -gu N '/home/pyro/src/nix'
set -gu C '/home/pyro/.config'
set -gu F '/home/pyro/.config/fish'
set -gu FF '/home/pyro/.config/fish/functions'
set -gu FS '/home/pyro/.config/fish/script'

alias vi 'nvim'
alias vim 'nvim'
alias cd.. 'cd ..'

alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

#### Emacs support
# emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

# this function may be required
function fish_title
  true
end
#### \Emacs support
