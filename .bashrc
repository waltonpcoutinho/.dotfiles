# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -la'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Git configure user
git config --global user.email "walton.coutinho@gmail.com"
git config --global user.name "waltonpcoutinho"

# Export path to .local/bin (for pip)
export PATH=$PATH:/home/walton/.local/bin

# Export path to MATLAB binary
export PATH=$PATH:/usr/local/MATLAB/R2019b/bin/

# Export path to Julia binary
export PATH=$PATH:/opt/julia-1.6.3/bin/

# Export path to GAMS binary
export PATH=$PATH:/opt/GAMS/gams30.3_linux_x64_64_sfx/

# Export path to CPLEX binary
export PATH=$PATH:/opt/ibm/ILOG/CPLEX_Studio201/cplex/bin/x86-64_linux/
export PATH=$PATH:/opt/ibm/ILOG/CPLEX_Studio127/cplex/bin/x86-64_linux/
export PATH=$PATH:/opt/ibm/ILOG/CPLEX_Studio129/cplex/bin/x86-64_linux/

# Export path to gurobi home folder and library
export GUROBI_HOME=/opt/gurobi1002/linux64
export PATH=$PATH:$GUROBI_HOME/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GUROBI_HOME/lib/
export GRB_LICENSE_FILE=/home/centor.ulaval.ca/coutiwal/gurobi.lic

# Export path to AMPL binary
export PATH=$PATH:/opt/AMPL
export PATH=$PATH:~/AMPL/ampl.linux-intel64/

# Export path to AMPL-API library
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/AMPL/amplapi/lib/

# Export path to ADOL-C library
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/walton/adolc_base/lib64/

# Export path to WORHP library
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/AMPL/libworhp.so
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/WORHP/worhp_1.13-2_linux/lib/
export WORHP_LICENSE_FILE=/home/centor.ulaval.ca/coutiwal/AMPL/ampl.linux-intel64/worhp.lic

# Export path to WORHP library
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/AMPL/libworhp.so

# Export path to Hexaly library
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/hexaly_13_5/bin
export PATH=$PATH:/opt/hexaly_13_5/

# Export path to OCTERACT binary
export PATH=$PATH:/opt/AMPL/octeract-engine-3.5.0/bin/

# Export path to octeract libraries
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/AMPL/octeract-engine-3.5.0/lib/

# Export Hexaly lib path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/hexaly_13_5/bin/

# Export path to WORHP parameters and license file
WORHP_PARAM_FILE=/opt/AMPL/worhp.xml
export WORHP_PARAM_FILE
WORHP_LICENSE_FILE=/opt/AMPL/worhp.lic
export WORHP_LICENSE_FILE

# Export path to the PATH solver's license
export PATH_LICENSE_STRING="2830898829&Courtesy&&&USR&45321&5_1_2021&1000&PATH&GEN&31_12_2025&0_0_0&6000&0_0"

# Set aliases
alias vpnsoton='globalprotect connect -p globalprotect2.soton.ac.uk -u wc1f19'
alias vpnsotoff='globalprotect disconnect'
alias sshsoton='ssh 152.78.41.229'
alias q-ssh='ssh walton@q-server.laser.ci.ufpb.br'
alias glider-code='cd ~/Dropbox/Univesity_of_Southampton/Doutorado/Problems/GliderRouting/Implementation/'
alias python='python3'
alias narvalconnect='ssh walton@narval.alliancecan.ca'

xrandr --newmode "1366x768_60.00" 85.50 1366 1436 1579 1792 768 771 774 798 -hsync +vsync
xrandr --addmode HDMI-A-0 "1366x768_60.00"
xrandr --output HDMI-A-0 --mode "1366x768_60.00"

#xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
#xrandr --addmode HDMI-A-0 1920x1080_60.00
#xrandr --output HDMI-A-0 --mode 1920x1080_60.00





