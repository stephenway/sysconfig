# .bash_profile for sysconfig

# Personal environment variables and startup programs.

# Personal aliases and functions should go in ~/.bashrc. System wide
# environment variables and startup programs are in /etc/profile.
# System wide aliases and functions are in /etc/bashrc.

# Personal startup programs

pathprepend() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}

sourcefile() {
  for ARG in "$@"
	do
	  if [ -f "$ARG" ] ; then
		  source $ARG
		fi
	done
}

pathprepend /usr/local/sbin
pathprepend /opt/pkg/bin
pathprepend $HOME/bin
# pathprepend `yarn global bin`
sourcefile $HOME/.inputrc
sourcefile $HOME/.bashrc
sourcefile $HOME/.localrc

# SSH
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Hub
# eval "$(hub alias -s)"

# Git Completion
if [[ "$OSTYPE" == "darwin"* ]]; then
  if [ -f "$HOME/bash_completion.d/git-flow-completion.bash" ]; then
    source "$HOME/bash_completion.d/git-flow-completion.bash"
  fi
fi

# Personal environment variables

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\e[0;32m\]\w\[\033[35m\]:$(parse_git_branch)\[\e[m\] λ\[\033[00m\] '
export EDITOR=vim;
export BROWSER=open;
export COMMAND_MODE=unix2003;
export NODE_ENV=development
export NODE_PATH="/usr/local/lib/node_modules";
export VIM_BINARY="/usr/local/bin/vim";
export MVIM_BINARY="/usr/local/bin/mvim";
export VIMRC="$HOME/.vimrc";
# export DOCKER_HOST=tcp://localhost:4245
export GPG_TTY=$(tty)

