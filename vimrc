"-------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: Mike Helderman
"-------------------------------------------------------------------------

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"-------------------------------------------------------------------------
" Encoding
"-------------------------------------------------------------------------

scriptencoding utf-8
set encoding=utf-8

"-------------------------------------------------------------------------
" Standard stuff
"-------------------------------------------------------------------------

set nocompatible
set ruler
set number
set showcmd
set nostartofline
set autoindent
set title
set tw=79

" Enable syntax-highlighting
if has("syntax")
  syntax on
endif

" Solarized colorscheme
set background=light
let g:solarized_termcolors=16
set t_Co=16
colorscheme solarized

" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
set listchars=tab:>-,trail:·,eol:$

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" <Ctrl-n> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-n> :nohl<CR><C-n>

" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on

" NERDTree
" toggle NERDTRee on or off via F2
map <F2> :NERDTreeToggle<CR>
let NERDTreeDirArrows=1

" map buffer navigation to function keys
map <F4> :bn<CR>
map <F3> :bp<CR>

" make html snippets available to php files as well
au BufRead,BufNewFile *.php set ft=php.html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline pr0n
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ls=2
set statusline=%F\                              "full filename 
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]                         "file format
set statusline+=%h                              "help file flag
set statusline+=%m                              "modified flag
set statusline+=%r                              "read only flag
set statusline+=%y                              "filetype
set statusline+=%=                              "left/right separator
set statusline+=col\ %c,                        "cursor column
set statusline+=\ line\ %l/%L                   "cursor line/total lines
set statusline+=\ (%p%%)                        "percent through file
