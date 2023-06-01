#!/bin/bash

# Check if Firefox is already running
if ! pgrep "firefox" >/dev/null; then
	echo "Launching Firefox..."
	flatpak run org.mozilla.firefox &
else
	echo "Firefox is already running."
fi

sleep 1

# Check if Alacritty is already running
if ! pgrep -x "alacritty" >/dev/null; then
	echo "Launching Alacritty..."
	alacritty &
else
	echo "Alacritty is already running."
fi
