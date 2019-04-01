function l --description 'alias ls -lahvF --group-directories-first --time-style=iso --color'

  ls -lahvF --group-directories-first --time-style=iso --color $argv;

end

# Crazy: Enable vi key bindings
set -g fish_key_bindings fish_vi_key_bindings
