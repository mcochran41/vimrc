set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on

set term=xterm

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
" set tabs to have 4 spaces
set ts=4

" show line numbers
set number


" indent when moving to the next line while writing code
set autoindent

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" show current position
set ruler

" move to split below
nnoremap <C-J> <C-W><C-J> 
" move to split above
nnoremap <C-K> <C-W><C-K> " 
" move to split to the right
nnoremap <C-L> <C-W><C-L>
" move to split to the left
nnoremap <C-H> <C-W><C-H>

call togglebg#map("<F5>")

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

if has('gui_running')
      set background=dark
        colorscheme solarized
    else
          colorscheme zenburn
      endif

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

com! Fjson %!python -m json.tool

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" enable all Python syntax highlighting features
let python_highlight_all = 1
syntax on

au BufWinLeave * mkview
au BufWinEnter * silent loadview

autocmd BufWritePost *.py call Flake8()

