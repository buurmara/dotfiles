#!/bin/zsh

# history settings
setopt hist_expire_dups_first
setopt hist_reduce_blanks
setopt share_history
setopt hist_verify

# aliases
source "${XDG_CONFIG_HOME:-$HOME/.config}/aliases"

# completion settings
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zcompletions"

# shortcuts
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zshortcuts"

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



## extr = EXTRactor for all kinds of archives
## usage: extr <file>
function extr()
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
			*)		echo "'$1' cannot be extracted via extr()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# plugins
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

# z command
. /opt/z/z.sh

# colors
autoload -Uz colors && colors

# prompt variables
PS1="%B%F{blue}%n%b%f %b%f<%F{green}%~%b%f> %F{red}$%b%f "
PS2="> "

# starship prompt
eval "$(starship init zsh)"

# zsh start
neofetch
