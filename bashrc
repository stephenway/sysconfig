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

# Reload Shell
alias reload="exec $SHELL -l"

# Directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd $HOME"
alias -- -="cd -"
alias la="ls -Al"
alias c="cd $HOME/code"
alias p="cd $HOME/projects"
alias sysconfig="cd $HOME/.sysconfig"
alias wget-dir='wget -r --no-parent --reject "index.html*"'

# Fasd
if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(fasd --init auto)"
  alias a='fasd -a'        # any
  alias s='fasd -si'       # show / search / select
  alias d='fasd -d'        # directory
  alias f='fasd -f'        # file
  alias sd='fasd -sid'     # interactive directory selection
  alias sf='fasd -sif'     # interactive file selection
  alias z='fasd_cd -d'     # cd, same functionality as j in autojump
  alias zz='fasd_cd -d -i' # cd with interactive selection
fi

# Gulp
alias g="gulp"
alias gbw="gulp build-watch"

# Git/Hub
alias git="hub"
alias gss="git status"
alias gs="git status -s"
alias gsa="git-multi-status"
alias ga="git add"
alias gA="git add -A"
alias gaa="git add ."
alias gcl="git clone"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gcom="git commit"
alias gb="git branches"
alias gba="git branch -a"
alias gdel="git branch -D"
alias gd="git diff"
alias gdd="git diff --cached"
alias gdw="git diff --color-words"
alias gdt="git difftool"
alias gco="git checkout"
alias gup="git fetch && git rebase"
alias gp="git push"
alias gpa="git push --all"
alias gpo="git push -u origin"
alias gpp="git pull --rebase && git push"
alias gP="git pull --rebase"
alias gl="git lol"
alias gt="git tag"
alias gm="git merge"
alias gmu="git fetch origin -v; git fetch upstream -v; git merge upstream/master"
alias gcount="git shortlog -sn"
alias gcp="git cherry-pick"
alias gexport="git archive --format zip --output"
alias bub="GITHUB_HOST=bitbucket.com git"

# Vim
alias v="f -e vim" # quick opening files with vim
alias vim="nvim"
alias nim="nvim"

# Tmux
alias t="tmux"
alias ta="tmux attach -d"
alias ts="tmux attach -d -t"
alias tl="tmux ls"

# NPM
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
alias ub="brew update && brew upgrade --all && brew cleanup && brew doctor"
alias uv="vim +PlugUpdate +qall"
alias un="sudo npm update -g"
alias up="ub && uv && un && reset"
alias nu="npm cache clean && npm update"
alias bu="bower cache clean && bower update"

# Clojure
alias fw="rlwrap lein figwheel"
alias cg="ls -d $HOME/.m2/repository/**/**/* | grep"

# Docker
# alias docker-init="eval '$(docker-machine env default)'"
# alias docker-up="docker-machine start default"

# Misc
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias flush="sudo killall -HUP mDNSResponder"
alias d.="desk ."

# Personal functions

# Git Prompt Logic
function parse_git_dirty() {
[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "+"
}
 
function parse_git_branch() {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

