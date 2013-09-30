execute pathogen#infect()
call pathogen#runtime_append_all_bundles()

filetype indent on
set relativenumber
au FocusLost * set number
au FocusGained * set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set backspace=indent,eol,start
set showcmd

set fileencodings=utf-8,gb2312,gbk,gb18030

syntax enable
se t_Co=256
set background=dark
colorscheme solarized

let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'

set laststatus=2
