# Custom greeting
set fish_greeting "Hey, do you see something fishy?"

# Locale setting
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Disabled to support right font in alacritty
# set -gx TERM "screen-256color"
fish_vi_key_bindings

# osx fix
if test -d "/usr/local/bin"
	set -gx PATH "/usr/local/bin" $PATH
end

# osx fix
if test -d "/usr/local/opt/coreutils/libexec/gnubin"
	set -gx PATH "/usr/local/opt/coreutils/libexec/gnubin" $PATH
end

if test -d "/usr/local/opt/ruby/bin"
	set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
end

# linux fix
if test -n (echo $SSH_AUTH_SOCK | tr -d " \r\n")
	set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end

# Golang settings
set -x GOPATH $HOME/workspace/golang
set -gx PATH $PATH $GOPATH/bin
set -gx PATH $PATH $HOME/.cargo/bin

# Python
# I cannot tell how much I hate this cached shit
set -gx PYTHONDONTWRITEBYTECODE true

# Virtualenv disable prompt
# set -x VIRTUAL_ENV_DISABLE_PROMPT "TRUE"

# Alias
alias ls="exa"
alias lt="exa --tree"
alias ll="ls -l"

# Fuzzy changing
alias fd="fzf-cd-widget"

# Zoxide
zoxide init fish | source

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

function generate_image
	if test (count $argv) -lt 3
		echo "Usage: <command> widthxheigth fffffff filename"
	else
		convert -size $argv[1] xc:#$argv[2] $argv[3]
	end
end

# Processing helpers
alias to_str_json_array='awk \'BEGIN {printf "["} {printf t "\"%s\"",$0} {t=", "} END {printf "]"}\''
alias to_int_json_array='awk \'BEGIN {printf "["} {printf t $0} {t=", "} END {printf "]"}\''
alias to_jira_codefmt='awk \'BEGIN {printf "{code:theme=Midnight}\n"} { print $0 } END {printf "{code}\n"}\''

if test -e ~/.custom.fish
	source ~/.custom.fish
end

# Editing alias
alias n='nvim '

# Git helper
function cnp
	git commit -m $argv[1] && git push
end
