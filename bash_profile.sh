# export PATH=/usr/local/bin:$PATH

# MacPorts Installer addition on 2011-06-22_at_17:47:31: adding an appropriate PATH variable for use with MacPorts.
export PATH=./bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# default editor
export EDITOR=mate
export GEM_OPEN_EDITOR=mate

export CLICOLOR=1
# export LSCOLORS=gxfxaxdxcxegedabagacad
# export LSCOLORS=dxfxcxdxbxegedabagacad

# cursor setting
# ►
export PS1='\[\e[1;32;40m\]\w\$ \[\e[4;31;0m\]► \[\e[00m\]'
# export PS1="\[\e[1;32;40m\]\w\$(parse_git_branch)\e[4;31;0m\] ► \e[0m"
# export PS1="\[\e[32;1m\]\w> \[\e[0m\]\$(parse_git_branch)"
# export PS1='\[\e[1;36m\]\u@\h:\[\e[22m\]\w\[\e[1m\]\$ \[\e[00m\]'

# set vi mode
# set -o vi

# GWF
alias ssh-wall="ssh -D 7070 zhenoverthewall@sky.sshchina.com"
alias gwf="ssh -D 7070 app@asics2-draft.theplant-dev.com"
# Ack Settings
alias Rack="ack --type=ruby"
# System Settings
alias c="clear"
# alias ls="ls -G"
alias back="cd -"
# Rvm Settings
# [[ -s "/Users/zhenwu/.rvm/scripts/rvm" ]] && source "/Users/zhenwu/.rvm/scripts/rvm"
alias rvm8="rvm 1.8.7"
alias rvm9="rvm 1.9.2-p290"
# For Van
alias tousa="cd /Users/hzu/Code/ssh && ./sshgfw"
alias mate-bash="mate /Users/hzu/.bash_profile"
alias tovan="cd /Users/hzu/Code/Van"
alias towrepo="cd /Users/hzu/Code/Wando"
# alias towando2="cd /Users/hzu/Code/Van/wando2/rails"
alias sbash="source ~/.bash_profile"
# For Rails
alias towando2="tovan && cd wando2/rails"
alias mate-wando2="towando2 && mate ."
alias towando="tovan && cd Wando3"
alias tocf="tovan && cd cf"
alias wconsole="towando && rails c"
alias wserver="towando && rails s -u"
alias wsd="wserver -d"
alias mate-wando="towando && mate ."
alias dump_wando="towando && mysqldump -uroot -p wando3_production > temp.sql"
alias load_wando="towando && mysql -uroot -p wando3_production < temp.sql"
alias bg_rails="rails s 1>/dev/null &"
function bg_wando {
    cd /Users/hzu/Code/Van/Wando3
    bg_rails
    cd -
}
# For apache
alias apache-restart="sudo apachectl restart"
alias apache-start="sudo apachectl start"
alias apache-stop="sudo apachectl stop"
# App Shortcuts
alias chrome="open -a google\ chrome"
# Bundle Exec Rake
alias bx="bundle exec"
alias bxthor="bundle exec thor"
alias bxrake="bundle exec rake"
# GIT
alias ts="tig status"
alias t="tig"
alias gb="git branch"
alias gbr="git branch -r"
alias gpl="git pull"
alias gph="git push"
alias gc="git commit -m"
alias grc='git rebase --continue'

# source git command completion shell
# source "/Users/zhenwu/.git-completion.sh"

##
# Your previous /Users/zhenwu/.bash_profile file was backed up as /Users/zhenwu/.bash_profile.macports-saved_2011-06-22_at_17:47:31
##

# Functions
function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "-("${ref#refs/heads/}")";
}

function mate_curl {
    curl $1 | mate
}

function killwsd {
    kill $(cat ~/Code/Van/Wando3/tmp/pids/server.pid)
}

function xmate {
    mate $(paths $*)
}

function xto {
    cd $(paths $*)
}

function new_title {
    echo -n -e "\033]0;$1\007"
}

function up {
    number=0
    up_path=''
    if [[ -z $1 ]]; then set 1; fi
    while [ $number -lt $1 ]; do
        up_path+='../'
        number=$((number + 1))
    done
    cd $up_path
}

# Redmine Backup
function backup_redmine {
    backup_path=/Volumes/server/Redmine_Backup/redmine_for_wando_backup/`date +%y_%m_%d`
    mkdir $backup_path
    echo -e "\033[32mBackup Database"
    mysqldump -u root -p redmine_for_wando | gzip > $backup_path/sql.gz
    echo -e "\033[32mBackup Files"
    rsync -a ~/Code/redmine_for_wando/files $backup_path
    echo -e "\033[32mBackup Success"
}

# For RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
