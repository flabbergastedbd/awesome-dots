# Custom greeting
set fish_greeting "Hey, do you see something fishy?"

# Locale setting
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Golang settings
set -x GOPATH $HOME/workspace/golang
set -gx PATH $PATH $GOPATH/bin

# Virtualenv disable prompt
# set -x VIRTUAL_ENV_DISABLE_PROMPT "TRUE"

# TaskWarrior Aliases
alias in="task add +in"

# Virtualenv aliases
function switch_to_virtualenv
	test -d .venv
	if test $status -ne 0
		python -m venv .venv
	end
	source .venv/bin/activate.fish
end
alias v="switch_to_virtualenv"
alias V="deactivate"

# Custom watch
function watch
	while true
		clear
		eval $argv[2..-1]
 		sleep $argv[1]
	end
end

# Tmux shortcut
function setup_tmux
	set -l SESSION main

	tmux -2 new-session -d -s $SESSION -n 'mail'
	tmux send-keys "neomutt" C-m

	tmux new-window -t $SESSION:2 -n 'weechat'
	tmux send-keys "weechat" C-m

	tmux new-window -t $SESSION:3 -n 'tasks'
	setup_taskwarrior


	# Set default window
	tmux select-window -t $SESSION:1

	# Attach to session
	tmux -2 attach-session -t $SESSION
end

function setup_taskwarrior
	# Split pane vertically first
	tmux split-window -v -p 70
	# Select top pane and split it horizontally
	tmux select-pane -t 1
	tmux split-window -h -p 33
	tmux select-pane -t 1
	tmux send-keys "watch 300 task" C-m
	tmux select-pane -t 2
	tmux send-keys "watch 300 task summary" C-m
	# Switch to pane 1
	tmux select-pane -t 3
	tmux split-window -v -p 55
	tmux select-pane -t 3
	tmux split-window -h -p 33
	tmux select-pane -t 3
	tmux send-keys "watch 300 task ghistory" C-m
	tmux select-pane -t 4
	tmux send-keys "watch 300 task calendar" C-m
	tmux select-pane -t 5
end
