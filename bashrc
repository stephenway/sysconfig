# .bashrc for sysconfig

# Personal aliases and functions.

# Personal environment variables and startup programs should go in
# ~/.bash_profile.  System wide environment variables and startup
# programs are in /etc/profile.  System wide aliases and functions are
# in /etc/bashrc.

if [ -f "/etc/bashrc" ] ; then
  source /etc/bashrc
fi

# Personal aliases

# Enable sudo in aliases
alias sudo="sudo "
alias fuck='eval "sudo $(fc -ln -1)"'

# Reload Shell
alias reload="exec $SHELL -l"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"
alias ls="gls"
alias la="ls -Al"

# Directories
alias c="cd $HOME/code"
alias p="cd $HOME/projects"
alias sys="cd $HOME/.sysconfig"
alias sysconfig="cd $HOME/.sysconfig"
alias wget-dir='wget -r --no-parent --reject "index.html*"'

# Git/Hub
alias g="git"
alias gs="git status -s && git branch-status"
alias ga="git add"
alias gA="git add -A"
alias gc="git commit -v"
alias gb="git branches"
alias gd="git diff"
alias gco="git checkout"
alias gp="git push -u"
alias gP="git pull --rebase"
alias gl="git lol"
alias gcount="git shortlog -sn"
alias gexport="git archive --format zip --output"
alias flow="_git_flow"

# Vim
alias v="f -e vim" # quick opening files with vim
# alias vim="nvim"
# alias nim="nvim"

# Tmux
alias t="tmux"
alias ta="tmux attach -d"
alias ts="tmux attach -d -t"
alias tl="tmux ls"

# NPM
alias npm=prioritize-yarn
alias ni="npm install"
alias nis="npm install --save"
alias nid="npm install --save-dev"
alias nig="npm install --global"
alias nt="npm test"
alias nit="npm install && npm test"
alias nk="npm link"
alias nr="npm run"
alias nf="npm cache clean && rm -rf node_modules && npm install"
alias nu="npm clean cache; npm update; npm outdated"
alias ng="npm list -g --depth=0 2>/dev/null"
alias nl="npm list --depth=0 2>/dev/null"

# Updating
alias um="sudo softwareupdate -i -a"
alias ub="sudo pkgin update && sudo pkgin upgrade && sudo pkgin fullupgrade"
alias uv="vim +PlugUpdate +qall"
alias un="sudo npm update -g"
alias up="ub && uv && un && reset"
alias nu="npm cache clean && npm update"

# Clojure
alias fw="rlwrap lein figwheel"
alias cg="ls -d $HOME/.m2/repository/**/**/* | grep"

# Docker
# alias docker-init="eval '$(docker-machine env default)'"
# alias docker-up="docker-machine start default"

# Misc
export ENV_IP="$(ipconfig getifaddr en0)"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias flush="sudo killall -HUP mDNSResponder"
alias d.="desk ."


# Personal functions

shellopt() {
  for ARG in "$@"
  do
		shopt -s "$ARG" 2>/dev/null
  done
}

# Append to history file, don't overwrite it
shopt -s histappend

# No need to type cd (works for .. but not -, although alias -- -='cd -' fixes it)
shellopt autocd

# Use extra globbing features.
shellopt extglob

# Include dotfiles when globbing
shellopt dotglob

# Case insensitive globbing
shellopt nocaseglob

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
