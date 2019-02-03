# Version 2019-02-03

# Extend path with yarn, node, ruby and composer and personal bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/bin:$HOME/.config/composer/vendor/bin:$HOME/.bin:$HOME/.gem/ruby/2.5.0/bin:$PATH"

export EDITOR=vim

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# Xdebug remote
export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=127.0.0.1"

# Scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=1

export MAKEFLAGS="-j$(nproc)" 

# Aliases
alias ls='ls --color'

### Added by Zplugin's installer
source '/home/g0ne/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin ice wait"0" blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

zplugin light zsh-users/zsh-history-substring-search
zplugin light trapd00r/zsh-syntax-highlighting-filetypes

# zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# OMZ libraries
local _ZSHRC_OMZ_LIBS=(
  compfix.zsh
  completion.zsh
  directories.zsh
  functions.zsh
  grep.zsh
  history.zsh
  key-bindings.zsh
  misc.zsh
  spectrum.zsh
  termsupport.zsh
  theme-and-appearance.zsh
)

zplugin ice from"gh" pick"lib/git.zsh" nocompletions blockf \
  atload'!local f; for f in ${_ZSHRC_OMZ_LIBS}; do source lib/$f; done' \
  compile"lib/(${(j.|.)_ZSHRC_OMZ_LIBS})"
zplugin load robbyrussell/oh-my-zsh

# Theme
zplugin light caiogondim/bullet-train-oh-my-zsh-theme

BULLETTRAIN_PROMPT_ORDER=(
  time
  context
  git
  dir
)

