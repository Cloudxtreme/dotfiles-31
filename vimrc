" Vim-plug setup {{{1
" Vim-plug call and plugins path {{{2
" let vim-plug manage my Plugins
call plug#begin('~/.vim/bundle') "Set the plugins path

" Utilities {{{2
Plug 'Chiel92/vim-autoformat'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Valloric/YouCompleteMe'
Plug 'severin-lemaignan/vim-minimap'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'mbbill/undotree'

" Editing {{{2
Plug 'terryma/vim-multiple-cursors'
Plug 'matze/vim-move'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-repeat'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mtth/scratch.vim'
Plug 'Tpope/vim-commentary'
Plug 'Tpope/vim-surround'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'nelstrom/vim-markdown-folding' " folding markdown files

" Git Helpers {{{2
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Syntax {{{2
Plug 'digitalToad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'othree/html5.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'elzr/vim-json'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tmux-plugins/vim-tmux' "Add Tmux syntax highlight
Plug 'vim-ruby/vim-ruby'

" Vim Themes and Icons {{{2
Plug 'bling/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/rainbow_parentheses.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'chrisbra/Colorizer'

call plug#end() " required/end of plugins loading

" Settings {{{1
" general settings {{{2

"Switch syntax highlight on, when the terminal has colours
filetype plugin indent on    " required

syntax on

" Use vim, not vi api
set nocompatible

" Don't show intro
set shortmess+=I

" Get rid of the delay when pressing 0 (for example)
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Set default keyword search to help
set keywordprg=:help

" file-encoding, Backup, buffer, history {{{2
" UTF encoding
set fileencoding=utf-8
if !has('nvim')
  set encoding=utf-8
endif
" Set buffer modifiable
set modifiable

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=200

" Line number {{{2
" Turn on line numbers
set number

" Set relative line numbers
set relativenumber

" Window, Menu, cursor {{{2
" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Visual autocomplete for command menu
set wildmenu
set wildmode=full

" Ensure vim doesn't beep at you every time you make a mistype
set visualbell

" Highlight the current line
set cursorline

" Always show cursor
set ruler

" Enable mouse
set mouse=a

" Tab, Backspace, Word wrap, hidden etc. {{{2
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

" Set soft tab stop equal to shiftwidth
set softtabstop=2

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2

" Highlight tailing white space
set listchars=tab:▸\ ,eol:¬

" Search {{{
" Incremental Searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /search Phrase doesn't need the \c escape character
set ignorecase

" When substitute, all match in a line is substituted instead of one
set gdefault

" Leader mapping {{{2
" set up the map leader
let mapleader = ","

" set up the local leader key
let maplocalleader = "\\"

"Cmd, omnicomplete, interpreter, clipboard {{{2

" Redraw only when need to (i.e. don't redraw when executing a macro)
set lazyredraw

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Show incomplete commands
set showcmd

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
set clipboard+=unnamed

" Set syntax complete function on
set omnifunc=syntaxcomplete#Complete

" spellcheck complete
set complete+=kspell

" Set python interpreter
let g:python_host_prog = '/usr/bin/python'

" Colorscheme & background, Fonts {{{2


set t_Co=256
set background=dark
syntax enable
colorscheme jellybeans

"Fonts
let g:enable_bold_font = 1 " set some code to be bold
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Nerd\ Font\ Complete:h15 "set gui powerline font

"Set gui vim
if has('gui_running')
  set guioptions-=T " Hide toolbar in GUI vim
endif

" Plugins Settings {{{1
" RainbowParentheses {{{2
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Colorizer {{{2
" Make files look nice
autocmd FileType css,scss,sass,less,stylus :ColorHighlight "For Colorizer Plugin

" Autoformat {{{2
" autoformat shortcut
noremap <c-t> :Autoformat<CR>
" enable ranged definitions for python
let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"
let g:formatters_python = ['autopep8']

" MatchTagAlways {{{2
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
nnoremap <leader>m :MtaJumpToOtherTag<cr>

" Airline {{{2
let g:airline_powerline_fonts = 1 "use powerline font
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_theme='dark'

" Tabline part of vim-airline

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>x :bp <BAR> bd #<CR>

" This replaces :tabnew which I used to bind to this mapping
nmap <leader>n :enew<cr>

" Move to the next buffer
nmap <leader>. :bnext<CR>

" Move to the previous buffer
nmap <leader>, :bprevious<CR>

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

" Fugitive {{{2
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>

" Syntastic {{{2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1

" Display errors in the same window for all checkers
let g:syntastic_aggregate_errors = 1

" Better interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '!'


" Close Syntastic list window
nnoremap <Leader>ll :lclose<CR>

" Open error list window
nnoremap <Leader>le :Errors<CR>

" Go to next error
nnoremap <leader>lj :lnext<CR>

" Go to previous error
nnoremap <leader>lk :lprev<CR>

" Do a syntastic manual check
nnoremap <leader>lc :SyntasticCheck<CR>

noremap <leader>lt :SyntasticToggleMode<CR>
let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss','html','less'] }


" Disable the less checker
let g:syntastic_less_checkers=['']

" Tagbar {{{2
nmap <F8> :TagbarToggle<CR>

" Emmet {{{2
" Remap <C-y>
" let g:user_emmet_leader_key='e'
imap   <leader>,   <plug>(emmet-expand-abbr)

let g:user_emmet_install_global = 0
autocmd FileType html,css,less,scss EmmetInstall

" CtrlP {{{2
" modify default opening behaviour with an interactive argument <C-o>
let g:ctrlp_arg_map = 1

" Add the Silver Searcher as the backend to use the agignore with ctrlp
let g:ctrlp_user_command = 'ag %s -l  --nocolor --hidden -g ""'
" Use regular expression as search default
" let g:ctrlp_regexp = 1

" Use age over grep
set grepprg=ag\ --nogroup\ --nocolor

" Disable caching, ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" NERDTree {{{2
" Toggle NERDTree
map <leader>t :NERDTreeToggle<CR>
" Open a node in nerdtree window with spacebar
:autocmd FileType nerdtree nmap <buffer> <space> o

" Start vim with NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Move the cursor in the editor window
""autocmd VimEnter * wincmd p

" Auto close NERDTree if it is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"  Markdown {{{2
" disable markdown-syntax folding
" let g:vim_markdown_folding_disabled=1
" let g:markdown_fenced_languages = ['ruby', 'javascript', 'json', 'css', 'html', 'less', 'bash=sh']

" Turn off instant-markdown autostart, use :InstantMarkdownPreview to preview
" the buffer.
let g:instant_markdown_autostart = 0

" UltiSnips {{{2
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

" Ag {{{2
nnoremap <leader>a :Ag<space>

" Vim-Move {{{2
let g:move_map_keys = 0
map <F4> = j
map <F5> = k
vmap <F4> <Plug>MoveBlockDown
vmap <F5> <Plug>MoveBlockUp
nmap <F4> <Plug>MoveLineDown
nmap <F5> <Plug>MoveLineUp

" Undotree {{{2
nnoremap <F6> :UndotreeToggle<cr>
" Set persistent_undo
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif
" undotree layout style
if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 4
endif

" undotree window width
if !exists('g:undotree_SplitWidth')
  let g:undotree_SplitWidth = 40
endif

" Mappings {{{1
" Moving Around {{{2

" Type 12<Enter> to go to line 12 and Hit ENTER to go to end of file
nnoremap <CR> G

" switch to normal mode
inoremap jk <esc>

" Start a new line below the current line
inoremap jo <esc>o

" Start a new line above the current line
inoremap jO <esc>O

" Move to end of line and enter into insert mode
inoremap ja <esc>A

" Move behind next letter in insert mode
inoremap jl <esc>2li

" move up one line and indent
inoremap kk <esc>kA<CR>


" bind Shift-L to move to the end
nnoremap L $
nnoremap H 0

" Editing {{{2
" Double tap 'v' to visual-line mode
nnoremap vv V

" Indent
nmap <F10> <<
nmap <F11> >>
vmap <F10> <gv
vmap <F11> >gv

" Copy to system clipboard in visual mode.
vnoremap <C-c> "*y

" Paste from the system clipboard to vim in insert mode
nnoremap <leader>v "*pa
inoremap <leader>v <C-r><C-p>*

" Searching {{{2

nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Get rid of  Search Highlight
nnoremap <leader><space> :noh<CR>

" Window remapping {{{2

" Remap Ctrl-W
nnoremap <leader>w <C-w>

" Quickly resize vertical window
map - <C-W>-
map + <C-W>+

" Quickly increase/decrease the width of the window
map <F7> <C-W><
map <F9> <C-W>>

" Buffer {{{2
" Start a vertical buffer
nnoremap <leader>vs :vs<cr>

" File Command {{{2
" Type <leader>s to save file
nnoremap <leader>s :w<CR>
inoremap <leader>s <esc>:w<CR>

" Kill all windows
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>q :q<cr>
" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

" quick access to the register
nnoremap <leader>r :reg<CR>
inoremap <leader>r <esc>:reg<CR>

" Command Mapping
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Fix the C-h conflict in Neovim
if has('nvim')
  nmap <BS> <C-W>h
endif

" Tab {{{2

" Move the current window to a new tab
nnoremap tt <C-w>T

" Quick editing files {{{2
" Edit vimrc file in a vertically split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" Edit the zshrc file
nnoremap <leader>ez :vsplit ~/.zshrc<cr>

" Edit the custom alias file
nnoremap <leader>ea :vsplit ~/bin/dotfiles/custom/aliases.zsh<cr>

" Easy filetype switching {{{2
nnoremap _md :set ft=markdown<cr>
nnoremap _scs :set ft=scss<cr>
nnoremap _less :set ft=less<cr>
nnoremap _js :set ft=javascript<cr>
nnoremap _css :set ft=css<cr>
nnoremap _jn :set ft=json<cr>

" Spell check {{{2
nnoremap <leader>ss :setlocal spell! spelllang=en_gb<CR>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa 1zg
nnoremap <leader>sb 2zg
nnoremap <leader>sf 1z=
nnoremap <leader>sr z=

inoremap <leader>ss <C-o>:setlocal spell! spelllang=en_gb<CR>
inoremap <leader>sn <C-x>s

" Folding {{{1

" Start file with all folds closed.
set foldlevelstart=1

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zo zczO
nnoremap zO zo

" Refocus folds
nnoremap <leader>z zMzvzz

" autogroup Json
au! BufRead,BufNewFile *.json set filetype=json

augroup ft_json
  au!

  au FileType json setlocal foldmethod=syntax
  au FileType json setlocal expandtab
augroup END

augroup ft_vim
  au!

  au FileType vim setlocal foldmethod=marker
  au FileType tmux setlocal foldmethod=marker
  au FileType zsh setlocal foldmethod=marker
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

augroup ft_css
  au!

  au BufNewFile,BufRead *.less setlocal filetype=less

  au FileType less,css,scss setlocal foldmethod=marker
  au FileType less,css,scss setlocal foldmarker={,}
  au FileType less,css,scss setlocal omnifunc=csscomplete#CompleteCSS
  au FileType less,css,scss setlocal iskeyword+=-
augroup END

"Autocmd and Functions{{{1
" Autocmd {{{2
if has("autocmd")

  " Customisations based on house-style
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType json setlocal ts=2 sts=2 sw=2 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss, *.atom setfiletype xml

  " markdown textwidth
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
  autocmd BufRead,BufNewFile * setlocal spellfile=~/.vim/spell/en.utf-8.add
  autocmd BufRead,BufNewFile * setlocal spellfile+=~/.vim/spell/jargon.utf-8.add
endif

" Functions {{{2
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
" Mapping F4 to execute javascript in nodejs;
" map <F4> :call RunJavascript() <CR>
" function RunJavascript()
"   exec "! node %"
" endfunction


