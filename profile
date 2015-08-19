export EDITOR=vim
export PS1='\[\e[0;32m\]\W\[\e[m\] $ '
export NODE_ENV=development

export PATH="$PATH:$HOME/bin:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval "$(hub alias -s)"

alias bub="GITHUB_HOST=bitbucket.com git"

alias p="cd /mnt/Samba/Stephen/Mot/Portals"
alias p1="p"
alias p2="cd /mnt/Samba/Stephen/Hai/Portals"
