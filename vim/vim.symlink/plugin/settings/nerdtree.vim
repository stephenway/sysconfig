map <Leader>n :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 25
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

function! ShowFileInNERDTree()
  if exists("t:NERDTreeBufName")
    NERDTreeFind
  else
    NERDTree
    wincmd 1
    NERDTreeFind
  endif
endfunction
map <leader>f :call ShowFileInNERDTree()<cr>
