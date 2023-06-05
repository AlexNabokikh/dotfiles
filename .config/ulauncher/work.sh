#!/bin/bash

# Check if Firefox is already running
if ! pgrep "brave-browser" >/dev/null; then
	echo "Launching Brave..."
	brave-browser &
else
	echo "Brave is already running."
fi

sleep 1

# Check if Alacritty is already running
if ! pgrep -x "alacritty" >/dev/null; then
	echo "Launching Alacritty..."
	alacritty -e tmux &
else
	echo "Alacritty is already running."
fi
