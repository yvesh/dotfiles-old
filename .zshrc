# Version 2019-09-22

# Extend PATH with yarn, node, ruby and composer and personal bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/bin:$HOME/.config/composer/vendor/bin:$HOME/.bin:$HOME/.gem/ruby/2.4.0/bin:$PATH"

export EDITOR=vim

# Compiler options
export NUMCPUS=$(nproc)
export NUMCPUSPLUSONE=$(( NUMCPUS + 1 ))
export MAKEOPTS="-j$NUMCPUSPLUSONE -l$NUMCPUS"

# Gentoo specific
export EMERGE_DEFAULT_OPTS="--jobs=$NUMCPUSPLUSONE --load-average=$NUMCPUS"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# Xdebug (PHP) remote
export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=127.0.0.1"

# Scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=1

# Wayland specific
# export _JAVA_AWT_WM_NONREPARENTING=1

# QEMU 
export QEMU_AUDIO_DRV=alsa
export QEMU_ALSA_DAC_BUFFER_SIZE=512
export QEMU_ALSA_DAC_PERIOD_SIZE=128

# Aliases
alias ls='ls --color'
alias ssh='TERM=xterm-256color \ssh'

### Added by Zplugin's installer
source "~/.zplugin/bin/zplugin.zsh"
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

