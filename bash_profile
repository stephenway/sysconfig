# .bash_profile for sysconfig

# Personal environment variables and startup programs.

# Personal aliases and functions should go in ~/.bashrc. System wide
# environment variables and startup programs are in /etc/profile.
# System wide aliases and functions are in /etc/bashrc.

pathprepend() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}

if [ -f "$HOME/.inputrc" ] ; then
  source $HOME/.inputrc
fi

if [ -f "$HOME/.bashrc" ] ; then
  source $HOME/.bashrc
fi

if [ -f "$HOME/.nvm/nvm.sh" ] ; then
  source $HOME/.nvm/nvm.sh
fi

if [ -f "$HOME/.localrc" ] ; then
  source $HOME/.localrc
fi

if [ -d "/usr/local/sbin" ] ; then
  pathprepend /usr/local/sbin
fi

if [ -d "$HOME/bin" ] ; then
  pathprepend $HOME/bin
fi

if [ -d "$HOME/.rvm/bin" ] ; then
  pathprepend $HOME/.rvm/bin
fi

if [ -d "$HOME/projects/team/scripts" ] ; then
  pathprepend $HOME/projects/team/scripts
fi

# Personal startup programs
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a alias*
eval "$(hub alias -s)"
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  if [ -f "$HOME/bash_completion.d/git-flow-completion.bash" ]; then
    source "$HOME/bash_completion.d/git-flow-completion.bash"
  fi
fi
GIT_PS1_SHOWDIRTYSTATE=true

# Personal environment variables
export PS1='\[\e[0;32m\]\W\[\e[m\]$(__git_ps1) $ ';
export EDITOR=vim;
export BROWSER=open;
export COMMAND_MODE=unix2003;
export NODE_ENV=development
export NODE_PATH="/usr/local/lib/node_modules";
export VIM_BINARY="/usr/local/bin/vim";
export MVIM_BINARY="/usr/local/bin/mvim";
export VIMRC="$HOME/.vimrc";
export DOCKER_HOST=tcp://localhost:4245
