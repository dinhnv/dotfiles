Plug 'sbdchd/neoformat'
" === neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" let g:neoformat_only_msg_on_error = 1
let g:neoformat_enabled_python = ['black']
let g:neoformat_python_black = {
            \ 'exe': $PYENV_ROOT . '/versions/neovim3/bin/black'
            \ }


Plug 'benekastah/neomake'
"" === neomake
call neomake#configure#automake('w')
let g:neomake_open_list = 2

let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
  \ 'exe': $PYENV_ROOT . '/versions/neovim3/bin/flake8'
\ }
