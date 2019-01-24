set nocompatible              " required
set nu			      " line numbering
set encoding=utf-8	      " utf-8 is the future	
set splitbelow
set splitright
set clipboard=unnamed

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
filetype off                  " required

" python tab setup
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4 
    \ shiftwidth=4  
    \ textwidth=79  
    \ expandtab     
    \ autoindent    
    \ fileformat=unix

" other language tab setup
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" python highlighting
let python_highlight_all=1
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' " ctrl+p
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'Valloric/YouCompleteMe'

" ignores .pyc
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Make sure tab completion closes
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


"
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
"
" ...
"


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
