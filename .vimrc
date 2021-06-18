"##############################################################################
"                                Preliminary setup
"##############################################################################
set nocompatible              " be iMproved, required
filetype off                  " required

"##############################################################################
"                                  Package Manager setup
"##############################################################################
"
" Put your non-Plugin stuff after this line
"##############################################################################
"                                 Defines
"##############################################################################

" let mapleader = ','
set path+=**
syntax enable
set number
set relativenumber

" " TextEdit might fail if hidden is not set.
set hidden

" To disable swap files permanently
set noswapfile

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" set colorscheme
" colorscheme sonokai

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200   " keep 200 lines of command line history
set ruler       " show the cursor position all the time
set showcmd       " display incomplete commands
set wildmenu    " display completion matches in a status line

set ttimeout    " time out for key codes
set ttimeoutlen=1000  " wait up to 1000ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Auto reload file if it has changed on the disk
set autoread

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set smarttab
set cindent

" enable this to maintain indentation when copying text from anything outside of
" vim, doesn't work with coc's completion options
" set paste

"" Show all white characters
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set list
" set nolist

" disable scratch preview window
set completeopt=menuone,noinsert,noselect,preview

" Vim doesn’t read .vimrc files in the current directory, the following setting enables it
set exrc

" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

set encoding=UTF-8
filetype plugin indent on
"##############################################################################
"                    Custom functions 1 - Pre-plugin config
"##############################################################################
" set VIM root directory
if has('win32') || has ('win64')
  let $VIMROOT = $VIM."/vimfiles"
else
    let $VIMROOT = $HOME."/.vim"
endif

" set current vimrc file directory variable
let $CURR_VIMRC_DIR=expand('<sfile>:p:h:h')

" add extra include paths.
let s:extpaths=expand("$HOME/.vim/.vim.extpaths")
if filereadable(s:extpaths)
    execute "source ".s:extpaths
endif
"###############################################################################
"                               Plugin configs
"###############################################################################

"##############################################################################
"                              Custom functions 2
"##############################################################################

