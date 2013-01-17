# ==========================================
#
# $HOME/.bashrc file for bash-3.0 (or later)
# By Mike Helderman
#
#===========================================

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#-----------------
# History settings
#-----------------

# save enough history
HISTSIZE=10000
HISTFILESIZE=20000

# don't put duplicate lines or empty spaces in the history
export HISTCONTROL=ignoreboth
 
# combine multiline commands in history
shopt -s cmdhist

# merge session histories
shopt -s histappend

#---------------
# Color settings
#---------------

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
	alias ll='ls -alF'
	alias la='ls -A'
	alias l='ls -CF'
fi

# make grep highlight results using color
export GREP_OPTIONS='--color=auto'

# less colors for man pages
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m' # begin bold
export LESS_TERMCAP_me=$'\E[0m'     # end mode
export LESS_TERMCAP_se=$'\E[0m'     # end standout-mode
export LESS_TERMCAP_so=$'\E[01;34m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'     # end underline
export LESS_TERMCAP_us=$'\E[01;32m' # begin underline

# colorized prompt with handy extra info
PROMPT_COMMAND='PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'

#---------------
# Other settings
#---------------

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#----------------------
# On a lighter note :-)
#----------------------

echo `head -1 /etc/motd`
if [ -x /usr/games/fortune ]; then
    if [ -x /usr/games/cowsay ]; then
        fortune | cowsay -f tux
    else
        echo
        fortune
        echo
    fi
fi
