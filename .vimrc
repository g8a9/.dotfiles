let mapleader = "-"

" Plugin Vim-plug
" Install with :PlugInstall
call plug#begin('~/.vim/plugins')
 
Plug 'morhetz/gruvbox'          " colorscheme
Plug 'junegunn/seoul256.vim'    " colorscheme
Plug 'itchyny/lightline.vim'    " status bar inferiore
Plug 'scrooloose/syntastic'     " syntax highlighting
Plug 'nvie/vim-flake8'          " PEP8 python code checking 
Plug 'scrooloose/nerdtree'      " project tree
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'         " preview colors with css
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vifm/vifm.vim'            " vim file system explorer

call plug#end()

" Style
set laststatus=2                " display statusbar
set noshowmode                  " hide status of the bottom-most bar 
let g:lightline = { 'colorscheme': 'seoul256' }
set colorcolumn=88
set cursorline
highlight ColorColumn ctermbg=0 guibg=lightgrey
highlight BadWhitespace ctermbg=red guibg=red
filetype on
syntax on

" let g:seoul256_background = 234
" colo seoul256    
colorscheme gruvbox
set background=dark     " has also light version


set backspace=2         " allows backspacing also with autoindent and other cases
set number              " line numbering
set numberwidth=4

" Tab and indentation
set expandtab           " tab come sequenza di spazi
set softtabstop=4
set tabstop=4           " dimensione tab
set shiftwidth=4        " dimensione di un'indentazione
set smartindent
set fileformat=unix
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set noerrorbells

function SetPEP8()      " used in python files
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent
    set fileformat=unix
endfunc

" Mapping
map <leader>s :source ~/.vimrc<cr>
map <Space> :EditVifm .<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Other
set splitright          " direzione dello split verticale
set splitbelow          " direzione dello split orizzontale
set hlsearch            " evidenzia le parole trovate 
set encoding=utf-8

" Enable folding
" set foldmethod=indent
" set foldlevel=99
" Enable folding with the spacebar
" nnoremap <space> za

" --------  Indentations
" Python
au BufNewFile,BufRead *.py call SetPEP8()
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/    " highlight bad whitespaces
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

" Python configs 
let python_highlight_all=1
syntax on

" NerdTree configuration
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " close vim if only NerdTree tab is left

" nvim compatibility
if !has('nvim')
    set ttymouse=xterm2
endif

let g:python3_host_prog = '/Users/giuseppe/miniconda3/bin/python'

" Relative line numbers
:set number

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
