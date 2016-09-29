"vimrc :: egroeg

	set nocompatible
	" set noexrc
  set esckeys
	set background=dark
	syntax on
	set number
	set nowrap
	set mouse=a
	set title		    "thanks for flying vim
	set ruler
	set confirm
	set showcmd
	set showmode
	set nolazyredraw
	set tf
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
  set cm=blowfish
  :hi LineNr ctermfg                     ='DarkGrey'     "color number grey
  :hi StatusLine ctermfg                 ='DarkGrey'		 "color statusline grey
  :hi Comment ctermfg										 ='DarkGrey'     "color comments grey
	" call pathogen#infect()
  set term=xterm-256color
  filetype plugin indent on

" tmux
"let tmux = "/usr/share/vim/vim73/syntax/tmux.vim"
"au BufRead,BufNewFile .tmux.conf set filetype=tmux.conf
"au Syntax newlang source /usr/share/vim/vim73/syntax/tmux.vim "todo: tmux.vim
" NERDTree (automatically)
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

 	set laststatus=2            "always show statusline
	set statusline=%{&ff}\ \%{&fenc}\ \b%1.3n\ \%#StatusFTP#\%Y\ \%#StatusRO#\%R\ \%#StatusHLP#\%H\ \%#StatusPRV#\%W\ \%#StatusModFlag#\%M\ \%#StatusLine#\%f\%=\%1.7c\ \%1.7l/%L\ \%p%%
" vundle
 filetype off                  " required
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'L9'
 Plugin 'scrooloose/nerdtree'
 Plugin 'ervandew/supertab'
 Plugin 'kien/rainbow_parentheses.vim'
 Plugin 'garbas/vim-snipmate'
 Plugin 'MarcWeber/vim-addon-mw-utils'
 Plugin 'tomtom/tlib_vim'
 Plugin 'honza/vim-snippets'
 Plugin 'raimondi/delimitmate'
 Plugin 'scrooloose/syntastic'
 Plugin 'godlygeek/tabular.git'
 " All plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
