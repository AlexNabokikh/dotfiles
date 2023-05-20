# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set NVIM as default editor.
export EDITOR='nvim'
export VISUAL='nvim'

# Enable word splitting
setopt shwordsplit

# Custom $PATH with extra locations.
export GOPATH=$HOME/go
export PYENV_ROOT="$HOME/.pyenv"
export KREW_ROOT="$HOME/.krew"

# Set OS specific $PATH.
kernel_name="$(uname)"
if [ "${kernel_name}" = "Darwin" ]; then
  export PATH=/opt/homebrew/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$KREW_ROOT/bin:$GOPATH/bin:$PYENV_ROOT/bin:$HOME/.rd/bin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
elif [ "${kernel_name}" = "Linux" ]; then
  export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$HOME/.local/bin:usr/local/bin:/usr/local/sbin:$HOME/bin:$KREW_ROOT/bin:bin:$GOPATH:$PYENV_ROOT/bin:$PATH
else
  echo "Unknown kernel: ${kernel_name}"
fi

# GPG.
export GPG_TTY=$TTY

# Java.
export JAVA_HOME=/usr/local/opt/openjdk@11

# Oh-my-zsh.
export ZSH="$HOME/.oh-my-zsh"
# shellcheck disable=SC2034
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set Bat default theme
export BAT_THEME="Catppuccin-macchiato"

# Kubectl
# export dry='-–dry-run=client -oyaml'
export dry='--dry-run=client --output=yaml'

# VI mode
# shellcheck disable=SC2034
KEYTIMEOUT=1
bindkey -M vicmd 'V' edit-command-line

# Enable plugins.
# shellcheck disable=SC2034
plugins=(brew git history history-substring-search kubectl sudo tmux vi-mode)

# Set history settings.
HISTFILE=~/.histfile
HISTSIZE=1000
# shellcheck disable=SC2034
SAVEHIST=1000

# Set fzf options
export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--multi
--preview-window=:hidden
--preview '([[ -f {}  ]] && (bat --color=always --style=numbers,changes {} || cat {})) || ([[ -d {}  ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='~ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
"

# Set lazygit config location
export XDG_CONFIG_HOME="$HOME/.config"

# Allow history search via up/down keys.
# shellcheck disable=SC1091
source "$HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search"
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Aliases.
alias aws-okta='. ~/.aws_okta/aws-okta'
alias lg='lazygit'
alias n='nvim'
alias repo='cd $HOME/Documents/repositories'
alias stayawake='caffeinate -d -i -m &'
alias temp='cd $HOME/Downloads/temp'
alias update='for SUBC in update upgrade autoremove autoclean; do sudo apt ${SUBC} -y; done'

# Completions.
autoload -Uz compinit && compinit

# Functions
# Usage: gsync master (checks out master, pull upstream, push origin).
function gsync() {
  if [[ ! "$1" ]]; then
    echo "You must supply a branch."
    return 0
  fi

  BRANCHES=$(git branch --list "$1")
  if [ ! "$BRANCHES" ]; then
    echo "Branch $1 does not exist."
    return 0
  fi

  git checkout "$1" &&
    git pull upstream "$1" &&
    git push origin "$1"
}

# find-in-file - usage: fif <SEARCH_TERM>
fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!"
    return 1
  fi

  rg --hidden --glob '!.git' --files-with-matches --no-messages "$1" | fzf --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}

# Docker functions
# Select a docker container to start and attach to
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker exec -it "$cid" sh
}

# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# Select a docker container to remove
function drm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}

# Delete a given line number in the known_hosts file.
knownrm() {
  re='^[0-9]+$'
  line_number=$1
  if ! [[ $1 =~ $re ]]; then
    echo "error: line number missing" >&2
  else
    sed -i "${line_number}d" ~/.ssh/known_hosts
  fi
}

# Load Oh-my-zsh.
# shellcheck disable=SC1091
source "$ZSH/oh-my-zsh.sh"

# Load Powerlevel10k config.
# shellcheck disable=SC1090
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# shellcheck disable=SC1090
prefix=$(brew --prefix)
version=$(fzf --version | awk '{print $1}')
[ -f "${prefix}/Cellar/fzf/${version}/shell/key-bindings.zsh" ] && \
  source "${prefix}/Cellar/fzf/${version}/shell/key-bindings.zsh"

bindkey "ć" fzf-cd-widget

# Load pyenv
eval "$(pyenv init --path --no-rehash)"

# Prevent duplicates of PATH variables
typeset -U PATH
