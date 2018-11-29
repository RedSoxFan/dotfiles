# Environment variables
export LANG=en_US.UTF-8
export PATH=/usr/lib/ccache/bin:$PATH:~/.local/share/bin
export EDITOR='vim'
export VISUAL='vim'
export BROWSER=/usr/bin/firefox-nightly
export GDK_BACKEND=wayland
export GTK_THEME=Vertex-Dark

# Fix fonts not showing up in java applications
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export _JAVA_AWT_WM_NONREPARENTING=1

# Aliases
alias lsa="ls -lah"

# General Functions
function mkcd() {
	mkdir "$1" && cd "$1"
}

function mkpcd() {
	mkdir -p "$1" && cd "$1"
}

# Old oh-my-zsh style path completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# History
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# Fix keys
bindkey "^[[H" beginning-of-line  # Termite
bindkey "^[[F" end-of-line  # Termite
bindkey "\033[7~" beginning-of-line  # URxvt
bindkey "\033[8~" end-of-line  # URxvt
bindkey "\033[1~" beginning-of-line  # TTY
bindkey "\033[4~" end-of-line  # TTY
bindkey "\033[2~" insert-char
bindkey "\033[3~" delete-char
bindkey -v '^?' backward-delete-char  # Allow BS over inserts

# TTY specifics
if [ "$TERM" = "linux" ]; then
	setfont ter-powerline-v18n
	echo -en "\e]P0000000" #black
	echo -en "\e]P8333333" #darkgrey
	echo -en "\e]P19f6767" #darkred
	echo -en "\e]P99f6767" #red
	echo -en "\e]P292ac68" #darkgreen
	echo -en "\e]PA92ac68" #green
	echo -en "\e]P3d0d293" #brown
	echo -en "\e]PBd0d293" #yellow
	echo -en "\e]P49aacc3" #darkblue
	echo -en "\e]PC9aacc3" #blue
	echo -en "\e]P5bb77a4" #darkmagenta
	echo -en "\e]PDbb77a4" #magenta
	echo -en "\e]P677bbb5" #darkcyan
	echo -en "\e]PE77bbb5" #cyan
	echo -en "\e]P7777777" #lightgrey
	echo -en "\e]PFffffff" #white
	clear #for background artifacting
fi

# Prompt
function +vi-git-process() {
	if [[ -n "${hook_com[staged]}" ]] && [[ -n "${hook_com[unstaged]}" ]]; then
		hook_com[unstaged]="${hook_com[unstaged][2]}"
	fi
}

prompt_git() {
	if ! $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		return;
	fi

	autoload -Uz vcs_info

	zstyle ':vcs_info:*' enable git
	zstyle ':vcs_info:*' get-revision true
	zstyle ':vcs_info:*' check-for-changes true
	zstyle ':vcs_info:*' formats "%b/%7>>%i%<<%c%u"
	zstyle ':vcs_info:*' actionformats '%b/%7>>%i%<</%a%c%u'
	zstyle ':vcs_info:*' stagedstr '/s'
	zstyle ':vcs_info:*' unstagedstr '/u'
	zstyle ':vcs_info:git*+set-message:*' hooks git-process

	vcs_info
	echo -n " "
	if [[ -n $(git status --porcelain 2>/dev/null | tail -n1) ]]; then
		echo -n "%F{yellow}"
	else
		echo -n "%F{green}"
	fi
	echo -n "${vcs_info_msg_0_%% }%f"
}

prompt_tmux() {
	if [ -z "$TMUX" ]; then
		return;
	fi

	echo -n "["$(tmux display-message -p '#S')"] "
}

prompt_build() {
	echo -n '%B'
	prompt_tmux
	echo -n '%(?..%F{red}%?%f )'
	echo -n '%F{cyan}%1~%f'
	prompt_git
	echo -n '%(!.#.>)'
	echo -n ' %b'
}

setopt PROMPT_SUBST
PROMPT='$(prompt_build)'

# Display vi mode
KEYTIMEOUT=5
if [ "$TERM" = "linux" ]; then
	# Display '<<<' on the right for normal and nothing for insert
	function zle-keymap-select {
		if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
			RPROMPT="%B%F{red}<<<%f%b"
		else
			RPROMPT=""
		fi
		zle reset-prompt
	}
	zle -N zle-keymap-select
	RPROMPT=""
else
	# Display block cursor for normal and I-beam cursor for insert
	function zle-line-init {
		zle -K viins
	}
	zle -N zle-line-init
	function zle-keymap-select {
		if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
			echo -ne '\e[1 q'
		else
			echo -ne '\e[5 q'
		fi
	}
	zle -N zle-keymap-select
	echo -ne '\e[5 q'
	preexec() {
		echo -ne '\e[1 q'
	}
fi
