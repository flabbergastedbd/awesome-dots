.PHONY: common linux osx

common:
	stow -t ~/ git
	stow -t ~/ vim
	stow -t ~/ fish
	stow -t ~/ tmux
	stow -t ~/ sync
	stow -t ~/ python
	stow -t ~/ neomutt
	stow -t ~/ gdb
	stow -t ~/.config/peco peco
	stow -t ~/.weechat weechat
	stow -t ~/.config/radare2 radare2
	stow -t ~/.config/alacritty alacritty

linux:
	stow -t ~/ bspwm

osx:
	@echo "OS X setup"
