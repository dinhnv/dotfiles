"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @author: dinhnv
" @email:  dinhnv.mr@gmail.com
"
" vim man: http://vimdoc.sourceforge.net/htmldoc/help.html
"
" https://github.com/sittim/configs/blob/master/.config/nvim/init.vim
" https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
" https://github.com/zenbro/dotfiles/blob/master/.nvimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let iterm_profile = $ITERM_PROFILE

" hack for tmux
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum


set nocompatible

let g:python_host_prog  = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

" plug.vim {{{
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
" }}}

" plugins {{{
call plug#begin(expand('~/.config/nvim/plugged'))

" UI/Color
Plug 'ayu-theme/ayu-vim'
Plug 'romainl/flattened'
Plug 'mhartington/oceanic-next'
Plug 'trevordmiller/nova-vim'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'jonathanfilip/vim-lucius'
" Plug 'chriskempson/base16-vim'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'

" utils
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object' " i (indent): ai, ii
Plug 'vim-scripts/argtextobj.vim' " a (argument): aa, ia
Plug 'vim-scripts/gitignore' " a (argument): aa, ia
" Plug 'tweekmonster/braceless.vim'

" navigation
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeToggle', 'NERDTreeFind' ] }
Plug 'majutsushi/tagbar', { 'on': [ 'TagbarToggle' ]}
Plug 'christoomey/vim-tmux-navigator'

" [programming]
" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'  " syntax highlight
Plug 'tpope/vim-commentary' " `gc` to comment toggle, eg: gcap
Plug 'mattn/emmet-vim'

" syntax checker
Plug 'dense-analysis/ale'

" code formatter
Plug 'Chiel92/vim-autoformat'

" python
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
Plug 'fisadev/vim-isort', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

call plug#end()
" }}}

" vim general {{{
syntax on
filetype plugin indent on         " Indent and plugins by filetype
scriptencoding=utf-8
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set noswapfile
set nobackup
set shiftround                    " round indent to a multiple of 'shiftwidth'
set splitright                    " Puts new vsplit to the right of the current
set splitbelow                    " Puts new split to the bottom of the current
" set relativenumber                " disable to speedup vim
set number                        " show current line instead of 0
set noruler                       " show current column
set showcmd                       " show command in bottom bar
set cursorline                    " highlight current line
set wildmenu                      " visual autocomplete for command menu
set showmatch                     " highlight matching bracket, [
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

set wildmode=list:longest,full    " <Tab> completion, list matches, then longest
set colorcolumn=80                " highlight column 81th
set scrolljump=5                  " Lines to scroll when cursor leaves screen
ret scrolloff=3                   " Minimum lines to keep above and below cursor
set fileformats=unix,mac
set backspace=indent,eol,start    " make backspace behave in a sane manner
set hidden                        " Allow buffer switching without saving
set showbreak=↪
" set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:¬
set listchars=tab:▶-,trail:•,extends:»,precedes:«,eol:¬
highlight NonText ctermfg=16 guifg=#4a4a59
highlight SpecialKey ctermfg=16 guifg=#4a4a59
highlight Normal ctermbg=NONE guibg=NONE
set list
set nowrap                        " do not wrap long lines
set timeoutlen=400                " timeout on keystroking
set ttimeoutlen=0
set updatetime=1500               " Idle time to write swap
set title
set mouse=a                       " enable mouse support

if has('folding')
  set foldlevelstart=10
  set foldmethod=indent
  set foldnestmax=10              " deepest fold is 10 levels
endif

if has('clipboard')
  " When possible use + register for copy-paste, unnamed
  set clipboard+=unnamedplus
else
  vmap <Leader>y "+y
  vmap <Leader>d "+d
  nmap <Leader>p "+p
  nmap <Leader>P "+P
  vmap <Leader>p "+p
  vmap <Leader>P "+P
endif

set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,
      \.git/*,.bzr/*,.hg/*,.svn/*,
      \.DS_Store,__MACOSX/*,Thumbs.db,
      \sass-cache/*,.cache/*,.tmp/*,*.scssc,
      \node_modules/*,jspm_modules/*,bower_components/*,__pycache__/*,
      \*/coverage/*,
      \*/dist/*

setlocal keywordprg=:help
set gcr=a:blinkon0
set tags=~/.vimtags
" }}}

" key binding {{{

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" yank [cursor -> end of line], to be consistent with C and D.
nnoremap Y y$
" paste without cutting, multiple times
vnoremap p "_dP
" Go to last Paste
noremap gp `[v`]
" Select all text
noremap vA ggVG

" indenting
xnoremap < <gv
xnoremap > >gv|
nnoremap > >>_
nnoremap < <<_
vnoremap <Tab> >gv|
vnoremap <S-Tab> <gv

" move visual block
vnoremap . :norm.<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Buffers previous/next in normal mode
" Tab: next buffer, Shift-Tab: previous buffer
nnoremap  <silent>   <Tab>  :bn<CR>
nnoremap  <silent>   <S-Tab>  :bp<CR>

" Window resize
nnoremap <C-Left> <C-w>5>
nnoremap <C-Right> <C-w>5<
nnoremap <C-Up> <C-w>5+
nnoremap <C-Down> <C-w>5-

" Keep search results at the center of screen
" n: to go next matched result
" N: go previous
" *: match current word under cursor to next
" #: match current word under cursor to previous
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" wrapped lines goes down/up to next row
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" Toggle highlight search research
nmap <silent> <leader>h :set hlsearch!<CR>

"Navigation in command line, mix vim and emacs(terminal style)
cnoremap <C-j> <Left>
cnoremap <C-k> <Right>
cnoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <C-w>

" Tabs
nnoremap <silent> t0 :<C-u>tabfirst<CR>
nnoremap <silent> t$ :<C-u>tablast<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>

" Duplicate lines <lead>d
" normal map may confict with jedi-vim goto mapping
nnoremap <leader>d m`YP``
vnoremap <leader>d YPgv

" Fold
" zM: close all folds (m: more)
" zC: close all folds under cursor recursively
" zR: open all folds (r: reduce)
" zO: open all folds under cursor recursively
" Focus the current fold by closing all others
" z<enter> to fold others
" zr to unfold all
nnoremap z<CR> zMzr

" Windows
" nnoremap  [Window]   <Nop>
" nmap      s [Window]
nnoremap <silent> [Window]s  :<C-u>split<CR>
nnoremap <silent> [Window]v  :<C-u>vsplit<CR>
noremap <silent> [Window]z  :<C-u>only<CR>
nnoremap <silent> [Window]x  :<C-u>call <SID>BufferEmpty()<CR>
" Split current buffer
nnoremap <silent> [Window]bs :split<CR>:wincmd p<CR>:e#<CR>
nnoremap <silent> [Window]bv :vsplit<CR>:wincmd p<CR>:e#<CR>
function! s:BufferEmpty()
  let l:current = bufnr('%')
  if ! getbufvar(l:current, '&modified')
    enew
    silent! execute 'bdelete '.l:current
  endif
endfunction

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
" save with sudo w!!
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Quick substitute
xnoremap s :s//g<Left><Left>
nnoremap s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Fast saving using <leader> w
nnoremap <leader>w :w<CR>
vnoremap <leader>w <Esc>:w<CR>

" macro, use Q instead of q
nnoremap Q q
" quickly close window
" nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>close<CR>' : ''
nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>bd<CR>' : ''

" reload
nnoremap <leader>r :set autoread <cr> :checkt <cr>

" misspellings
cnoreabbrev qw wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd

" cmd
" navigate like emacs
cnoremap <C-j> <Left>
cnoremap <C-k> <Right>
cnoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <C-w>

" base on filetype
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2

"I don't want the docstring window to popup during completion
" set completeopt-=preview
autocmd FileType python setlocal completeopt-=preview


" }}}

" colorscheme {{{
if exists('+termguicolors')
  set termguicolors                   " true color, terminal using
endif

" let g:lucius_contrast='low'
" let g:gruvbox_invert_selection = 0
" let g:lucius_high_contrast = 1
" let g:lucius_style = iterm_profile
" let g:lucius_no_term_bg = 0
let &background=iterm_profile
if iterm_profile == 'dark'
  colorscheme lucius
  LuciusDarkHighContrast
else
  colorscheme lucius
  LuciusLightHighContrast
endif

" }}}

" === Plugins config {{{
" vim-airline
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_solarized_bg='dark'
" let g:airline_powerline_fonts = 1

" indentLine
" visual between indent levels
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_setConceal = 0     " prevent from hiding markdown or json symbol, like ```
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Plug 'junegunn/vim-easy-align'
let g:easy_align_ignore_comment = 0
" visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" fzf {{{
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nmap <leader>h<leader> :Commands<CR>
" open, use Tab, S-Tab to select/deselect multiple files
nnoremap <leader>o :Files<CR>
" project
nnoremap <leader>p :GitFiles --cached --others<CR>
nnoremap <leader>e :Files %:p:h<CR>
nnoremap <leader>b :Buffers<CR>
imap <C-f> <plug>(fzf-complete-line)
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

" consisted with tmux
" <leader>- split
nnoremap <silent> <Leader>- :call fzf#run({
      \   'down': '40%',
      \   'sink': 'split' })<CR>
" vsplit, not use `vertical botright split`
nnoremap <silent> <Leader>/ :call fzf#run({
      \   'right': winwidth('.') / 2,
      \   'sink':  'vsplit' })<CR>

" / saved for split window
"nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
vnoremap <silent> <leader>/ :call SearchVisualSelectionWithAg()<CR>
function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction
" }}} end fzf

" === NerdTree
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

" === EasyMotion
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

" Plug 'majutsushi/tagbar'
" <leader> t to open the symbols bar
nmap <F8>   :TagbarToggle<CR>

" isort
let g:vim_isort_map = '<C-i>'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" === ale
"let g:ale_sign_info = 'i'
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '-'
" let g:ale_use_global_executables = 1
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_flake8_use_global = 1
let g:ale_python_black_executable = g:python3_host_prog
" fucking the author, he is tenacious to change to single quote
let g:ale_python_black_options = '-m black --skip-string-normalization'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'javascript': ['prettier', 'eslint']
\ }

" === jedi-vim
" Usage: <leader>d : go to definition, K : check docs, <leader>n : show usage,
" <leader>r: rename
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
" let g:jedi#use_splits_not_buffers = "right"

" }}}

" vim: ts=2 sw=0 tw=80 foldmarker={,}
