" set 256 colors 
set t_Co=256

" load plugins via vim-plug
call plug#begin()

" Themes and Visual
Plug 'freeo/vim-kalisi'
Plug 'vim-airline/vim-airline'

" revision control systems
Plug 'nfvs/vim-perforce'
Plug 'tpope/vim-fugitive'

" Language plugins
Plug 'lervag/vimtex'
Plug 'lukerandall/haskellmode-vim'
Plug 'rollxx/vim-antlr'

" Functional plugins
Plug 'vim-scripts/taglist.vim'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'nfvs/vim-perforce'
Plug 'vim-scripts/gtags.vim'
Plug 'Shougo/unite.vim'
Plug 'hewes/unite-gtags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'benekastah/neomake'
Plug 'Valloric/ListToggle'
Plug 'lyuts/vim-rtags' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tmhedberg/matchit'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-visual-star-search'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline-themes'

call plug#end() 

filetype plugin indent on       " enable detection, plugins and indenting in one step
syntax on                       " enable syntax highlighting 

" Change the mapleader from \ to ,
let mapleader=","
let maplocalleader="\\"

" Editing behaviour {{{
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is two spaces
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=2                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set cinoptions+=g0              " don't indent public, private, etc.
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:?\ ,trail:·,extends:#,nbsp:·

set nolist                      " don't show invisible characters by default,
                                " but it is enabled for some file types (see later)
set fileformat=unix             " set default file format to unix
set fileformats="unix,dos,mac"  " support the other file formats as well
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)
set shortmess+=I                " hide the launch screen
set clipboard=unnamedplus       " map clipboard + register
set mouse=a                     " copy and paste with mouse

" Thanks to Steve Losh for this liberating tip
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" }}}

" Editor layout {{{
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set cmdheight=1                 " use a status bar that is 2 rows high
" }}}

" Vim behaviour {{{
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.config/nvim/.undo
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.config/nvim/.swp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
set ttyfast                     " always use a fast terminal
set cursorline                  " underline the current line, for quick orientation
" }}}

" set solarized colorscheme
colorscheme kalisi 
if ! has('gui_running')
  set background=dark
endif

" perforce options
let g:perforce_open_on_change=1
let g:perforce_open_on_save=1

" activate tags
set tags=./tags;/

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 
let g:airline_theme='kalisi'

" haskell configuration
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/firefox"

 " correctly handle .gmk files as being gnu make
au BufNewFile,BufRead *.gmk set filetype=make
autocmd FileType make setlocal noexpandtab shiftwidth=2 softtabstop=0 

" compiler options
compiler gcc
let g:compiler_gcc_ignore_unmatched_lines=1

" Options for Valloric/YouCompleteMe
let g:ycm_confirm_extra_conf = 0 " do not ask before loading the .ycm_extra_conf.py 

" taglist configuration
let Tlist_WinWidth = 50 " Width of Taglist
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let Tlist_Use_Right_Window = 1  

" local vimrc settings
let g:local_vimrc = {'names':['.lnvimrc'],'hash_fun':'LVRHashOfFile'}

" antlr plugin
au BufRead,BufNewFile *.g set syntax=antlr3

" automatically open the quickfixwindow 
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" all custom keymappings
command! KGtags execute 'Gtags' expand('<cword>')

nnoremap <leader>d :YcmCompleter GoToDefinition<cr> 
nnoremap <leader>t :TlistToggle<cr>
nnoremap <leader>s :KGtags<cr>
nnoremap <leader>f :GitFiles<cr> 
nnoremap <leader>b :Buffers<cr>  
nnoremap <leader>m :Neomake!<cr>
map <leader>L <Plug>(easymotion-bd-jk)
map <leader>w <Plug>(easymotion-bd-w)
" note that <leader>r is set by rtags!

" quickfix toggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" set code completion to <C-space> 
inoremap <C-Space> <C-x><C-o> 

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
imap jj <Esc> 
