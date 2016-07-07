# Executes at the start of every zsh session.

# Source Prezto.
  #if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    #source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  #fi

  PATH=/usr/local/bin:$HOME/.local/bin:/usr/local/homebrew/share/python/:$PATH


####################################################################################################
# General
####################################################################################################
  export EDITOR='vim'
  export VISUAL='vim'
  export KEYTIMEOUT=1        # Eliminates <Esc> delay for Vi mode.
  export TERM=screen-256color

# Go
  export GOPATH=$HOME
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Shortcuts
  if hash ack 2>/dev/null; then
    alias a='ack'
  elif hash ack-grep 2>/dev/null; then
    alias a='ack-grep'
  fi
  alias d='diff'
  alias g='git'
  alias t='tmux'
  alias v='vim'
  alias l='less'
  alias lf='less +F'

# Verify overwrite/delete
  alias cp='nocorrect cp -i'
  alias mv='nocorrect mv -i'
  alias rm='nocorrect rm -i'

# Symbols
  export STAR=★


####################################################################################################
# Vi Mode
####################################################################################################
bindkey -v
# Colemak.
  bindkey -M vicmd "h" backward-char
  bindkey -M vicmd "n" down-line-or-history
  bindkey -M vicmd "e" up-line-or-history
  bindkey -M vicmd "i" forward-char
  bindkey -M vicmd "s" vi-insert
  bindkey -M vicmd "S" vi-insert-bol
  bindkey -M vicmd "k" vi-repeat-search
  bindkey -M vicmd "K" vi-rev-repeat-search
  bindkey -M vicmd "l" beginning-of-line
  bindkey -M vicmd "L" end-of-line
  bindkey -M vicmd "j" vi-forward-word-end
  bindkey -M vicmd "J" vi-forward-blank-word-end

# Sane Undo, Redo, Backspace, Delete.
  bindkey -M vicmd "u" undo
  bindkey -M vicmd "U" redo
  bindkey -M vicmd "^?" backward-delete-char
  bindkey -M vicmd "^[[3~" delete-char

# Keep ctrl+r searching
  bindkey -M viins '^R' history-incremental-pattern-search-forward
  bindkey -M viins '^r' history-incremental-pattern-search-backward


####################################################################################################
# Source local zshrc
####################################################################################################
if [ -f ~/.zsh-plugin-golang ]; then
  source ~/.zsh-plugin-golang
fi
if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi


####################################################################################################
# zim
####################################################################################################
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
autoload -Uz promptinit
promptinit
prompt eriner


####################################################################################################
# iTerm2
####################################################################################################
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
