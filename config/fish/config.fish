# Functions
function um; sudo softwareupdate -i -a; end
function ub; brew update; brew upgrade --all; brew cleanup; brew doctor; end
function uv; vim +PluginInstall +qall; end
function un; sudo npm update -g; end
function up; ub; uv; un; reset; end

function nu; npm cache clean; npm update; end
function bu; bower cache clean; bower update; end

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function ..;    cd ..; end
function c; cd ~/code; end
function sysconfig; cd ~/.sysconfig; end
function gin; git init; git add .; git commit -m "It begins."; git create -d "$argv"; git push origin master; end

# Variables
set -gx PATH
set -gx PATH $PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin $HOME/bin

set -gx fish_greeting ''
set -gx EDITOR vim
set -gx COMMAND_MODE unix2003
set -gx NODE_PATH "/usr/local/lib/node_modules"
set -gx VIM_BINARY "/usr/local/bin/vim"
set -x MVIM_BINARY "/usr/local/bin/mvim"

set BROWSER open

# Start SSH agent
setenv SSH_ENV $HOME/.ssh/environment
start_agent

# Custom
alias reload '. ~/.config/fish/config.fish'
alias git hub
alias g hub
alias gst 'git status'

