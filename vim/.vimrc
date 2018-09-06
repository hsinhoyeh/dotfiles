"config file encoding"
set encoding=utf-8
set fileencodings=utf-8,cp950

" pathgen
call pathogen#infect()
call pathogen#infect('bundle/{}')
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

"set background=dark
set background=light
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

au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent smarttab fileformat=unix
au BufNewFile,BufRead *.js set tabstop=2 softtabstop=2 shiftwidth=2

" build the whole project with f8
map <F8> :!cscope_gen .<CR>
" trigger tagbar with f7
map <F7> :TagbarToggle<CR>

let g:tagbar_usearrows = 1

" default python location for powerline
set rtp+=/Users/hsinhoyeh/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set laststatus=2
set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]

set guifont=Monaco\ \ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'

let g:NERDTreeWinSize = 60
nnoremap <silent> <F5> :NERDTree<CR>
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

"config tagbar for golang"
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }"

" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'"

" config syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_python_checkers = ['pylint']
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0 "disable loc_list pop out
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:go_list_type = "quickfix"

" configure python-mode
let g:pymode_lint_options_pep8 =
    \ {'max_line_length': 160}
let g:pymode_lint_on_write = 0
let g:pymode_folding = 0
let g:pymode_syntax_all = 0
let g:pymode_syntax = 0

let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0

" ycm setting
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 0

" js setting
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:syntastic_javascript_checkers=['eslint']

