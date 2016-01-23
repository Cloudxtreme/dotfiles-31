" Vim-plug setup {{{

" let vim-plug manage my Plugins
call plug#begin('~/.vim/bundle') "Set the plugins path

" Utilities
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'severin-lemaignan/vim-minimap'

" Editing
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-repeat'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mtth/scratch.vim'
Plug 'Tpope/vim-commentary'
Plug 'Tpope/vim-surround'
" Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Git Helpers
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Syntax
Plug 'digitalToad/vim-jade'
Plug 'othree/html5.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'tmux-plugins/vim-tmux' "Add Tmux syntax highlight
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'elzr/vim-json'
Plug 'othree/javascript-libraries-syntax.vim'



" Vim Themes and Icons
Plug 'bling/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/rainbow_parentheses.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'nanotech/jellybeans.vim'

call plug#end() " required/end of plugins loading

"}}}

" Setting {{{

"Switch syntax highlight on, when the terminal has colors
filetype plugin indent on    " required
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
set history=200

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
set hidden

" Turn word wrap off
" set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Set tab size in spaces (this is for manual editing)
set tabstop=2

" Set softtabstop equal to shiftwidth
set softtabstop=2
" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2


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

" UTF encoding
set fileencoding=utf-8
if !has('nvim')
  set encoding=utf-8
endif

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
set wildmode=full

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

" set up the map leader
let mapleader = ","

" set up the local leader key
let maplocalleader = "\\"

" Set syntax complete function on
set omnifunc=syntaxcomplete#Complete

" Set python interpreter
let g:python_host_prog = '/usr/bin/python'

" Auto load file when changes detected
set autoread
" }}}

" Colorscheme & background {{{

set t_Co=256
set background=dark
colorscheme jellybeans "hybrid_reverse
let g:enable_bold_font = 1 " set some code to be bold
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Nerd\ Font\ Complete:h15 "set gui powerline font

"Set gui vim
if has('gui_running')
  set guioptions-=T " Hide toolbar in GUI vim
endif

" }}}

" Plugins Options {{{

""""""""""""""""""""""""
"  RainbowParentheses  "
""""""""""""""""""""""""

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""
"  Airline  "
"""""""""""""

let g:airline_powerline_fonts = 1 "use powerline font
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1



" Tabline part of vim-airline

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>x :bp <BAR> bd #<CR>
" This replaes :tabnew which I used to bind to this mapping
nmap <leader>n :enew<cr>
" Move to the next buffer
nmap <leader>, :bnext<CR>
" Move to the previous buffer
nmap <leader>. :bprevious<CR>

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

""""""""""""""
"  Fugitive  "
""""""""""""""

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>

"""""""""""""""
"  Syntastic  "
"""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Close Syntastic list window
nnoremap <Leader>lc :lclose<CR>

" Open error list window
nnoremap <Leader>le :Errors<CR>

" Go to next error
nnoremap <leader>ln :lnext<CR>

" Go to previous error
nnoremap <leader>lp :lprev<CR>

" Do a syntastic manual check
nnoremap <leader>sc :SyntasticCheck<CR>

" Better interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" Disable the less checker
let g:syntastic_less_checkers=['']

""""""""""""
"  Tagbar  "
""""""""""""

nmap <F8> :TagbarToggle<CR>

"""""""""""
"  Emmet  "
"""""""""""

" Remap <C-y>
" let g:user_emmet_leader_key='e'
imap   <leader>,   <plug>(emmet-expand-abbr)

let g:user_emmet_install_global = 0
autocmd FileType html,css,ejs EmmetInstall

"""""""""""
"  CtrlP  "
"""""""""""

" modify default opening behavior with an interactive argument <C-o>
let g:ctrlp_arg_map = 1

" Add the Silver Searcher as the backend to use the agignore with ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

""""""""""""""
"  NERDTree  "
""""""""""""""

" Toggle NERDTree
map <leader>t :NERDTreeToggle<CR>
" let g:NERDTreeWinPos = "right"

""""""""""""""
"  Markdown  "
""""""""""""""

" disable markdown-syntax folding
let g:vim_markdown_folding_disabled=1

"""""""""""""""
"  UltiSnips  "
"""""""""""""""

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" }}}

" Mappings {{{
" Delete everything is the buffer and enter insert mode
nnoremap <leader>d gg<S-v><S-g>c
imap <leader>d <esc>gg<S-v><S-g>c

" Fix for C-h conflic in Neovim
if has('nvim')
  nmap <BS> <C-W>h
endif

" Searching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Double tab 'v' to visual-line mode
nnoremap vv V
" Remap Ctrl-W
nnoremap <leader>w <C-w>

" Switch window
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Quickly resize vertical window
map - <C-W>-
map + <C-W>+
" Quickly increase/decrease the width of the window
map <F7> <C-W><
map <F9> <C-W>>

" Type <leader>s to save file
nnoremap <leader>s :w<CR>
inoremap <leader>s <esc>:w<CR>

" Type <leader>q to quit  buffer
nnoremap <leader>q :q<CR>
nnoremap <leader>aq :wqa<CR>

" Buffer mappings
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Open the current buffer window in a new tab
nnoremap tt :tab split<CR>
" Move the current window to a new tab
nnoremap TT <C-w>T

"Tab Mapping with Cmd Key
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-0> :tablast<CR>

" Indentation mapping
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Get rid of  Search Highlight
nnoremap <leader><space> :noh<CR>

" Type 12<Enter> to go to line 12 and Hit ENTER to go to end of file
nnoremap <CR> G

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

" Move behind next letter in insert mode
inoremap jl <esc>2li

" move up one line and indent
inoremap kk <esc>kA<CR>

" Map omni-completion key to Ctrl-Space
inoremap <leader>x <C-x><C-o>

" Copy to system clipboard in visual mode.
vnoremap <C-c> "*y

" Paste from the system clipboard to vim in insert mode
nnoremap <leader>v "*pa
inoremap <leader>v <C-r><C-p>*

" quick access to the register
nnoremap <leader>r :reg<CR>
inoremap <leader>r <esc>:reg<CR>

" quick set the filetype to less
nnoremap <leader>less :setfiletype less<CR>

" Command Mapping
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Move cursor up or down in insert mode
inoremap <C-j> <C-g>j
inoremap <C-k> <C-g>k

" Mapping F4 to execute javascript in nodejs;
" map <F4> :call RunJavascript() <CR>
" function RunJavascript()
"   exec "! node %"
" endfunction

" }}}

"Autocmd Settings {{{
if has("autocmd")
    " Start vim with NERDTree
    autocmd vimenter * if !argc() | NERDTree | endif
    " Move the cursor in the editor window
    ""autocmd VimEnter * wincmd p
    " Auto close NERDTree if it is the only window open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    " Folding with marker
    autocmd BufRead * setlocal foldmethod=marker
    autocmd BufRead * normal zM

    " Customisations based on house-style
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab relativenumber
    autocmd FileType json setlocal ts=2 sts=2 sw=2 noexpandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss, *.atom setfiletype xml

    " Bootstrap 3 boilerplat CDN
    autocmd BufNewFile *-bst3.html 0r ~/Sites/boilerplate/bst3.html
endif
"}}}

"Functions {{{

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

"Strip Trailing spaces

" Hit <F2> to strip trailing spaces.
nnoremap <silent> <F2> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Delete blank lines
nnoremap <F3> :g/^$/d<CR>

