# Functions
# cd to the project
cd-to-project() {
  selected=$(find ~/Documents/repositories -mindepth 1 -maxdepth 2 -type d -not -iwholename '*.git*' | fzf)
  if [ -n "$selected" ]; then
    tmux new-window -c "$selected" -n "$(basename "$selected")" || exit
  fi
}

# find-in-file
fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!"
    return 1
  fi

  rg --hidden --glob '!.git' --files-with-matches --no-messages "$1" | fzf --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}

# fzf kill
fkill() {
	pid=$(ps -ef | sed 1d | fzf | awk '{print $2}')

	if [ "x$pid" != "x" ]; then
		kill -"${1:-9}" "$pid"
	fi
}

# Delete a given line number in the known_hosts file.
knownrm() {
  re='^[0-9]+$'
  line_number=$(cat -n ~/.ssh/known_hosts | fzf | awk '{print $1}')
  if ! [[ $line_number =~ $re ]]; then
    echo "error: line number missing" >&2
  else
    sed -i "${line_number}d" ~/.ssh/known_hosts
  fi
}

