" don't bother with vi compatibility
set nocompatible

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" install Vundle bundles
Plugin 'gmarik/vundle'
Plugin 'airblade/vim-gitgutter'
Plugin 'chriskempson/base16-vim'
Plugin 'austintaylor/vim-indentobject'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'juvenn/mustache.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nono/vim-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-pastie'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vividchalk'
Plugin 'eventualbuddha/vim-protobuf'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/greplace.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-obsession'
Plugin 'ahdinosaur-os/npm.vim'
Plugin 'mxw/vim-jsx'

call vundle#end()

" enable syntax highlighting
syntax enable
set background=dark
colorscheme base16-default

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" settings
set nocursorline " don't highlight current line
set nowrap
set linebreak
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set fillchars+=vert:.

" keyboard shortcuts
inoremap jj <ESC>
nnoremap <Space> za
vnoremap <Space> za
nnoremap <leader>z zMzvzz
nnoremap <Leader>m :CtrlPBufTag<CR>
nnoremap <C-m> :m .+1<CR>==
nnoremap <C-i> :m .-2<CR>==
vnoremap > >gv
vnoremap < <gv
nmap <silent> <S-H> ^
nmap <silent> <S-L> $

" sass
augroup filetype_scss
  au FileType scss,css setlocal foldmethod=marker
  au FileType scss,css setlocal foldmarker={,}
  au BufNewFile,BufRead *.scss,*.css nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
  au BufNewFile,BufRead *.scss,*.css inoremap <buffer> {<cr> {}<left><cr><tab>.<cr><esc>kA<bs>
augroup END
" json
au BufRead,BufNewFile *.json set filetype=json

" highlight search
set hlsearch
nmap <leader>hl :let @/ = ""<CR>

" Disambiguate ,a & ,t from the Align plugin, making them fast again.
"
" This section is here to prevent AlignMaps from adding a bunch of mappings
" that interfere with the very-common ,a and ,t mappings. This will get run
" at every startup to remove the AlignMaps for the *next* vim startup.
"
" If you do want the AlignMaps mappings, remove this section, remove
" ~/.vim/bundle/Align, and re-run rake in maximum-awesome.
function! s:RemoveConflictingAlignMaps()
  if exists("g:loaded_AlignMapsPlugin")
    AlignMapsClean
  endif
endfunction
command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
silent! autocmd VimEnter * RemoveConflictingAlignMaps

" Syntastic should use bash shell for fish users
set shell=/usr/local/bin/bash
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" statusline
set statusline=                                 " Override default
set statusline+=\ %f\ %m\ %r                    " Show filename/path
set statusline+=%{fugitive#statusline()[4:-2]}  " Show fugitive git info
set statusline+=%=                              " Set right-side status info after this line
set statusline+=%l/%L:%v                        " Set <line number>/<total lines>:<column>
set statusline+=\                               " Set ending space
hi StatusLine ctermfg=6 ctermbg=10 guifg=#6c71c4 guibg=#073642
hi treeDir guifg=#6c71c4 guibg=#073642
hi VertSplit ctermbg=0 ctermfg=0
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git'

" NERDTree
" Close if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeHighlightCursorline=1

highlight LineNr cterm=bold ctermfg=14

" Dispatch
nnoremap <Leader>f :FocusDispatch<space>''<left>
nnoremap <Leader>F :FocusDispatch!<cr>
nnoremap <Leader>l :Copen<cr>
nnoremap <Leader>L :Copen!<cr>
nnoremap <Leader>r :wa<cr>:Dispatch<cr>
nnoremap <Leader>R :wa<cr>:Dispatch!<cr>
autocmd BufEnter Gulpfile let b:dispatch = 'gulp dev'
autocmd BufEnter Gruntfile let b:dispatch = 'grunt dev'
autocmd FileType go let b:dispatch = 'go test'
autocmd FileType haskell let b:dispatch = 'cabal test --show-details=always'
autocmd FileType make let b:dispatch = 'make'
autocmd FileType sh let b:dispatch = 'make'
autocmd BufEnter *.bats compiler bats
autocmd BufEnter *.bats let b:dispatch = 'bats --tap %'
autocmd BufEnter *.gemspec let b:dispatch = 'bundle'
autocmd BufEnter *_spec.rb let b:dispatch = 'bundle exec rspec --format progress %'
autocmd BufEnter *_test.coffee let b:dispatch = 'npm test'
autocmd BufEnter *_test.js let b:dispatch = 'npm test'
autocmd BufEnter *_test.rb let b:dispatch = 'bundle exec testrb %'
autocmd BufEnter Gemfile let b:dispatch = 'bundle'
autocmd BufEnter webpack.*.js let b:dispatch = 'npm start'

" Fugitive
nnoremap <Leader>W :Gwrite<cr>
nnoremap <Leader>C :Gcommit<cr>
nnoremap <Leader>P :Git<space>push<cr>
nnoremap <Leader>L :Git<space>pull<cr>
