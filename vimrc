" .vimrc for sysconfig

" Personal plugins and settings.

" Know what every line does, and remove what you do not. The less you add to
" this file, the more you will begin to understand how vi works. If you see a
" plugin, search how you can do the same thing in vi without plugins first.

" turn off vi compatibility
set nocompatible

" use jk insteadk of escape
inoremap jk <ESC>

" leader is space
let mapleader = "\<space>"

" configure plugin manager
filetype off

" install plugins
call plug#begin('~/.vim/bundle')
Plug 'chriskempson/base16-vim'
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote'
Plug 'mjakl/vim-asciidoc'
Plug 'stephenway/postcss.vim'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-salve'
Plug 'kien/rainbow_parentheses.vim'
call plug#end()

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

" enable syntax highlighting
syntax enable
set background=dark
colorscheme base16-default

" setup basic encoding
if !has('nvim')
        set encoding=utf-8
endif

" no folds
let g:vim_asciidoc_folding_disabled=0

" set spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType clojure setlocal ts=2 sts=2 sw=2 expandtab
let g:clojure_fuzzy_indent_patterns = ['.']

" don't put an extra space after a period with j commands
set nojoinspaces

augroup textobj_quote
  autocmd!
  autocmd FileType asciidoc call textobj#quote#init()
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

call textobj#user#plugin('css', {
                        \   'code': {
                        \     'pattern': ['{', '}'],
                        \     'select-a': 'aP',
                        \     'select-i': 'iP',
                        \   },
                        \ })

" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

" setup clojure rainbow highlighting

au VimEnter * RainbowParenthesesToggle
au Syntax clojure RainbowParenthesesLoadRound
" au Syntax clojure RainbowParenthesesLoadSquare
" au Syntax clojure RainbowParenthesesLoadBraces

" Enable basic mouse behavior such as resizing buffers.
if exists('$TMUX')  " Support resizing in tmux
        if !has('nvim')
          set ttymouse=xterm2
        endif
endif

cabbrev tq tabclose<CR>

" leader commands
nnoremap <Leader>w :w<CR>
nmap <Leader><Leader> V
nnoremap <Leader>/ 0i/*<Space><Esc>A<Space>*/<Esc>0<CR>
nnoremap <Leader>' %s/"\([^']*\)"/'\1'/g
