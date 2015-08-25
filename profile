# Global Variables
export PS1='\[\e[0;32m\]\W\[\e[m\] $ ';
export PATH="$HOME/bin:$HOME/.rvm/bin:$PATH";
export EDITOR=vim;
export BROWSER=open;
export COMMAND_MODE=unix2003;
export NODE_ENV=development
export NODE_PATH="/usr/local/lib/node_modules";
export VIM_BINARY="/usr/local/bin/vim";
export MVIM_BINARY="/usr/local/bin/mvim";

# Traversing
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

# Shortcuts
alias la="ls -Al"
alias p="cd /mnt/Samba/Stephen/Mot/Portals"
alias p1="p"
alias p2="cd /mnt/Samba/Stephen/Hai/Portals"
alias c="cd ~/code"
alias sysconfig="cd ~/.sysconfig"
alias wget-dir='wget -r --no-parent --reject "index.html*"'

# RVM Init
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a alias*

# Sudo Aliases
alias sudo="sudo "

# Gulp
alias g="gulp"
alias gbw="gulp build-watch"

# Git/Hub
eval "$(hub alias -s)"
alias git="hub";
alias gs="git status"
alias ga="git add -A"
alias gc="git commit"
alias gb="git branch"
alias gd="git diff"
alias gco="git checkout"
alias gp="git push"
alias gl="git pull"
alias gt="git tag"
alias gm="git merge"
alias bub="GITHUB_HOST=bitbucket.com git"

if [ -f `brew --prefix`/usr/local/etc/bash_completion.d ]; then
  . `brew --prefix`/usr/local/etc/bash_completion.d
fi

# NPM
alias nin="sudo npm install --no-bin-links"
alias ng="npm list -g --depth=0 2>/dev/null"
alias nl="npm list --depth=0 2>/dev/null"

# Updating
alias um="sudo softwareupdate -i -a"
alias ub="brew update && brew upgrade --all && brew cleanup && brew doctor"
alias uv="vim +PluginUpdate +qall"
alias un="sudo npm update -g"
alias up="ub && uv && un && reset"
alias nu="npm cache clean && npm update"
alias bu="bower cache clean && bower update"

# SSH

[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;


alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias reload="exec $SHELL -l"
