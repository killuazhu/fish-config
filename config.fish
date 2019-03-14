# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/killua/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# migrating from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh

# Aliases
alias g='git'
#compdef g=git
alias gst='git status'
#compdef _git gst=git-status
alias gd='git diff'
#compdef _git gd=git-diff
alias gdc='git diff --cached'
#compdef _git gdc=git-diff
alias gl='git pull'
#compdef _git gl=git-pull
alias gup='git pull --rebase'
#compdef _git gup=git-fetch
alias gp='git push'
#compdef _git gp=git-push
alias gd='git diff'

#Kubectl
alias k='kubectl'

function gdv
  git diff -w $argv | view -
end

#compdef _git gdv=git-diff
alias gc='git commit -v'
#compdef _git gc=git-commit
alias gc!='git commit -v --amend'
#compdef _git gc!=git-commit
alias gca='git commit -v -a'
#compdef _git gc=git-commit
alias gca!='git commit -v -a --amend'
#compdef _git gca!=git-commit
alias gcmsg='git commit -m'
#compdef _git gcmsg=git-commit
alias gco='git checkout'
#compdef _git gco=git-checkout
alias gcb='git checkout -b'
#compdef _git gco=git-checkout
alias gcm='git checkout master'
alias gr='git remote'
#compdef _git gr=git-remote
alias grv='git remote -v'
#compdef _git grv=git-remote
alias grmv='git remote rename'
#compdef _git grmv=git-remote
alias grrm='git remote remove'
#compdef _git grrm=git-remote
alias grset='git remote set-url'
#compdef _git grset=git-remote
alias grup='git remote update'
#compdef _git grset=git-remote
alias grbi='git rebase -i'
#compdef _git grbi=git-rebase
alias grbc='git rebase --continue'
#compdef _git grbc=git-rebase
alias grba='git rebase --abort'
#compdef _git grba=git-rebase
alias gb='git branch'
#compdef _git gb=git-branch
alias gba='git branch -a'
#compdef _git gba=git-branch
alias gcount='git shortlog -sn'
#compdef gcount=git
alias gcl='git config --list'
alias gcp='git cherry-pick'
#compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=10'
#compdef _git glg=git-log
alias glgg='git log --graph --max-count=10'
#compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all'
#compdef _git glgga=git-log
alias glo='git log --oneline'
#compdef _git glo=git-log
alias gss='git status -s'
#compdef _git gss=git-status
alias ga='git add'
#compdef _git ga=git-add
alias gm='git merge'
#compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard; and git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

#remove the gf alias
#alias gf='git ls-files | grep'

alias gpoat='git push origin --all; and git push origin --tags'
alias gmt='git mergetool --no-prompt'
#compdef _git gm=git-mergetool

alias gg='git gui citool'
alias gga='git gui citool --amend'
alias gk='gitk --all --branches'

alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd (git rev-parse --show-toplevel or echo ".")'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit; and git push github master:svntrunk'
#compdef git-svn-dcommit-push=git

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo ref | sed s-refs/heads--
end

function current_repository
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo (git remote -v | cut -d':' -f 2)
end

# these aliases take advantage of the previous function
alias ggpull='git pull origin (current_branch)'
#compdef ggpull=git
alias ggpur='git pull --rebase origin (current_branch)'
#compdef ggpur=git
alias ggpush='git push origin (current_branch)'
#compdef ggpush=git
alias ggpnp='git pull origin (current_branch); and git push origin (current_branch)'
#compdef ggpnp=git

# Pretty log messages
function _git_log_prettily
  if ! [ -z $1 ]; then
    git log --pretty=$1
  end
end

alias glp="_git_log_prettily"
#compdef _git glp=git-log

# Work In Progress (wip)
# These features allow to pause a branch development and switch to another one (wip)
# When you want to go back to work, just unwip it
#
# This function return a warning if the current branch is a wip
function work_in_progress
  if git log -n 1 | grep -q -c wip; then
    echo "WIP!!"
  end
end

# these alias commit and uncomit wip branches
alias gwip='git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "wip"'
alias gunwip='git log -n 1 | grep -q -c wip; and git reset HEAD~1'

# More alias
alias cat='bat'

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/Users/killua/Library/Python/2.7/bin" $fish_user_paths
set -g fish_user_paths "/Users/killua/Library/Python/3.7/bin" $fish_user_paths
set -g fish_user_paths "/Users/killua/workspace/go/bin" $fish_user_paths
# set -g fish_user_paths "/Users/killua/bin/softlayer-scripts" $fish_user_paths
# set -g fish_user_paths "/Users/killua/workspace/github.pub/ansible-helper" $fish_user_paths
# set -g fish_user_paths "/usr/local/bin/ciocssp_tools" $fish_user_paths
# set -g fish_user_paths "/Users/killua/workspace/ww/github-softlayer/bin" $fish_user_paths
# set -g fish_user_paths "/Users/killua/Downloads/apache-jmeter-3.2/bin" $fish_user_paths

# add virtual fish https://github.com/adambrenecki/virtualfish
# eval (python -m virtualfish)
# eval (python3 -m virtualfish auto_activation global_requirements)

# Add go env
set -g -x GOPATH ~/workspace/go

# Setup GPG agent
# gpg-agent --daemon --enable-ssh-support --write-env-file $HOME/.gpg-agent-info
pgrep gpg-agent > /dev/null or gpg-agent --daemon

if test -e "$HOME/.gpg-agent-info"
     set arrayName (cat "$HOME/.gpg-agent-info")
     for line in $arrayName
         set environment_var (echo $line | cut -d'=' -f1)
         set environment_val (echo $line | cut -d'=' -f2)
         set -x $environment_var $environment_val
    end
end

set -x GPG_TTY (tty)

# Set alias for cloud
# alias gcloud-bash="docker run --rm -ti --volumes-from gcloud-config google/cloud-sdk bash"
# alias gcloud="docker run --rm -ti --volumes-from gcloud-config google/cloud-sdk gcloud"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/killua/Downloads/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/killua/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/killua/Downloads/google-cloud-sdk/path.fish.inc'; end; end

# Add iterm2 shell integration
source ~/.iterm2_shell_integration.(basename $SHELL)

# Add go path
set -gx PATH /usr/local/go/bin $PATH

# Enable pyenv shim and autocompletion
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
