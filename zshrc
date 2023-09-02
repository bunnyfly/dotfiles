# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

####################################################################################################
# General
####################################################################################################
  export EDITOR='vim'
  export VISUAL='vim'
  export KEYTIMEOUT=1        # Eliminates <Esc> delay for Vi mode.
  export TERM=screen-256color

# macOS is stupid and needs this to run async Python RQ tasks.
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Go
  export GOPATH=$HOME
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Shortcuts
  if hash ag 2>/dev/null; then
    alias a='ag'
  elif hash ack 2>/dev/null; then
    alias a='ack'
  elif hash ack-grep 2>/dev/null; then
    alias a='ack-grep'
  fi
  alias d='diff'
  alias g='git'
  alias h='heroku'
  alias l='less'
  alias lf='less +F'
  alias t='tmux'
  alias v='vim'
  alias vim='nvim'

# Verify overwrite/delete
  alias cp='nocorrect cp -i'
  alias mv='nocorrect mv -i'
  alias rm='nocorrect rm -i'

# yt-dlp
  alias yt-dlp-video="yt-dlp -o '%(uploader)s/%(upload_date>%Y)d/%(uploader)s - S%(upload_date>%Y)dE%(upload_date>%m)02d%(upload_date>%d)02d - %(title)s [youtube-%(id)s].%(ext)s' --embed-metadata --embed-thumbnail --embed-chapters --write-subs --sub-langs en"

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
# fzf
####################################################################################################
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  # Make sure FZF uses ag (which respects .gitignore files) and ignores .git dirs itself.
  export FZF_DEFAULT_COMMAND='ag --skip-vcs-ignores --hidden --ignore .git -g ""'
  export FZF_DEFAULT_OPTS=''
  # Match exact words (don't fuzzy match foo to fzozo)
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --exact'
  # Up/down wraps to top/bottom of results
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --cycle'
  # Input on top, results below
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --reverse'
  # Some margin to differentiate fzf appearance
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --margin=0,4'
  # Custom key bindings
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --bind=ctrl-n:down,ctrl-e:up,ctrl-f:page-down,ctrl-b:page-up'
  # Use tmux panes for fzf to avoid the shell output getting pushed around.
  export FZF_TMUX=1
  # One Dark color scheme with darker bg highlight color.
  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=dark
    --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#252931,hl+:#d858fe
    --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
  '




####################################################################################################
# ng auto-completion
####################################################################################################

###-ng-completion###
_ng_completion () {
        local words cword opts
        read -Ac words
        read -cn cword
        let cword-=1

        case $words[cword] in
          ng|help) opts="--version -v b build completion doc e e2e eject g generate get help l lint new s serve server set t test v version xi18n" ;;
b|build) opts="--aot --app --base-href --deploy-url --environment --extract-css --i18n-file --i18n-format --locale --output-hashing --output-path --poll --progress --sourcemaps --stats-json --target --vendor-chunk --verbose --watch -a -aot -bh -d -e -ec -i18nFile -i18nFormat -locale -oh -op -poll -pr -sm -statsJson -t -v -vc -w" ;;
completion) opts="--all --bash --zsh -a -b -z" ;;
e|e2e) opts="--aot --app --base-href --config --deploy-url --element-explorer --environment --extract-css --hmr --host --i18n-file --i18n-format --live-reload --live-reload-client --locale --open --output-hashing --output-path --poll --port --progress --proxy-config --serve --sourcemaps --specs --ssl --ssl-cert --ssl-key --target --vendor-chunk --verbose --watch --webdriver-update -H -a -aot -bh -c -d -e -ec -ee -hmr -i18nFile -i18nFormat -liveReloadClient -locale -lr -o -oh -op -p -pc -poll -pr -s -sm -sp -ssl -sslCert -sslKey -t -v -vc -w -wu" ;;
eject) opts="--aot --app --base-href --deploy-url --environment --extract-css --force --i18n-file --i18n-format --locale --output-hashing --output-path --poll --progress --sourcemaps --target --vendor-chunk --verbose --watch -a -aot -bh -d -e -ec -force -i18nFile -i18nFormat -locale -oh -op -poll -pr -sm -t -v -vc -w" ;;
g|generate) opts="class component directive enum guard interface module pipe service--dry-run --verbose -d -v" ;;
get) opts="--global -global" ;;
l|lint) opts="--fix --force --format --type-check -fix -force -format -typeCheck" ;;
new) opts="--directory --dry-run --inline-style --inline-template --link-cli --prefix --routing --skip-commit --skip-git --skip-install --skip-tests --source-dir --style --verbose -d -dir -is -it -lc -p -routing -sc -sd -sg -si -st -style -v" ;;
s|serve|server) opts="--aot --app --base-href --deploy-url --environment --extract-css --hmr --host --i18n-file --i18n-format --live-reload --live-reload-client --locale --open --output-hashing --output-path --poll --port --progress --proxy-config --sourcemaps --ssl --ssl-cert --ssl-key --target --vendor-chunk --verbose --watch -H -a -aot -bh -d -e -ec -hmr -i18nFile -i18nFormat -liveReloadClient -locale -lr -o -oh -op -p -pc -poll -pr -sm -ssl -sslCert -sslKey -t -v -vc -w" ;;
set) opts="--global -g" ;;
t|test) opts="--app --browsers --code-coverage --colors --config --log-level --poll --port --progress --reporters --single-run --sourcemaps --watch -a -browsers -c -cc -colors -logLevel -poll -port -progress -reporters -sm -sr -w" ;;
--version|-v|v|version) opts="--verbose -verbose" ;;
xi18n) opts="--app --i18n-format --locale --out-file --output-path --progress --verbose -a -f -l -of -op -progress -verbose" ;;
*) opts="" ;;
        esac

        setopt shwordsplit
        reply=($opts)
        unset shwordsplit
      }

      compctl -K _ng_completion ng
###-end-ng-completion###


####################################################################################################
# nvm
####################################################################################################
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # Automatically use node version when entering a directory that contains an .nvmrc file.
  autoload -U add-zsh-hook
  load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use
      fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc


####################################################################################################
# rbenv
####################################################################################################
  if hash rbenv 2>/dev/null; then
    eval "$(rbenv init -)"
  fi


####################################################################################################
# Powerlevel10k prompt
# https://github.com/romkatv/powerlevel10k
####################################################################################################
  source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

####################################################################################################
# PATHs
####################################################################################################
  export PATH=/usr/local/bin:$HOME/.local/bin:/usr/local/homebrew/share/python/:$PATH
  export PATH=~/Library/Android/sdk/tools:$PATH
  export PATH=~/Library/Android/sdk/platform-tools:$PATH
  export PATH="/usr/local/opt/thrift@0.9/bin:$PATH"
  export PATH="$PATH:$HOME/.rvm/bin"
  export PATH="/usr/local/opt/kubernetes-cli@1.22/bin:$PATH"
