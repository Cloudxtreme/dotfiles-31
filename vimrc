" Vim-plug setup {{{

"""""""""" VUNDEL SETTINGS START""""""""""""""""
" set nocompatible              " be iMproved, required
" filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'

""""""""""""VUNDLE SETTINGS ENDS""""""""""""""""

" let vim-plug manage my Plugins
call plug#begin('~/.vim/bundle')

" plugin on GitHub repo
Plug 'bling/vim-airline'
Plug 'Tpope/vim-commentary'
Plug 'Tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'kien/ctrlp.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mtth/scratch.vim'
Plug 'easymotion/vim-easymotion'

" Git Helpers
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" New Plugins to study
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'othree/html5.vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'severin-lemaignan/vim-minimap'

" Syntax Highlight
Plug 'digitalToad/vim-jade'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'

" Vim Themes and Icons
"Plug 'nanotech/jellybeans.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ryanoasis/vim-devicons'
" Plug 'ajh17/Spacegray.vim'
" Plug '29decibel/codeschool-vim-theme'
" Plug 'chriskempson/vim-tomorrow-theme'


" All of your Plugins must be added before the following line
call plug#end() " required

" call vundle#end()            " required

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

" Always highlight column 80 so it's easier to see where cutoff appears on
" longer screen

"autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
"set colorcolumn=80

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
colorscheme hybrid_reverse
let g:enable_bold_font = 1 " set some code to be bold

" Set gui vim font
if has('gui_running')
  set guioptions-=T " Hide toolbar in GUI vim
  set guifont=Sauce\ Code\ Powerline:h13
  colorscheme hybrid_reverse
endif

" }}}

" Plugin {{{

" Airline (status line)
let g:airline_powerline_fonts = 1
let g:airline_theme = "hybrid"
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h13

" Fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
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
let g:user_emmet_leader_key=','

" CtrlP
" modify default opening behavior with an interactive argument <C-o>
let g:ctrlp_arg_map = 1

" Add the Silver Searcher as the backend to use the agignore with ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Toggle NERDTree
map <leader>n :NERDTreeToggle<CR>
" let g:NERDTreeWinPos = "right"

" Markdown-syntax
" disable markdown-syntax folding
let g:vim_markdown_folding_disabled=1

" UltiSnips

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

" Function to Watch for changes if buffer changed on disk
"function! WatchForChanges(bufname, ...)
  "" Figure out which options are in effect
  "if a:bufname == '*'
    "let id = 'WatchForChanges'.'AnyBuffer'
    "" If you try to do checktime *, you'll get E93: More than one match for * is given
    "let bufspec = ''
  "else
    "if bufnr(a:bufname) == -1
      "echoerr "Buffer " . a:bufname . " doesn't exist"
      "return
    "end
    "let id = 'WatchForChanges'.bufnr(a:bufname)
    "let bufspec = a:bufname
  "end
  "if len(a:000) == 0
    "let options = {}
  "else
    "if type(a:1) == type({})
      "let options = a:1
    "else
      "echoerr "Argument must be a Dict"
    "end
  "end
  "let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  "let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  "let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  "let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  "let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  "if while_in_this_buffer_only
    "let event_bufspec = a:bufname
  "else
    "let event_bufspec = '*'
  "end
  "let reg_saved = @"
  ""let autoread_saved = &autoread
  "let msg = "\n"
  "" Check to see if the autocommand already exists
  "redir @"
    "silent! exec 'au '.id
  "redir END
  "let l:defined = (@" !~ 'E216: No such group or event:')
  "" If not yet defined...
  "if !l:defined
    "if l:autoread
      "let msg = msg . 'Autoread enabled - '
      "if a:bufname == '*'
        "set autoread
      "else
        "setlocal autoread
      "end
    "end
    "silent! exec 'augroup '.id
      "if a:bufname != '*'
        ""exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        ""exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        "exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      "end
        "exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        "exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        "exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      "" The following events might slow things down so we provide a way to disable them...
      "" vim docs warn:
      ""   Careful: Don't do anything that the user does
      ""   not expect or that is slow.
      "if more_events
        "exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        "exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      "end
    "augroup END
    "let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  "end
  "" If they want to disable it, or it is defined and they want to toggle it,
  "if l:disable || (l:toggle && l:defined)
    "if l:autoread
      "let msg = msg . 'Autoread disabled - '
      "if a:bufname == '*'
        "set noautoread
      "else
        "setlocal noautoread
      "end
    "end
    "" Using an autogroup allows us to remove it easily with the following
    "" command. If we do not use an autogroup, we cannot remove this
    "" single :checktime command
    "" augroup! checkforupdates
    "silent! exec 'au! '.id
    "silent! exec 'augroup! '.id
    "let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  "elseif l:defined
    "let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  "end
  "" echo msg
  "let @"=reg_saved
"endfunction
"
"let autoreadargs={'autoread':1}
"execute WatchForChanges("*",autoreadargs)
"}}}

