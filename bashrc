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

# Sometimes you just need a quick solution
alias fuck='eval "sudo $(fc -ln -1)"'

# Reload Shell
alias reload="exec $SHELL -l"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias la="ls -Al"

# Directories
alias c="cd $HOME/code"
alias sys="cd $HOME/.sysconfig"
alias sysconfig="cd $HOME/.sysconfig"
alias wget-dir='wget -r --no-parent --reject "index.html*"'

# Git
alias g="git"
alias hotfix="HUSKY_SKIP_HOOKS=1 git commit -m"

# Vim
alias v="f -e vim" # quick opening files with vim

# Tmux

t() {
  if [[ $1 == "a" ]]; then
    command tmux attach -d "$2"
  elif [[ $1 == "s" ]]; then
    command tmux attach -d -t "$2"
  elif [[ $@ == "l" ]]; then
    command tmux ls
  else
    command tmux "$@"
  fi
}

# NPM

n() {
  if [[ $1 == "i" ]]; then
    command npm install "$2"
  elif [[ $1 == "s" ]]; then
    command npm install --save "$2"
  elif [[ $1 == "d" ]]; then
    command npm install --save-dev "$2"
  elif [[ $1 == "g" ]]; then
    command npm install --global "$2"
  elif [[ $1 == "r" ]]; then
    command npm run "$2"
  elif [[ $1 == "rs" ]]; then
    command npm run start"$2"
  elif [[ $@ == "t" ]]; then
    command npm test
  elif [[ $@ == "l" ]]; then
    command npm run lint
  elif [[ $1 == "o" ]]; then
    command npm outdated "$2"
  elif [[ $@ == "c" ]]; then
    command rm -rf node_modules && npm install
  elif [[ $@ == "u" ]]; then
    command npm update && npm outdated
  elif [[ $@ == "ll" ]]; then
    command npm list --depth=0 2>/dev/null
  elif [[ $@ == "lg" ]]; then
    command npm list -g --depth=0 2>/dev/null
  else
    command npm "$@"
  fi
}

# Updating
alias um="sudo softwareupdate -i -a"
alias ub="sudo pkgin update && sudo pkgin upgrade && sudo pkgin fullupgrade"
alias uv="vim +PlugUpdate +qall"
alias un="sudo npm update -g"
alias up="ub && uv && un && reset"
alias nu="npm cache clean && npm update"

# Misc
export ENV_IP="$(ipconfig getifaddr en0)"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias flush="sudo killall -HUP mDNSResponder"

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
shopt -s autocd

# Include dotfiles when globbing
shopt -s dotglob

# Use extra globbing features.
shopt -s extglob

# Case insensitive globbing
shopt -s nocaseglob

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

find-up () {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

cdnvm(){
    cd "$@";
    nvm_path=$(find-up .nvmrc | tr -d '\n')

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version;
        default_version=$(nvm version default);

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [[ $default_version == "N/A" ]]; then
            nvm alias default node;
            default_version=$(nvm version default);
        fi

        # If the current version is not the default version, set it to use the default version
        if [[ $(nvm current) != "$default_version" ]]; then
            nvm use default;
        fi

        elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
        declare nvm_version
        nvm_version=$(<"$nvm_path"/.nvmrc)

        declare locally_resolved_nvm_version
        # `nvm ls` will check all locally-available versions
        # If there are multiple matching versions, take the latest one
        # Remove the `->` and `*` characters and spaces
        # `locally_resolved_nvm_version` will be `N/A` if no local versions are found
        locally_resolved_nvm_version=$(nvm ls --no-colors "$nvm_version" | tail -1 | tr -d '\->*' | tr -d '[:space:]')

        # If it is not already installed, install it
        # `nvm install` will implicitly use the newly-installed version
        if [[ "$locally_resolved_nvm_version" == "N/A" ]]; then
            nvm install "$nvm_version";
        elif [[ $(nvm current) != "$locally_resolved_nvm_version" ]]; then
            nvm use "$nvm_version";
        fi
    fi
}
alias cd='cdnvm'

