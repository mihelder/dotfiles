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
prompt_command () {
    local EXIT="$?"
    local GREEN="\[\033[0;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local CYAN="\[\033[0;36m\]"
    local BCYAN="\[\033[1;36m\]"
    local BLUE="\[\033[0;34m\]"
    local GRAY="\[\033[0;37m\]"
    local DKGRAY="\[\033[1;30m\]"
    local WHITE="\[\033[1;37m\]"
    local RED="\[\033[0;31m\]"
    # return color to terminal setting for text color
    local DEFAULT="\[\033[0;39m\]"
    # main prompt color
    if [ $EXIT != 0 ]; then
        MAIN_COLOR=${RED}
    else
        MAIN_COLOR=${GREEN}
    fi
    # only show current dir if pwd gets too big
    MY_PWD=${PWD/#$HOME/\~}
    if [ ${#MY_PWD} -gt 18 ]
    then
        MY_PWD=${MY_PWD##*/}
    else
        MY_PWD=${MY_PWD}
    fi
    # get virtual env (if any)
    if [[ $VIRTUAL_ENV != "" ]]; then
        VENV="${BLUE}[${VIRTUAL_ENV##*/}]"
    else
        VENV=''
    fi
    export PS1="${VENV}${YELLOW}[\!]${MAIN_COLOR}${MAIN_PROMPT}[\u.\h: ${MY_PWD}]\$ ${DEFAULT}"
}
export PROMPT_COMMAND=prompt_command

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
