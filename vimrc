set nocompatible
call pathogen#infect()
call pathogen#helptags()                    " load plugin help file

" Chinese Support
set fileencodings=utf-8,gb2312,gbk,gb18030

" Font
set enc=utf-8
if has("gui_running")
  if has("gui_gtk2")
    set guifont=monofur\ for\ Powerline\ 13
  elseif has("gui_macvim")
    set guifont=monofur\ for\ Powerline\ Regular:h13
  elseif has("gui_win32")
    set guifont=monofur\ for\ Powerline:h13
    "set guifont=monofur_for_Powerline:h13
  endif
endif

" Basics
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

" LaTeX Box
let g:LatexBox_latexmk_options = "-pvc -pdf"
