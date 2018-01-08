call vundle#begin()
"Let Vundle manage vundle
Plugin 'VundleVim/Vundle.vim'

"---My installed plugins-----"
Plugin 'tpope/vim-vinegar'

"---------CTRLP------------"
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
set runtimepath^=$HOME/.vim/bundle/ctrlp.vim
set backspace=indent,eol,start	"Make backspace behave like every other editor.

nmap <A-r> :CtrlPBufTag<cr>
nmap <A-e> :CtrlPMRUFiles<cr>

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$|\node_modules$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Gsearch
set grepprg=ag				"Use ag for the search
let g:grep_cmd_opts = '--line-numbers --noheading'
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

Plugin 'skwp/greplace.vim'


"---------NERDTREE------------"
Plugin 'scrooloose/nerdtree'
"Display nerdtree like subl
map <C-K><C-B> :NERDTreeToggle<cr>

"Disable NERDTree on startup
let g:NERDTreeHijackNetrw=0

"to insert unicode characters:
"(insert mode) ctrl+v,u [unicode]
"see https://github.com/ryanoasis/nerd-fonts/
"for patched fonts unicode
let g:NERDTreeDirArrowCollapsible=""
let g:NERDTreeDirArrowExpandable=""

"------Appearance related plugins-----"
Plugin 'vim-airline/vim-airline'
"Airline----
let g:airline_theme='hybrid'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
"hide mode at the bottom. to be overridden by airplane
set noshowmode

"powerline symbols
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

"-------Themes------"
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'joshdick/onedark.vim'
set background=dark

Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'

"Font downloaded from 
"https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode
set guifont=FuraCode_NF:h10
Plugin 'tpope/vim-fugitive'

"Laravel specific
Plugin 'jwalton512/vim-blade'
" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['hasRole', 'userInSameDepartment']

" add end tags to custom directives
let s:end_tags = []
for i in g:blade_custom_directives
	if strpart(i,0,3) != 'end'
		call add(s:end_tags, 'end' . i)
	endif
endfor

let g:blade_custom_directives = g:blade_custom_directives + s:end_tags
" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \ }

let g:enable_italic_font=1

"------PHP-related plugins-----"
Plugin 'arnaud-lb/vim-php-namespace'
"Insert use statement
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <F10> <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <F10> :call PhpInsertUse()<CR>

"Insert fully qualified class name
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <F9> <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <F9> :call PhpExpandClass()<CR>

Plugin 'StanAngeloff/php.vim'
Plugin 'stephpy/vim-php-cs-fixer'

"------Quality of life---------"
Plugin 'garbas/vim-snipmate'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'aaronbieber/vim-quicktask'
Plugin 'tpope/vim-commentary'

call vundle#end()
filetype plugin indent on
