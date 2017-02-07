set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround.git'
Plugin 'vim-scripts/grails-vim'
Plugin 'wellle/targets.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'obvious-resize'

" Plugin 'scrooloose/syntastic'

Plugin 'burnettk/vim-angular'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()

filetype plugin indent on

" Tabs to proper spaces
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=2

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" 80 chars FTW
set cc=80
set textwidth=80

" Fix bug with new regex for ruby syntax highlighting. See
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set re=1

let g:ruby_path = '/usr/bin/ruby'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" javascript-libraries-syntax config
let g:used_javascript_libs = 'angularjs'
let b:javascript_lib_use_angularjs = 1

let g:syntastic_cpp_compiler_options = '-std=c++11'


if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
      \ if &omnifunc == "" |
      \ setlocal omnifunc=syntaxcomplete#Complete |
      \ endif
      endif

" ctrl p config
set wildignore+=*/node_modules/*,*/bower_components/*,*/dist/*,*/coverage/*,tmp/*,*.class

" Fix airline on startup
set laststatus=2

" Syntax highlighting.
syntax enable
set t_Co=256
set background=dark
colorscheme solarized
set cursorline

set nu

" Autocomplete on ctrl space.
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Per project configuration.
set exrc

" Highlighting search matches.
set hlsearch
set ignorecase

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

nmap <C-K> :ObviousResizeUp<CR>
nmap <C-J> :ObviousResizeDown<CR>
nmap <C-H> :ObviousResizeLeft<CR>
nmap <C-L> :ObviousResizeRight<CR>
nmap <C-M> :nohlsearch<CR>
nmap <C-F> :NERDTree<CR>
nmap <C-D> :NERDTreeFind<CR>

" Do not execute dangerous scripts.
set secure
