# Utility
#alias reload='source ~/dotfiles/bash/aliases'

# vim
alias v='vim ~/.vimrc'

# cd
alias .='pwd'
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias cdd='cd -'

function take() {
  mkdir -p "$1"
  cd "$1"
}
# rm
alias rm='rm -rfi'

# for github
alias wgets="wget --no-check-certificate "

# file manager
alias n="nautilus"

# grep
if which ack-grep 1>/dev/null
then
  alias ack="ack-grep"
fi
alias grep='grep --color=auto'
#alias g="find . -type f |xargs grep --color=auto --exclude=\*.svn\* -n 2> /dev/null "
alias g="find * |xargs grep --color=auto --exclude=\*.svn\* -n 2> /dev/null "
alias f="find . -name"

#history
alias h="history"

# ls
alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout '
alias go='git checkout '
alias gb='git branch'
alias gs='git status'
alias gst='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gg="gitg&"
#alias gae="for i in $(find . -type d -regex ``./[^.].*'' -empty); do touch $i\"/.gitignore\"; done;"
# fat fingers
alias got='git '
alias get='git '

# Setup a tracking branch from [remote] [branch_name]
function gbt() {
  git branch --track $2 $1/$2 && git checkout $2
}

# Processes
alias k9="killall -9"
function killnamed () { 
    ps ax | grep $1 | cut -d ' ' -f 2 | xargs kill 
}


# Show what is taking up space
alias diskspace="du -S | sort -n -r |more"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

# Easy archive extraction
e () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
  *.tar.gz)    tar xvzf $1    ;;
  *.bz2)       bunzip2 $1     ;;
  *.rar)       unrar x $1       ;;
  *.gz)        gunzip $1      ;;
  *.tar)       tar xvf $1     ;;
  *.tbz2)      tar xvjf $1    ;;
  *.tgz)       tar xvzf $1    ;;
  *.zip)       unzip $1       ;;
  *.Z)         uncompress $1  ;;
  *.7z)        7z x $1        ;;
  *)           echo "don't know how to extract '$1'..." ;;
  esac
  else
    echo "'$1' is not a valid file!"
      fi
}
alias xtract="e"

t () {
	tar czvf $1.tar.gz $2
}
