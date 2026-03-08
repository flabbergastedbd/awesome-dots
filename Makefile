.PHONY: common linux osx

common:
	stow -t ~/ git
	stow -t ~/ vim
	stow -t ~/.config/nvim nvim
	stow -t ~/ fish
	stow -t ~/ tmux
	stow -t ~/ sync
	stow -t ~/ python
	stow -t ~/ gdb
	stow -t ~/.config/alacritty alacritty
	stow -t ~/.config/ghostty ghostty
	stow -t ~/.config/helix helix

linux:
	# stow -t ~/ bspwm
	stow -t ~/ i3
	stow -t ~/ sway

osx:
	@echo "OS X setup"
