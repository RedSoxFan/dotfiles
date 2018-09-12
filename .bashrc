# Environment Variables
export PATH=/usr/lib/ccache/bin:$PATH:~/.local/share/bin
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export BROWSER=/usr/bin/vivaldi-stable

# Fix fonts not showing up in java applications
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# General Aliases
alias cdkern="cd ~/programming/git/kernels/staging "
alias cdo="cd \"$OLDPWD\" "
alias cls="echo -ne '\033c'"
alias i3sus="i3lock -c 111111 && systemctl suspend"
alias java7="/lib/jvm/java-7-openjdk/bin/java "
alias javac7="/lib/jvm/java-7-openjdk/bin/javac "
alias java8="/lib/jvm/java-8-openjdk/bin/java "
alias javac8="/lib/jvm/java-8-openjdk/bin/javac "
alias topcpu="top -o %CPU "
alias topmem="top -o %MEM "

# General Functions
mkcd() {
	mkdir "$1" && cd "$1"
}

mkpcd() {
	mkdir -p "$1" && cd "$1"
}

# Package Not Found
source /usr/share/doc/pkgfile/command-not-found.bash

# Auto cd
shopt -s autocd

# Window Sizing Fix
shopt -s checkwinsize

# Set vi keybinds
set -o vi
