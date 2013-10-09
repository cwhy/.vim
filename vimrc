call pathogen#infect()
call pathogen#helptags()                    " load plugin help file

set relativenumber
au FocusLost * set number
au FocusGained * set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber

filetype indent on
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

" Code Folding
set foldmethod=indent
set foldlevel=99

" Chinese Support
set fileencodings=utf-8,gb2312,gbk,gb18030

" Solarized
syntax enable
se t_Co=256
set background=dark
colorscheme solarized

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
set laststatus=2

" Python plugins
let g:flake8_max_line_length=99
let g:flake8_ignore="E231,E226"
autocmd BufWritePost *.py call Flake8()
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

