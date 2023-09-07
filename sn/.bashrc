# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
# get current branch name (git)
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# enable directory and file coloring highlighting
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[34m\]\w\[\033[33m\]\$(parse_git_branch) \[\033[m\]\$ "
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[34m\]\w \[\033[m\]\$ "
export CLICOLOR=1
#export LS_COLORS=exfxbxdxcxexexhxhxhxhx
export LS_COLORS="di=34:ln=36:so=31:pi=33:ex=32:bd=34:cd=34:su=37:sg=37:tw=37:ow=37"
alias ls='ls --color=auto -Gh'

# no duplicates in history
export HISTCONTROL=ignoreboth

# VIMINIT to source .vim/.vimrc so that .vimrc is not in home directory
export VIMINIT='source ~/.vim/.vimrc'

export GIT_EDITOR=vim

# enable horizontal scrolling in `less` by default
alias less='less -SR'

# Only include directories for cd autocomplete
complete -d cd

# List file permissions as Octal:
alias lsperm='stat -c '\''%a'\'

alias setup-sshd='pushd ~/etc && ./setup_sshd.sh && ./save_env.sh && popd'

# alias tmux so color scheme is correct
alias tmux='tmux -2'


# Print size of all dirs, and sort in ascending order
dusort() {
    if [[ $# != 0 ]]; then
        pushd $1
    fi

    du -h -d 1 ./ | sort -h

    if [[ $# != 0 ]]; then
        popd
    fi
}

# LS dir and sort based on timestamp
lsort() {
    if [[ $# != 0 ]]; then
        # if not valid dir, then exit
        pushd $1 || return $?
    fi

    echo "YYYY/MM/DD | HH:MM |     SIZE | NAME"
    echo "============================================================================================================="
    find . -maxdepth 1 -printf "%TY/%Tm/%Td | %TH:%TM | %k | %h/%f\n" | numfmt --field=5 --to=iec --from-unit=1000 --padding 8 --suffix=B | sort -h

    if [[ $# != 0 ]]; then
        popd
    fi
}

alias watch='watch -n 0.5 --'
alias clip='xclip -sel clip'

# bash git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# rsync working directory on AWS back here with some catches:
# -l to follow symbolic links
# -r for recursive
# -z for zipped
# -h for human-readable file sizes
# -v for verbose
# --exclude pycache, out, dist as unnecessary files
# --exclude batch because it's a symbolic link outside of sambaflow!
# --exclude functional.py because we need to add a line only for the conda env on AWS
# Rsync scratch software to import/snvm-sc-scratch1/davidku/software 
alias sync_software='\rsync -rzvhl SRC DST'

# SRC Env file in docker container
if [ ! -z "${SSH_CLIENT}" ] && ([ ! -z "${DOCKER_TAG}" ] || [ "${PWD}" == "/opt/software" ]); then
    set -a; source /opt/software/.vscode/env.txt; set +a
fi
