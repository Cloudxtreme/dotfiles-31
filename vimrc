" Vundle and plugin setup {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin on GitHub repo
Plugin 'bling/vim-airline'
Plugin 'Tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'digitalToad/vim-jade'
Plugin 'tpope/vim-markdown'
Plugin 'Tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'mtth/scratch.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'bronson/vim-trailing-whitespace'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"}}}

" Setting {{{

"Switch syntax highlight on, when the terminal has colors
syntax on

" Set buffer modifiable
set modifiable
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
" set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual editing)
set tabstop=4

" Set softtabstop equal to shiftwidth
set softtabstop=4
" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=4

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" Turn on line numbers
set number

" Highlight tailing whitespace
set listchars=tab:▸\ ,eol:¬

" Get rid of the delay when pressing 0 (for example)
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
" set statusline=%f\ \ line:%l/%L\ %p%%\ %y
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

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

" set up the map leader
let mapleader = ","

" set up the local leader key
let maplocalleader = "\\"

" }}}

" Plugin {{{

" Colorscheme & background
set t_Co=256
colorscheme jellybeans

" Airline (status line)
let g:airline_powerline_fonts = 1

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Type <leader>lc to close Syntastic list window
nnoremap <Leader>lc :lclose<CR>

" Type <leader>le to open error list window
nnoremap <Leader>le :Errors<CR>

" Type <leader>ln to go to next error
nnoremap <leader>ln :lnext<CR>

" Type <leader>lp to go to previous error
nnoremap <leader>lp :lprev<CR>

" Type <leader>mc to do a syntast"uic manual check
nnoremap <leader>sc :SyntasticCheck<CR>

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" Disable the less checker
" let g:syntastic_less_checkers=['']

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Emmit
let g:user_emmet_leader_key='<C-A>'

" CtrlP
" Type <Leader>o to open a new file
nnoremap <Leader>o :CtrlP<CR>

" modify default opening behavior with an interactive argument <C-o>
let g:ctrlp_arg_map = 1

" Add the Silver Searcher as the backend to use the agignore with ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Toggle NERDTree
map <leader>n :NERDTreeToggle<CR>

" Markdown-syntax
" disable markdown-syntax folding
let g:vim_markdown_folding_disabled=1


" }}}

" Mappings {{{

" Searching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Switch window
nnoremap <leader>w <C-w>

" Type <leader>s to save file
nnoremap <leader>s :w<CR>

" Type <leader>q to quit  buffer
nnoremap <leader>q :q<CR>

" Get rid of  Search Highlight
nnoremap <leader><space> :noh<CR>

" Enter visual line mode with <Space><Space>
nmap <leader><leader> V

" Type 12<Enter> to go to line 12 and Hit ENTER to go to end of file
nnoremap <CR> G

"delete the current line then paste it below the one we're on now
nnoremap <leader>- ddp

"delete the current line then paste it above the one we're on now
nnoremap <leader>_ ddkP

" Edit vimrc file in a vertically split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move cursor to the begining of the line
nnoremap <s-h> 0

" Move the cursor to the end of the line
nnoremap <s-l> $

" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

" switch to normal mode
inoremap jk <esc>

" Start a new line below the current line
inoremap jo <esc>o

" Start a new line above the current line
inoremap jO <esc>O

" Move to end of line
inoremap ja <esc>A

" Map omni-completion key to Ctrl-Space
inoremap <leader>, <C-x><C-o>

" }}}

"Autocmd Settings {{{

" Start vim with NERDTree

autocmd vimenter * if !argc() | NERDTree | endif
""autocmd VimEnter * NERDTree

" Move the cursor in the editor window
""autocmd VimEnter * wincmd p
" Auto close NERDTree if it is the only window open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Folding with marker
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

set omnifunc=syntaxcomplete#Complete

" Bootstrap 3 boilerplat CDN
autocmd BufNewFile *-bst3.html 0r ~/Sites/boilerplate/bst3.html
"}}}

