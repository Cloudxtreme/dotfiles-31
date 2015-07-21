" Setting {{{

"Switch syntax highlight on, when the terminal has colors
syntax on

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

"Search"
" Incremental Searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" When substitute, all match in a line is substituted instead of one
set gdefault


" A buffer is marked as 'hidden' if it has unsaved changes, and it is not
" currently loaded in a window. If you try to quit Vim while there are hidden
" buffers you will raise an error: E162: No write since last change for buffer
" "a.txt"
"set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual editing)
set tabstop=2

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2

" Turn on line numbers
set number

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:<

" Get rid of the delay when pressing 0 (for example)
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ \ line:%l/%L\ %p%%\ %y

" Hide the toolbar
set guioptions-=T

" UTF encoding
set fileencoding=utf-8
set encoding=utf-8

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Visual autocomplete for command menu
set wildmenu

" Ensure vim doesn't beep at you everyt time you make a mistype
set visualbell

" Highlight the current line
set cursorline

" Redraw only when need to (i.e. don't redraw when executing a macro)
set lazyredraw

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Set build-in file system explorer to use layout similar to the NERDTree
" plugin
let g:netrw_liststyle=3

" Always highlight column 80 so it's easier to see where cutoff appears on
" longer screen

"autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
"set colorcolumn=80

" }}}

" Plugin {{{
call pathogen#infect()
Helptags
filetype plugin indent on " required by Pathogen Plugin Manager

" Colorscheme & background
set t_Co=256
set background=light
colorscheme spacegray

" Airline (status line)
let g:airline_powerline_fonts = 1

" CtrlP

" }}}

" Mappings {{{

" set up the map leader
let mapleader = ","

" set up the local leader key
let maplocalleader = "\\"

" Toggle NERDTree
map <leader>n :NERDTreeToggle<CR>

" Searching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Get rid of  Search Highlight
nnoremap <leader><space> :noh<CR>

" Switch window
nnoremap <leader>w <C-w>

"delete the current line then paste it below the one we're on now
nnoremap <leader>- ddp

"delete the current line then paste it above the one we're on now
nnoremap <leader>_ ddkP

"convert the current word to uppercase and move the cursor to the next word
nnoremap <leader>u viw<s-u><s-w>

" Edit vimrc file in a vertically split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

"Add double quotes to seleted word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

"add single quotes to selected word
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Move cursor to the begining of the line
nnoremap <s-h> 0

" Move the cursor to the end of the line
nnoremap <s-l> $

"Insert Mode Mapping
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i

" switch to normal mode
inoremap jk <esc>

" Start a new line below the current line
inoremap jo <esc>o

" Move to end of line
inoremap ja <esc>A

"delete the current line
inoremap <leader>d <esc>ddi

"convert the current word to uppercase and move the cursor to next word
inoremap <leader>u <esc>lviw<s-u><s-w>i

" }}}

"Autocmd Settings {{{

" Start vim with NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

" Folding with marker
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

" Bootstrap 3 boilerplat CDN
autocmd BufNewFile *-bst3.html 0r ~/Sites/boilerplate/bst3.html

"}}}
