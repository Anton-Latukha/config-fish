function l --description 'alias ls -lahvF --group-directories-first --time-style=iso --color'

  ls -lahvF --group-directories-first --time-style='iso' --color='auto' $argv;

end

# Crazy: Enable vi key bindings
set -g fish_key_bindings 'fish_vi_key_bindings'

set -g O '/home/pyro/org'
set -g S '/home/pyro/src'
set -g H '/home/pyro/src/haskell'
set -g N '/home/pyro/src/nix'

alias vi 'nvim'
alias vim 'nvim'
alias cd.. 'cd ..'

alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
