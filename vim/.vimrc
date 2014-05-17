" 檔案編碼
set encoding=utf-8
set fileencodings=utf-8,cp950
" 編輯喜好設定

" pathgen
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#incubate()
call pathogen#helptags()


syntax enable
syntax on        " 語法上色顯示
set nocompatible " VIM 不使用和 VI 相容的模式
" set ai           " 自動縮排
set shiftwidth=4 " 設定縮排寬度 = 4
set tabstop=4    " tab 的字元數
set softtabstop=4
set expandtab   " 用 space 代替 tab
set list         "show tab and end of line in vim
set listchars=tab:>.,eol:$
set ruler        " 顯示右下角設定值
set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫
set ru           " 第幾行第幾個字
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  " 設定 smartindent
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
set cursorline   " 顯示目前的游標位置
 
set laststatus=2
set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]
" setup spelling check"
set spell spelllang=en_us

set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans = 1
colorscheme solarized

filetype plugin on 
filetype on                 " enables filetype detection
filetype plugin indent on   " enables filetype specific plugins
 
augroup filetypedetect
 au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END 
" build the whole project with f8
" map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" map vim command p with pgvy, where gv: reselect what was originally
" selected. y to copy it again.
xnoremap p pgvy

set guifont=Monaco\ for\ Powerline
"let g:Powerline_symbols = 'fancy'
let g:NERDTreeWinSize = 60

let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_csharp_server_port = 2000

"noremap <leader>o <Esc>:CommandT<CR>
"noremap <leader>O <Esc>:CommandTFlush<CR>
"noremap <leader>m <Esc>:CommandTBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
