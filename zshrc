# Executes at the start of every zsh session.

# Source Prezto.
  if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  fi


####################################################################################################
# General
####################################################################################################
  export EDITOR='vim'
  export VISUAL='vim'
  export KEYTIMEOUT=1        # Eliminates <Esc> delay for Vi mode.

# Shortcuts
  alias g='git'
  alias t='tmux'
  alias v='vim'

# Verify overwrite/delete
  alias cp='nocorrect cp -i'
  alias mv='nocorrect mv -i'
  alias rm='nocorrect rm -i'

# Symbols
  export STAR=★


####################################################################################################
# Vi Mode
####################################################################################################

# Colemak.
  bindkey -M vicmd "h" backward-char
  bindkey -M vicmd "i" forward-char
  bindkey -M vicmd "n" down-line-or-history
  bindkey -M vicmd "e" up-line-or-history
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


###############
### G STUFF ###
###############
# Perforce variables
  export P4CONFIG=.p4config
  export P4DIFF="/home/build/google3/devtools/scripts/p4diff -w"
  export P4MERGE=/home/build/eng/perforce/mergep4.tcl

# Shortcuts
  alias buildifier='/google/data/ro/projects/devtools/buildifier/buildifier'
  alias cb='blaze build cloud/platform/testing/cloudbox:cloudbox -c opt && blaze-bin/cloud/platform/testing/cloudbox/cloudbox --user argentum-test --sandbox_name chloeadeline --env'
  alias eclimd='/usr/local/google/users/chloeadeline/eclipse38/stable/eclimd'
  alias g5='/google/data/ro/projects/shelltoys/g5.sar'
  alias menu='/home/build/static/projects/menu/menu.par kayak,junction'
  alias sandman='/google/data/ro/projects/sandman/sandman.par'
