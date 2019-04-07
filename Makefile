.PHONY: common linux osx

common:
	stow -t ~/ git
	stow -t ~/ vim
	stow -t ~/ fish
	stow -t ~/ tmux
	stow -t ~/ python
	stow -t ~/ neomutt
	stow -t ~/.weechat weechat

linux:
	stow -t ~/ bspwm

osx:
	@echo "OS X setup"
