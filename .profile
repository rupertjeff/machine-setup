export PATH=/usr/local/php5/bin:/usr/local/share/npm/bin:$PATH:/usr/local/mysql/bin
export EDITOR=emacs

# GIT

source ~/.git-completion.sh
source ~/.git-prompt.sh

# Prompt
black="\[\033[0;30m\]"
red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
brown="\[\033[0;33m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
cyan="\[\033[0;36m\]"
light_gray="\[\033[0;37m\]"
white="\[\033[0;38m\]"

bold_black="\[\033[1;30m\]"
bold_red="\[\033[1;31m\]"
bold_green="\[\033[1;32m\]"
bold_yellow="\[\033[1;33m\]"
bold_blue="\[\033[1;34m\]"
bold_purple="\[\033[1;35m\]"
bold_cyan="\[\033[1;36m\]"
bold_light_gray="\[\033[1;37m\]"
bold_white="\[\033[0;38m\]"

c_reset="$white"
c_time="$blue"
c_user="$bold_light_gray"
c_host="$cyan"
c_path="$light_gray"
c_git_clean="$green"
c_git_dirty="$bold_yellow"

git_prompt ()
{
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi

    git_branch=$(__git_ps1 "%s")

    if git diff --quiet 2>/dev/null >&2; then
        git_color="${c_git_clean}"
    else
        git_color="${c_git_dirty}"
    fi

    echo "[$git_color$git_branch${c_reset}]"
}

PROMPT_COMMAND='PS1="${c_time}\t${c_reset} [${c_host}Local${c_reset}] ${c_user}\u${c_reset}:${c_path}\W${c_reset} $(git_prompt)\$ "'

# End GIT

export LS_OPTIONS='--color=auto'

alias ll='ls -al'
alias lh='ls -alh'
alias jkstaging='ssh staging.jkdesign.com'
alias gitstaging='ssh git@staging.jkdesign.com'
alias ehosts='subl /etc/hosts'
