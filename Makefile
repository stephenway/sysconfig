# SYSCONFIG INSTALL
# -------------------------------------

.DEFAULT_GOAL := all
CONFIG    := ${PWD}

symlinks = bash_profile \
	bashrc \
	bin \
	editorconfig \
	eslintrc \
	gitconfig \
	gitignore_global \
	gvimrc \
	inputrc \
	jshintrc \
	ssh/config \
	tmux \
	tmux.conf \
	vimrc \

nvim:
	ln -s ~/.vim ~/.config/nvim
	ln -s ~/.vimrc ~/.config/nvim/init.vim

.PHONY: $(symlinks)

directories = bash_completion.d \
	ssh/ \
	vim/bundle/ \

.PHONY: $(directories)

COLOR = \033[32;01m
NO_COLOR = \033[0m

all: setup install

help:
	@echo "                                                     .d888 d8b          "
	@echo "                                                    d88P'  Y8P          "
	@echo "                                                    888                 "
	@echo ".d8888b  888  888 .d8888b   .d8888b .d88b.  88888b.  888888 888  .d88b.  "
	@echo "88K      888  888 88K      d88P'   d88''88b 888 '88b 888    888 d88P'88b "
	@echo "'Y8888b. 888  888 'Y8888b. 888     888  888 888  888 888    888 888  888 "
	@echo "     X88 Y88b 888      X88 Y88b.   Y88..88P 888  888 888    888 Y88b 888 "
	@echo " 88888P'  'Y88888  88888P'  'Y8888P 'Y88P'  888  888 888    888  'Y88888 "
	@echo "              888                                                    888 "
	@echo "         Y8b d88P                                               Y8b d88P "
	@echo "          'Y88P'                                                 'Y88P' "
	@echo
	@echo "   $(COLOR)make install$(NO_COLOR)		Install symlinks"
	@echo
	@echo "   $(COLOR)make setup$(NO_COLOR)		Install directories"
	@echo
	@echo "   $(COLOR)make check-dead$(NO_COLOR)	Find dead symlinks"
	@echo "   $(COLOR)make clean-dead$(NO_COLOR)	Delete dead symlinks"
	@echo "   $(COLOR)make update$(NO_COLOR)		Update sysconfig"
	@echo
	@echo "   $(COLOR)make all$(NO_COLOR)		Setup and install"

setup: $(directories)
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qa

$(directories):
	mkdir -p ~/.$@

install: $(symlinks)
	$(CONFIG)/brew.sh
	$(CONFIG)/npm.sh

$(symlinks):
	test -e $(CONFIG)/$@ && ln -sfn $(CONFIG)/$@ ~/.$@

check-dead:
	find ~ -maxdepth 1 -name '.*' -type l -exec test ! -e {} \; -print

clean-dead:
	find ~ -maxdepth 1 -name '.*' -type l -exec test ! -e {} \; -delete

update:
	git pull --rebase
