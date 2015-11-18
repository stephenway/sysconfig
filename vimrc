" don't bother with vi compatibility
set nocompatible

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
call plug#begin('~/.vim/bundle')

" install bundles

Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMixed'] }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch', { 'on': ['Compiler', 'Make', 'Dispatch', 'Focus', 'Start', 'Copen'] }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession', { 'on': 'Obsess' }
Plug 'tpope/vim-pastie', { 'on': 'Pastie' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/matchit.zip'

" templating
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'hbs' }

" javascript
Plug 'pangloss/vim-javascript', { 'for': 'js' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }

" css
Plug 'stephenway/postcss.vim', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

" clojure
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }

call plug#end()

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
set eol
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
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
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

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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
autocmd BufRead,BufNewFile *.md set filetype=markdown textwidth=80
autocmd BufRead,BufNewFile *.md set spell
" ejs is html
au BufNewFile,BufRead *.ejs set filetype=html
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"check html
map ,h5 :!html5check %<CR>

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
nnoremap <Leader>m :CtrlPBufTag<cr>
nnoremap <C-m> :m .+1<cr>==
nnoremap <C-i> :m .-2<cr>==
vnoremap > >gv
vnoremap < <gv
nmap <silent> <S-H> ^
nmap <silent> <S-L> $
nnoremap <leader>R :so $HOME/.vimrc<cr>

" sass
augroup filetype_scss
  au FileType scss,css setlocal foldmethod=marker
  au FileType scss,css setlocal foldmarker={,}

  " Sort all rules in current selector
  au BufNewFile,BufRead *.scss,*.css nnoremap <buffer> <leader>s ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

  " Easy Bracket Return
  au BufNewFile,BufRead *.scss,*.css inoremap <buffer> {<cr> {}<left><cr><tab>.<cr><esc>kA<bs>

  " Convert 1 line selector to multiline
  " au BufNewFile,BufRead *.scss,*.css nnoremap <buffer> <leader>c /{<cr>jji<cr><space><space><esc>/}<cr>i<bs><cr><esc>jO
augroup END

autocmd FileType scss set iskeyword+=-

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
autocmd BufEnter harp.json let b:dispatch = 'gulp'
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
nnoremap <Leader>S :Gstatus<cr>
nnoremap <Leader>P :Git push<cr>
nnoremap <Leader>L :Git pull<cr>

