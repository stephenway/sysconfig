let g:ctrlp_max_height = 5
let g:ctrlp_dotfiles = 1
let g:ctrlp_match_window = 'order:ttb,max:15'
" let g:ctrlp_max_depth = 40

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

