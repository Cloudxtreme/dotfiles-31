" Vim-plug setup {{{

" let vim-plug manage my Plugins
call plug#begin('~/.vim/bundle') "Set the plugins path

" Utilities {{{
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
"}}}
" Editing {{{
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
Plug 'nelstrom/vim-markdown-folding' " foloding markdown files
"}}}
" Git Helpers {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
"}}}
" Syntax {{{
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
"}}}
" Vim Themes and Icons {{{
Plug 'bling/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/rainbow_parentheses.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'chrisbra/Colorizer'
"}}}

call plug#end() " required/end of plugins loading

"}}}
" Settings {{{
" general settings {{{

"Switch syntax highlight on, when the terminal has colors
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

"}}}
" file-encoding, Backup, buffer, history {{{
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
"}}}
" Line number {{{
" Turn on line numbers
set number

" Set relative line numbers
set relativenumber
"}}}
" Window, Menu, cursor {{{
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

" Always show cursor
set ruler

" Enable mouse
set mouse=a
"}}}
" Tab, Backspace, Wordwrap, hidden etc. {{{
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

" Highlight tailing whitespace
set listchars=tab:▸\ ,eol:¬

" }}}
" Search {{{
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

" }}} Search
" Leader mapping {{{
" set up the map leader
let mapleader = ","

" set up the local leader key
let maplocalleader = "\\"
"}}}
"Cmd, omnicomplete, interpreter, clipboard {{{

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

" Set python interpreter
let g:python_host_prog = '/usr/bin/python'
"}}}
" Colorscheme & background, Fonts {{{


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

" }}}
" }}}
" Plugins Settings {{{
" RainbowParentheses {{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}} RainbowParentheses
" Colorizer {{{
" Make files look nice
autocmd FileType css,scss,sass,less,stylus :ColorHighlight "For Colorizer Plugin
" }}} Colorizer
" Autoformat {{{
" autoformat shortcut
noremap <c-t> :Autoformat<CR>
" }}} Autoformat
" MatchTagAlways {{{
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
nnoremap <leader>m :MtaJumpToOtherTag<cr>
" }}} Matchtagalways
" Airline {{{
let g:airline_powerline_fonts = 1 "use powerline font
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_theme='dark'

" Tabline part of vim-airline

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>x :bp <BAR> bd #<CR>

" This replaes :tabnew which I used to bind to this mapping
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
" }}} Airline
" Fugitive {{{
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
" }}} Fugitive
" Syntastic {{{
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
" }}} Syntastic
" Tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}} Tagbar
" Emmet {{{
" Remap <C-y>
" let g:user_emmet_leader_key='e'
imap   <leader>,   <plug>(emmet-expand-abbr)

let g:user_emmet_install_global = 0
autocmd FileType html,css,less,scss EmmetInstall
" }}} Emmet
" CtrlP {{{
" modify default opening behavior with an interactive argument <C-o>
let g:ctrlp_arg_map = 1

" Add the Silver Searcher as the backend to use the agignore with ctrlp
let g:ctrlp_user_command = 'ag %s -l  --nocolor --hidden -g ""'
" Use regular expression as search default
" let g:ctrlp_regexp = 1

" Use age over grep
set grepprg=ag\ --nogroup\ --nocolor

" Disable caching, ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0


" }}} CtrlP
" NERDTree {{{
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
" }}} NERDTRee
"  Markdown {{{
" disable markdown-syntax folding
" let g:vim_markdown_folding_disabled=1
" let g:markdown_fenced_languages = ['ruby', 'javascript', 'json', 'css', 'html', 'less', 'bash=sh']

" Turn off instant-markdown autostart, use :InstantMarkdownPreview to preview
" the buffer.
let g:instant_markdown_autostart = 0
" }}} Markdown
" UltiSnips {{{
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
" }}} UltiSnips
" Ag {{{
nnoremap <leader>a :Ag<space>
" }}} Ag
" Vim-Move {{{
let g:move_map_keys = 0
map <F4> = j
map <F5> = k
vmap <F4> <Plug>MoveBlockDown
vmap <F5> <Plug>MoveBlockUp
nmap <F4> <Plug>MoveLineDown
nmap <F5> <Plug>MoveLineUp
" }}} vim-Move
" Undotree {{{
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

" }}}
" }}}
" Mappings {{{
" Moving Around {{{

" Type 12<Enter> to go to line 12 and Hit ENTER to go to end of file
nnoremap <CR> G

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

" Move cursor up or down in insert mode
inoremap <C-j> <C-g>j
inoremap <C-k> <C-g>k

" }}} Moving around
" Editing {{{
" Delete everything in the buffer and enter insert mode
nnoremap <leader>d gg<S-v><S-g>c
imap <leader>d <esc>gg<S-v><S-g>c

" Delete line and into insert mode
inoremap <C-d> <esc>ddi

" Double tab 'v' to visual-line mode
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
" }}} Editing
" Searching {{{

nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Get rid of  Search Highlight
nnoremap <leader><space> :noh<CR>

" }}} Searching
" Window remapping {{{

" Remap Ctrl-W
nnoremap <leader>w <C-w>

" Quickly resize vertical window
map - <C-W>-
map + <C-W>+

" Quickly increase/decrease the width of the window
map <F7> <C-W><
map <F9> <C-W>>

" }}} Window remapping
" Buffer {{{
" Open a horizontal buffer
nnoremap <leader>sp :sp<cr>
" Start a vertical buffer
nnoremap <leader>vs :vs<cr>
" }}}
" File Command {{{
" Type <leader>s to save file
nnoremap <leader>s :w<CR>
inoremap <leader>s <esc>:w<CR>


" Kill window
nnoremap K :q<cr>

" Kill all windows
nnoremap <leader>q :qa!<cr>

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

" }}} File Command
" Tab {{{

" Open the current buffer window in a new tab
nnoremap tt :tab split<CR>
" Move the current window to a new tab
nnoremap TT <C-w>T
" }}} Tab
" Quick editing files {{{
" Edit vimrc file in a vertically split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source the vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" Edit the zshrc file
nnoremap <leader>ez :vsplit ~/.zshrc<cr>

" Edit the custom alias file
nnoremap <leader>ea :vsplit ~/bin/dotfiles/custom/aliases.zsh<cr>

" }}} Commands
" Easy filetype switching {{{
nnoremap _md :set ft=markdown<cr>
nnoremap _scs :set ft=scss<cr>
nnoremap _less :set ft=less<cr>
nnoremap _js :set ft=javascript<cr>
nnoremap _css :set ft=css<cr>
nnoremap _jn :set ft=json<cr>
"}}}
" }}}
" Folding {{{

" Start file with all folds closed.
set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zo zczO
nnoremap zO zo

" Refocus folds
nnoremap <leader>z zMzvzz

augroup ft_vim
  au!

  au FileType vim setlocal foldmethod=marker
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
" }}}
"Autocmd and Functions{{{
" Autocmd {{{
if has("autocmd")

	" Customisations based on house-style
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType json setlocal ts=2 sts=2 sw=2 noexpandtab

	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss, *.atom setfiletype xml
endif
" }}}
" Functions {{{
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
" }}}
" }}}


