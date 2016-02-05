"""""""""""""""""""""""""""""""""""""""
" Maintainer:
" 	Yves Hoppe
" 	info@yveshoppe.de
"
" Version:
" 	1.1.4 - 2016/02/05
"
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
" -> General
"""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins
filetype plugin on
filetype indent on

set number

set display+=lastline

" Set to auto read when a file is changed from the outside
set autoread

" Sets how many lines of history VIM has to remember
set history=2000

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch
 
" For regular expressions turn magic on
set magic

" Enable syntax highlighting
syntax enable
colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set encoding=utf8

set nobackup
set nowb
set noswapfile

" Tab instead of spaces
set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set runtimepath^=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'tomasr/molokai'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'crusoexia/vim-javascript-lib'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Integrate with powerline fonts
let g:airline_powerline_fonts = 1

" Molokai
colorscheme molokai
let g:molokai_original = 1 

" Display status bar
set laststatus=2

" Hightlighting JS / DO JS / DOMM
let g:javascript_enable_domhtmlcss = 1
