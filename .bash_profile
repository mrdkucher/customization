# get current branch name (git)
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# enable directory and file coloring highlighting
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[34m\]\w\[\033[33m\]\$(parse_git_branch) \[\033[m\]\$ "
export PS1="\[\033[34m\]\w \[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=exfxbxdxcxexexhxhxhxhx
alias ls='ls -Gh'

# no duplicates in history
export HISTCONTROL=ignoreboth

# Alias for raspi
alias pi_ssh='ssh pi@192.168.0.25'

# VIMINIT to source .vim/.vimrc so that .vimrc is not in home directory
export VIMINIT='source ~/.vim/.vimrc'
