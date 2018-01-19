set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
so $HOME/.vim/plugins.vim


let mapleader=','

"------Appearance-------"
syntax enable
colorscheme onedark
"Display a column to know when to wrap to next line
set textwidth=80
set colorcolumn=+1


"display relative line numbers instead of absolute
set relativenumber

set encoding=utf-8

"Display line numbers
set number

set tabstop=4
set softtabstop=4
set shiftwidth=4

"-----------------------"

setglobal guioptions-=T
setglobal guioptions-=L
setglobal guioptions-=l
setglobal guioptions-=R
setglobal guioptions-=r
setglobal guioptions-=b
setglobal guioptions-=h
setglobal guioptions-=e		"Hide guitabs
setglobal guioptions-=m		"Hide menu bar

"-----Mappings----------"
"Make it easy to edit config files
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>eg :tabedit $MYGVIMRC<cr>
nmap <leader>ep :tabedit $HOME/.vim/plugins.vim<cr>
nmap <leader><space> :nohlsearch<cr>

nmap <leader>es :tabedit $HOME/.vim/snippets/

"Select all
noremap <C-A> ggVG

"paste
noremap <C-V> "*p
noremap <C-S> :w<cr>

"Buffer navigation
nnoremap <C-Tab> :bn<cr>
nnoremap <C-S-Tab> :bp<cr>

"close buffer
nnoremap <A-1> :bd<cr>
"new file
nnoremap <A-2> :e 

nnoremap <Left> :echoe "Use h"<cr>
nnoremap <Right> :echoe "Use l"<cr>
nnoremap <Up> :echoe "Use k"<cr>
nnoremap <Down> :echoe "Use j"<cr>
noremap ZZ :echoe "Not closing the window :)"<cr>

"-----Laravel Specific------"
nmap <leader>lr :e routes/web.php<cr>
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>

"-----Split Management------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>


"-----Searching------------"
set hlsearch
set incsearch

set wildmenu

"----Auto-Commands---------"

"Automatically source the .vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"---Others----------------"
set paste
set noeb vb t_vb=	"Disable beeping sound
au GUIENTER * set vb t_vb=
set complete=.,w,b,u

"Restore cursor position when reopening a file
if has("autocmd")		"Hide guitabs
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"---------NOTES AND TIPS---------
" ctrl+] go to method definition
" ctrl+6 jump to previously edited file
" visual mode, U to capitalize
" visual mode, u to lowercase
"
"
" tpope/surround!!!
" cs'	----- change surrounding '
" cs)	----- change surrounding )
" You get the idea
"
" for grep, rewatch vim tutorials episode 11
" understand using marks. episode 19
"
" learn to use macros. it's super useful. episode 21
"
" <leader>cc to comment line. some way to comment other text objects
"
" :read [file] yanks file content to current cursor
" "*p to paste from system clipboard
