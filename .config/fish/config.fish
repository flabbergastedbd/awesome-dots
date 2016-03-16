# Set go path
set -gx GOPATH $HOME/workspace
# Update path for go binaries
set -gx PATH $GOPATH/bin $PATH

# Update the PATH to ensure Homebrew packages are used.
set -gx PATH /usr/local/bin /usr/local/sbin $PATH

# Custom greeting
set fish_greeting "Hey, do you see something fishy?"

# Java hack
set -x JAVA_HOME "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

# Locale setting
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Alias
alias music_rpi "bash ~/.mpd/smb_pi.sh; ncmpcpp"
