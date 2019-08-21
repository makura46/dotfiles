set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'posva/vim-vue'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype plugin indent on
syntax enable

let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

map <C-n> :NERDTree<CR>
inoremap <silent> jj <ESC>
inoremap <silent> jk j
nmap j gj
nmap k gk
set hlsearch
nmap <ESC><ESC> :noh<CR>
set number
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cursorline


augroup filetypeIndent
autocmd!
	autocmd BufRead,BufNewFile *.c setlocal tabstop=4 shiftwidth=4 autoindent smartindent
	autocmd BufRead,BufNewFile *.cpp setlocal tabstop=4 shiftwidth=4 autoindent smartindent
	autocmd BufRead,BufNewFile *.py setlocal tabstop=4 shiftwidth=4 autoindent smartindent
	autocmd BufRead,BufNewFile *.java setlocal tabstop=4 shiftwidth=4 autoindent smartindent
	autocmd BufRead,BufNewFile *.html setlocal expandtab tabstop=2 shiftwidth=2 autoindent smartindent 
	autocmd BufRead,BufNewFile *.css setlocal expandtab tabstop=2 shiftwidth=2 autoindent smartindent
	autocmd BufRead,BufNewFile *.js setlocal expandtab tabstop=2 shiftwidth=2 autoindent smartindent
	autocmd BufRead,BufNewFile *.rb setlocal tabstop=2 shiftwidth=2 autoindent smartindent
	autocmd BufRead,BufNewFile *.sh setlocal tabstop=4 shiftwidth=4 autoindent smartindent
	autocmd BufRead,BufNewFile *.go setlocal tabstop=4 shiftwidth=4 autoindent smartindent
	autocmd BufRead,BufNewFile *.php setlocal tabstop=4 shiftwidth=4 autoindent smartindent
	autocmd BufRead,BufNewFile *.tmpl setlocal expandtab tabstop=2 shiftwidth=2 autoindent smartindent
	autocmd BufRead,BufNewFile *.scala setlocal expandtab tabstop=2 shiftwidth=2 autoindent smartindent
	autocmd BufRead,BufNewFile *.yml setlocal expandtab tabstop=2 shiftwidth=2 autoindent smartindent
	autocmd BufRead,BufNewFile *.vue setlocal expandtab tabstop=2 shiftwidth=2 autoindent smartindent
augroup END
filetype plugin indent on " fileごとにインデント幅の変更
