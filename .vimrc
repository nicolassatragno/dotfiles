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
Plugin 'scrooloose/syntastic'
Plugin 'burnettk/vim-angular'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'

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

" TODO remove this line when I decide to use localvimrc
let g:syntastic_scss_sass_args="--load-path /home/nicolas/Desarrollo/sifon/bower_components/"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_ignore_errors = ["unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

" javascript-libraries-syntax config
let g:used_javascript_libs = 'angularjs'
let b:javascript_lib_use_angularjs = 1

" ctrlp config
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/bower_components/*,*/node_modules/*,*/dist/*,*/coverage/*

" vim-angular mapping
noremap ga :AngularGoToFile <return>

if has("autocmd") && exists("+omnifunc") 
  autocmd Filetype * 
      \ if &omnifunc == "" | 
      \ setlocal omnifunc=syntaxcomplete#Complete | 
      \ endif 
      endif 

" Fix airline on startup
set laststatus=2

syntax enable
set t_Co=256
set background=dark
colorscheme solarized

" Autocomplete on ctrl space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
