#
# .zshrc
#

# Custom $PATH with extra locations.
kernel_name="$(uname)"
if [ "${kernel_name}" = "Darwin" ]; then
  export PATH=$HOME/.pyenv/bin:/opt/homebrew/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:${HOME}/.krew/bin:/$HOME/go/bin:$PATH
  alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:/} brew"
elif [ "${kernel_name}" = "Linux" ]; then
  export PATH=$HOME/.homebrew/bin:$HOME/.pyenv/bin:$HOME/.local/bin:usr/local/bin:/usr/local/sbin:$HOME/bin:${HOME}/.krew/bin:$PATH
else
  echo "Unknown kernel: ${kernel_name}"
fi

# GPG.
export GPG_TTY=$TTY

# Java.
export JAVA_HOME=/usr/local/opt/openjdk@11

# Oh-my-zsh.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set Bat default theme
export BAT_THEME="Visual Studio Dark+"

# VI mode
KEYTIMEOUT=1
bindkey -M vicmd 'V' edit-command-line

# Enable plugins.
plugins=(brew docker git helm history history-substring-search kubectl pip poetry sudo terraform tmux vi-mode)

# Set history settings.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set fzf default options
export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--multi
--preview '([[ -f {}  ]] && (bat --color=always --style=numbers,changes {} || cat {})) || ([[ -d {}  ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
"

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Allow history search via up/down keys.
source $HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Aliases.
alias aws-okta='. ~/.aws_okta/aws-okta'
alias dock-env='eval $(minikube -p minikube docker-env)'
alias repo='cd $HOME/Documents/repositories'
alias stayawake='caffeinate -d -i -m &'
alias temp='cd $HOME/Downloads/temp'
alias update='for SUBC in update upgrade autoremove autoclean; do sudo apt ${SUBC} -y; done'

# Completions.
autoload -Uz compinit && compinit

# Git upstream branch syncer.
# Usage: gsync master (checks out master, pull upstream, push origin).
function gsync() {
  if [[ ! "$1" ]]; then
    echo "You must supply a branch."
    return 0
  fi

  BRANCHES=$(git branch --list $1)
  if [ ! "$BRANCHES" ]; then
    echo "Branch $1 does not exist."
    return 0
  fi

  git checkout "$1" &&
    git pull upstream "$1" &&
    git push origin "$1"
}

# Enter a running Docker container.
function denter() {
  if [[ ! "$1" ]]; then
    echo "You must supply a container ID or name."
    return 0
  fi

  docker exec -it $1 sh
  return 0
}

# Delete a given line number in the known_hosts file.
knownrm() {
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]]; then
    echo "error: line number missing" >&2
  else
    sed -i '' "$1d" ~/.ssh/known_hosts
  fi
}

# Load Oh-my-zsh.
source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k config.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Load fzf key bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
