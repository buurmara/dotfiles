#!/bin/zsh

# history settings
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# completion settings
setopt EXTENDEDGLOB
setopt GLOB_DOTS
setopt ALIASES
setopt CORRECT
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# vim mode
bindkey -v
export KEYTIMEOUT=1

# vim keys in the completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history

#different cursor shapes
cursor_block="\e[1 q"
cursor_beam="\e[5 q"
function zle-keymap-select {
	case $KEYMAP in
		vicmd) echo -ne $cursor_block;;
		viins|main) echo -ne $cursor_beam;;
	esac
}
zle -N zle-keymap-select

zle-line-init() {
	echo -ne $cursor_beam
}
zle -N zle-line-init

# edit the current command in vim with ctrl-e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

function precmd {
set the terminal title to the current working directory
	print -Pn "\e]0;%~\a"
}

function preexec {
	# set the terminal title to the current command
	print -Pn "\e]0;$1\a"

	# use the beam cursor
	echo -ne $cursor_beam
}

# aliases
source "$XDG_CONFIG_HOME/aliases"

# colors
autoload -Uz colors && colors

# prompt variables
PS1="%B%F{blue}%n%b%f %b%f<%F{green}%~%b%f> %F{red}$%b%f "
PS2="> "

# plugins
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

## ex = EXtractor for all kinds of archives
## usage: ex <file>
function ex()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1	;;
			*.tar.gz)	tar xzf $1	;;
			*.bz2)		bunzip2 $1	;;
			*.rar)		unrar x $1	;;
			*.gz)		gunzip $1	;;
			*.tar)		tar xf $1	;;
			*.tbz2)		tar xjf $1	;;
			*.tgz)		tar xzf $1	;;
			*.zip)		unzip $1	;;
			*.Z)		uncompress $1	;;
			*.7z)		7z x $1		;;
			*.deb)		ar x $1		;;
			*.tar.xz)	tar xf $1	;;
			*.tar.zst)	unzstd $1	;;
			*)		echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}


# zsh start
neofetch
