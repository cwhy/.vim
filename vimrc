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
set expandtab
set autoindent
set backspace=indent,eol,start
set showcmd
scriptencoding utf-8
:set listchars=tab:\|.,trail:~,extends:>,precedes:<
:set list

" Code Folding
set foldmethod=indent
set foldlevel=99

" Solarized
syntax enable
se t_Co=256
set background=dark
colorscheme solarized

" Airline
let g:airline_theme = 'solarized'
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if has("gui_running")
    if has("gui_win32")
	let g:airline_symbols.space = " "
    endif
endif
let g:airline_powerline_fonts = 1

" Python plugins
let g:flake8_max_line_length=99
let g:flake8_ignore="E231,E226"
autocmd BufWritePost *.py call Flake8()
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" R-Tmux settings
let vimrplugin_applescript = 0
" let vimrplugin_screenplugin = 0
" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell'
" instruct to use your own .screenrc file
let g:vimrplugin_noscreenrc = 1
" For integration of r-plugin with screen.vim
let g:vimrplugin_screenplugin = 1
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
" start R with F2 key
map <F2> <Plug>RStart
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

" LaTeX Box
let g:LatexBox_latexmk_options = "-pvc -pdf"

" Auto-format
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
