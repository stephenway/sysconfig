# Local Configuration
set -l local_conf_file ~/.config/fish/local.fish
if test -f $local_conf_file
    . $local_conf_file
end

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
set -gx PATH $PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin $HOME/.bin

set fish_greeting
set -x EDITOR vim
set -gx COMMAND_MODE unix2003
set -gx NODE_PATH "/usr/local/lib/node_modules"
set -gx VIM_BINARY "/usr/local/bin/vim"
set -x MVIM_BINARY "/usr/local/bin/mvim"

set BROWSER open

# git prompt config
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showupstream verbose
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_dirtystate red

# Start SSH agent
setenv SSH_ENV $HOME/.ssh/environment
start_agent

# Custom
alias reload '. ~/.config/fish/config.fish'
alias git hub
alias g hub
alias gst 'git status'

