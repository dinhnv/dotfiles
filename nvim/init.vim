"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim man: http://vimdoc.sourceforge.net/htmldoc/help.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"


let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" ┌─────────┐
" │ Plugins │
" └─────────┘

call plug#begin(expand('~/.config/nvim/plugged'))

" ui/theme
Plug 'jonathanfilip/vim-lucius'
Plug 'lifepillar/vim-solarized8'
Plug 'tomasr/molokai'
" icons
Plug 'ryanoasis/vim-devicons'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" `gc` to code comment toggle, eg: gcap
Plug 'tpope/vim-commentary'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Syntax Highlighting And Indentation For 100+ Languages
Plug 'sheerun/vim-polyglot'
" code formatter
" Plug 'Chiel92/vim-autoformat'

" python
"Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
Plug 'fisadev/vim-isort', { 'for': 'python' }
"Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" navigation
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree', { 'on':  [ 'NERDTreeToggle', 'NERDTreeFind' ] }

call plug#end()

set pyxversion=3

let g:python_host_prog  = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'


" ┌──────────┐
" │ Settings │
" └──────────┘
syntax on
filetype plugin indent on         " Indent and plugins by filetype

set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
" set autochdir
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

" Better display for messages
" set cmdheight=2
set wildmenu                      " visual autocomplete for command menu
set wildmode=list:longest,full    " <Tab> completion, list matches, then longest
set colorcolumn=80                " highlight column 81th
set scrolljump=5                  " Lines to scroll when cursor leaves screen
set scrolloff=3                   " Minimum lines to keep above and below cursor


set timeoutlen=400                " timeout on keystroking
set ttimeoutlen=0
set updatetime=300               " Idle time to write swap
set title
set mouse=a                       " enable mouse support
" don't give |ins-completion-menu| messages.
set shortmess+=c
"set signcolumn=yes

if has('folding')
  set foldlevelstart=10
  set foldmethod=indent
  set foldnestmax=10              " deepest fold is 10 levels
endif


" ┌──────────────┐
" │ Key Mappings │
" └──────────────┘

" Fold
" zM: close all folds (m: more)
" zC: close all folds under cursor recursively
" zR: open all folds (r: reduce)
" zO: open all folds under cursor recursively
" Focus the current fold by closing all others
" z<enter> to fold others
" zr to unfold all
nnoremap z<CR> zMzr

" pass from system
if has('clipboard')
  " When possible use + register for copy-paste, unnamed
  set clipboard+=unnamedplus
else
  vmap <leader>y "+y
  vmap <leader>d "+d
  vmap <leader>p "+p
  vmap <leader>P "+P
  nmap <leader>p "+p
  nmap <leader>P "+P
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
nnoremap <silent> <leader>- :call fzf#run({
      \   'down': '40%',
      \   'sink': 'split' })<CR>
" vsplit, not use `vertical botright split`
nnoremap <silent> <leader>/ :call fzf#run({
      \   'right': winwidth('.') / 2,
      \   'sink':  'vsplit' })<CR>
" new tab
nnoremap <silent> <leader>t :call fzf#run({
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
" autocmd FileType python setlocal completeopt-=preview


" ┌──────────────────────────┐
" │ Plugin Config & Mappings │
" └──────────────────────────┘

if exists('+termguicolors')
  set termguicolors                   " true color, terminal using
endif

" colorscheme options
let iterm_profile = $ITERM_PROFILE
let &background=iterm_profile

" if iterm_profile == 'dark'
" colorscheme lucius
" LuciusDarkHighContrast
" endif
let g:molokai_original = 1
colorscheme molokai


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
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
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
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>f <Plug>(easymotion-s)
map <leader>F <Plug>(easymotion-s2)

" Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" coc.nvim
let g:coc_global_extensions = ["coc-css",
            \ "coc-eslint",
            \ "coc-html",
            \ "coc-json",
            \ "coc-prettier",
            \ "coc-python",
            \ "coc-tsserver",
            \ "coc-vetur"]
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>r <Plug>(coc-rename)

" navigate diagnostics
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

