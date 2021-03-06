alias fuck='$(thefuck $(fc -ln -1))'
alias ntm='fuck'

BLACK="\[\033[0;30m\]"      # black
RED="\[\033[0;31m\]"        # red
GREEN="\[\033[0;32m\]"      # green
YELLOW="\[\033[0;33m\]"     # yellow
BLUE="\[\033[0;34m\]"       # blue
MAGENTA="\[\033[0;35m\]"    # magenta
CYAN="\[\033[0;36m\]"       # cyan
LIGHT_GREY="\[\033[0;37m\]" # light grey
DARK_GREY="\[\033[1;30m\]"  # dark grey
WHITE="\[\033[1;37m\]"      # white
COLOR_OFF="\[\033[0m\]"     # off

export CLICOLOR="1"
export PS1="$CYAN‽$RED\$(prompt_last_retval_if_failed)$COLOR_OFF$MAGENTA\$(prompt_path)$YELLOW\$(prompt_git_branch)$COLOR_OFF\$ "

function prompt_last_retval_if_failed {
    local RET=$?
    if [ $RET -ne 0 ]; then
        echo "($RET) "
    fi
}

function prompt_path {
    if [ $HOME = `pwd` ]; then
        echo '~'
    else
        basename `pwd`
    fi
}

function prompt_git_branch {
    branch=`git branch 2> /dev/null | grep -E '^\*' | sed "s/\* //"`

    if [ ! -z "$branch" ]; then
        if [ "$branch" = "(no branch)" ]; then
            echo " $branch"
        else
            dirty=`git status -s 2> /dev/null`

            if [ ! -z "$dirty" ]; then
                dirty='*'
            fi
            echo " ($branch$dirty)"
        fi
    fi
}

prompt_git_branch

#[[ $- == *i* ]] && . /Users/ash/git/git-prompt/git-prompt.sh

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
