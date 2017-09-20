"*************************************************************************
"    > File Name: .vimrc
"    > Author: LI JIAHAO
"    > ################### 
"    > Mail: lijiahao@cool2645.com
"    > Created Time: Wed 20 Sep 2017 08:19:46 PM CST
" ************************************************************************/

set nu "Show the line count
set incsearch "Use increment search
set hlsearch "Use highlight search
set autoread "Autoread file when modified
set expandtab
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set backspace=2
set mouse=a
set clipboard+=unnamed 
set iskeyword+=_,$,@,%,#,-

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" Set Up Vundle
runtime! .vim
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
filetype plugin indent on

call vundle#begin()
Plugin 'bling/vim-airline' "Airline plugin enabled
Plugin 'scrooloose/syntastic' "Syntax Plugin enabled
Plugin 'jiangmiao/auto-pairs' "Insert or delete brackets, parens, quotes in pair
call vundle#end()

let g:AutoPairs = { '{':'}' }
let g:AutoPairsMultilineClose = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=1

set noshowmode
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
set laststatus=2
syntax on           " Highlight Grammar  
autocmd InsertLeave * se nocul  " Highlight Current Line  
autocmd InsertEnter * se cul    " Highlight Current Line  
set showcmd 
set cmdheight=1

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py exec ":call SetTitle()" 
let g:author="LI JIAHAO"
let g:email="lijiahao@cool2645.com"
func SetTitle() 
    if &filetype == 'sh' 
        call setline(1, "\#!/bin/bash") 
        call append(line("."), "\#########################################################################") 
        call append(line(".")+1, "\# File Name: ".expand("%")) 
        call append(line(".")+2, "\# Author: ".g:author) 
		call append(line(".")+3,"\# ###############")
        call append(line(".")+4, "\# Mail: ".g:email) 
        call append(line(".")+5, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+6, "\#########################################################################") 
        call append(line(".")+7, "") 
    elseif &filetype == 'python' 
        call setline(1, "\#!/usr/bin/python") 
        call append(line("."), "\# -*- coding: UTF-8 -*-") 
        call append(line(".")+1, "\#########################################################################") 
        call append(line(".")+2, "\# File Name: ".expand("%")) 
        call append(line(".")+3, "\# Author: ".g:author) 
		call append(line(".")+4,"\# ###############")
        call append(line(".")+5, "\# Mail: ".g:email) 
        call append(line(".")+6, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+7, "\#########################################################################") 
        call append(line(".")+8, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."),   "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: ".g:author) 
		call append(line(".")+2, "    > ################### ")
        call append(line(".")+3, "    > Mail: ".g:email) 
        call append(line(".")+4, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+5, " ************************************************************************/") 
        call append(line(".")+6, "")
    endif
endfunc 
autocmd BufNewFile * normal G
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

