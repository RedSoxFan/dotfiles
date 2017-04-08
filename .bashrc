# Environment Variables
export PATH=/usr/lib/ccache/bin:$PATH:~/.local/share/bin
export TERM=xterm-256color
export TERMINAL=/usr/bin/urxvt
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export BROWSER=/usr/bin/vivaldi-stable

# Fix fonts not showing up in java applications
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# General Aliases
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

# Pitt Aliases
alias mntafs="sshfs bma37@unixs.cis.pitt.edu:~/afs -o rw,allow_other "
alias 2174="cd /home/brian/OneDrive/Pitt/2174 "
alias 1520="2174 && cd 1520 "
alias 1530="2174 && cd 1530 "
alias 1632="2174 && cd 1632 "
alias 1980="2174 && cd 1980 "
alias kernel="cd ~/programming/git/kernels/staging "
alias unixs="ssh -l bma37@unixs.cis.pitt.edu "

# Package Not Found
source /usr/share/doc/pkgfile/command-not-found.bash

# Auto cd
shopt -s autocd

# Window Sizing Fix
shopt -s checkwinsize
