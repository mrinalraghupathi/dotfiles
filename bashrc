export TERM=xterm-256color

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f $HOME/share/git-completion.bash ]; then
	source $HOME/share/git-completion.bash
fi
# My modifications to the bash configuration file

# Colors

Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White

# Bold
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White

Plain='\[\e[0m\]'
NO_COLOUR=$Plain
function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]"; }

# set a fancy prompt
export PS1="$BCyan\u@\h $BPurple\W $BRed\$${NO_COLOUR} "
# export PS1="$BCyan\u@\h \w > $Plain"

CLICOLOR=1
LSCOLORS=ExExcxdxBxcgcdabagacad

export CLICOLOR LSCOLORS

#System
CABALDIR=Library/Haskell/bin
export EDITOR=/usr/bin/vim
export PATH=/Users/mrinal/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/texbin:/usr/X11/bin:/opt/bin:/opt/local/bin:$HOME/$CABALDIR:/Library/Frameworks/Python.framework/Versions/2.7/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/go/bin:/opt/gae_go:/opt/_gae_go

#Servers
export VUMATH=mrinalr@www.math.vanderbilt.edu
export ARTEMIS=mrinal@artemis.math.vanderbilt.edu
export ATHENA=mrinal@athena.math.vanderbilt.edu
export UH=mrinal@ssh.math.uh.edu
export UHWEB=$UH:servers/www/
export USNA=raghupat@www.usna.edu
export APPMATHWEB=raghupat@www.usna.edu:web/teaching/12s/233
export TEACHING=$HOME/teaching/12f
export APPMATH=$HOME/teaching/12s/233
export CALCWEB=raghupat@www.usna.edu:web/teaching/12s/221
export CALC=$HOME/teaching/13f/1431
export SIGPROC=$TEACHING/450
export LA=$TEACHING/361
CHAUV=chauvmatraghm-a
export OFFICE=mrinal@$CHAUV.academy.usna.edu
export OFFICELOCAL=mrinal@$CHAUV.local 


#Google Go
# export GOROOT=/usr/local/go
# export GOOS=macosx
# export GOARCH=amd64
export GOPATH=$HOME/code/go
#Python
export PYTHONSTARTUP=/home/mrinal/.pystartup
export PYTHONPATH=/home/mrinal/lib/python:$HOME/code/py

# Create aliases
alias ls='ls -GF'
alias ll='ls -Gl'
alias la='ls -A'
alias lc='ls -G'

eval `opam config env`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# OPAM configuration
. /Users/mrinal/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export HADOOP_INSTALL=$HOME/bigdata/hadoop/hadoop-2.2.0
export PATH=$PATH:$HADOOP_INSTALL/bin
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
