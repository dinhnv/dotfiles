"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim man: http://vimdoc.sourceforge.net/htmldoc/help.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"


syntax on
filetype plugin indent on         " Indent and plugins by filetype

set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
set autochdir
set incsearch                     " Find as you type search
set hlsearch
set ignorecase smartcase          " Case insensitive search

" spaces over tabs
set autoindent
set smartindent
set breakindent
set smarttab
set shiftwidth=4 tabstop=4 softtabstop=4    " sw ts sts
set expandtab

set nobackup  " no backup or swap file, live dangerously
set noswapfile  " swap files give annoying warning

set splitright                    " Puts new vsplit to the right of the current
set splitbelow                    " Puts new split to the bottom of the current


set fileformats=unix,mac
set backspace=indent,eol,start    " make backspace behave in a sane manner
set hidden                        " Allow buffer switching without saving
set showbreak=↪
set listchars=tab:▶-,trail:•,extends:»,precedes:«,eol:¬

set wildmenu                      " visual autocomplete for command menu
set wildmode=list:longest,full    " <Tab> completion, list matches, then longest
set colorcolumn=80                " highlight column 81th
set scrolljump=5                  " Lines to scroll when cursor leaves screen
set scrolloff=3                   " Minimum lines to keep above and below cursor


set timeoutlen=400                " timeout on keystroking
set ttimeoutlen=0
set updatetime=1500               " Idle time to write swap
set title
set mouse=a                       " enable mouse support

" pass from system
if has('clipboard')
  " When possible use + register for copy-paste, unnamed
  set clipboard+=unnamedplus
else
  vmap <Leader>y "+y
  vmap <Leader>d "+d
  vmap <Leader>p "+p
  vmap <Leader>P "+P
  nmap <Leader>p "+p
  nmap <Leader>P "+P
endif
" map paste, yank and delete to named register so the content
" will not be overwritten
" to delete and still keep in register, use cut (c)
nnoremap x "_x
vnoremap x "_x

" indent
xnoremap < <gv
xnoremap > >gv|
nnoremap > >>_
nnoremap < <<_

" save with sudo w!!
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Quick substitute
xnoremap s :s//g<Left><Left>
nnoremap s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Fast saving using <leader> w
nnoremap <leader>w :w<CR>
vnoremap <leader>w <Esc>:w<CR>


" WINDOWS
" use fzf plugin
" split window (consisted with tmux)
nnoremap <silent> <Leader>- :call fzf#run({
      \   'down': '40%',
      \   'sink': 'split' })<CR>
" vsplit, not use `vertical botright split`
nnoremap <silent> <Leader>/ :call fzf#run({
      \   'right': winwidth('.') / 2,
      \   'sink':  'vsplit' })<CR>
" new tab
nnoremap <silent> <Leader>t :call fzf#run({
      \   'right': winwidth('.') / 2,
      \   'sink':  'tabnew' })<CR>
" tab
" nmap T :tabnew<cr>
" Buffers previous/next in normal mode
" Tab: next buffer, Shift-Tab: previous buffer
nnoremap  <silent>   <Tab>  :tabnext<CR>
nnoremap  <silent>   <S-Tab>  :tabprevious<CR>

" movement between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" resize window
nnoremap <C-left> <C-w>5>
nnoremap <C-right> <C-w>5<
nnoremap <C-up> <C-w>5+
nnoremap <C-down> <C-w>5-

" quickly close window
nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>close<CR>' : ''
" nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>bd<CR>' : ''
" end WINDOW---

" wrapped lines goes down/up to next row
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

nnoremap <leader>o :Files<CR>


" base on filetype
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2

"I don't want the docstring window to popup during completion
" set completeopt-=preview
autocmd FileType python setlocal completeopt-=preview



" plugin config
let g:python_host_prog  = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

" install plug.vim {{{
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
" }}}


" FZF
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" status line: vim-airline
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_solarized_bg='light'
" let g:airline_powerline_fonts = 1


" NerdTree
map <C-e> :NERDTreeToggle %<CR>
map <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let g:NERDTreeWinPos="left"
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1    "  delete the buffer of the file you just deleted with NerdTree
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git', '.idea', '.vscode']
" automatically close a tab if the only remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" EasyMotion
" <leader> j, k, f, l, h to navigate quickly
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_off_screen_search = 0
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>f <Plug>(easymotion-s)
map <Leader>F <Plug>(easymotion-s2)

" Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ale
"" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'javascript': ['prettier', 'eslint']
\ }

let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_flake8_use_global = 1
let g:ale_python_black_executable = g:python3_host_prog
" fucking the author, he is tenacious to change to single quote
let g:ale_python_black_options = '-m black --skip-string-normalization'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'


" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" = jedi-vim
" Usage: <leader>d : go to definition, K : check docs, <leader>n : show usage,
" <leader>r: rename
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0


" plugins
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'jonathanfilip/vim-lucius'
Plug 'lifepillar/vim-solarized8'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'  " syntax highlight
Plug 'tpope/vim-commentary' " `gc` to comment toggle, eg: gcap
" syntax checker
Plug 'dense-analysis/ale'

" code formatter
Plug 'Chiel92/vim-autoformat'

" python
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
Plug 'fisadev/vim-isort', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeToggle', 'NERDTreeFind' ] }

call plug#end()


if exists('+termguicolors')
  set termguicolors                   " true color, terminal using
endif

" colorscheme options
let iterm_profile = $ITERM_PROFILE
let &background=iterm_profile

" if iterm_profile == 'dark'
" colorscheme lucius
" LuciusDarkHighContrast
" else
colorscheme lucius
" LuciusLightHighContrast
" endif
" colorscheme solarized8
