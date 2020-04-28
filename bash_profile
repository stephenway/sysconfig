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
pathprepend /usr/local/opt/python@2/libexec/bin
pathprepend /opt/pkg/bin
pathprepend $HOME/.bin
pathprepend $HOME/.yarn/bin
pathprepend $HOME/.config/yarn/global/node_modules/.bin
pathprepend $HOME/Library/Android/sdk/platform-tools
sourcefile $HOME/.inputrc
sourcefile $HOME/.bashrc
sourcefile $HOME/.localrc

## SSH tab completion for hostnames based on config
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

## Autojump
[[ -s "/opt/pkg/share/autojump/autojump.sh" ]] && . /opt/pkg/share/autojump/autojump.sh
[[ -s "/opt/pkg/share/autojump/autojump.bash" ]] && . /opt/pkg/share/autojump/autojump.bash

## Git Flow Completion
source $HOME/.sysconfig/bash_completion.d/git-completion.bash
source $HOME/.sysconfig/bash_completion.d/git-flow-completion.bash
export GH_LOGIN=stephenway

# Personal environment variables

## Bash
GIT_PS1_SHOWDIRTYSTATE=true
export COMMAND_MODE=unix2003;
export BROWSER=open;
export PKGIN_PREFIX="/opt/pkg";
export ZOPFLI="$PKGIN_PREFIX/bin/zopfli";

## Bash Git Prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

## Vim
export EDITOR=vim;
export VIM_BINARY="/usr/local/bin/vim";
export MVIM_BINARY="/usr/local/bin/mvim";
export VIMRC="$HOME/.vimrc";

## Node
export NODE_ENV="development";
export NODE_PATH="/usr/local/lib/node_modules";

## GPG Keys 
export GPG_TTY=$(tty)

eval $(/usr/libexec/path_helper -s)

export PS1="\h \$ "

## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [[ -f .nvmrc && -r .nvmrc ]]; then
  nvm use --silent
fi

## iTerm Integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

function iterm2_print_user_vars() {
  iterm2_set_user_var phpVersion $(php -v | awk '/^PHP/ { print $2 }')
  iterm2_set_user_var rubyVersion $(ruby -v | awk '{ print $2 }')
  iterm2_set_user_var nodeVersion $(node -v)
}
