set nocompatible

syntax on

"set background=dark
"colorscheme zaibatsu
"colorscheme slate

set expandtab
set tabstop=4
set shiftwidth=4

set smartindent

set hlsearch
set incsearch

set ignorecase
set smartcase

set mouse=a

set number

set showmatch
set textwidth=140

set wrap

set wildmode=longest:list
set wildmenu

set tags=./tags,tags;$HOME

"set statusline+=%F
"set laststatus=2

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'ghifarit53/tokyonight-vim'
Plug 'menisadi/kanagawa.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin', 'branch': 'main' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rudism/vim-wombat'
Plug 'joshdick/onedark.vim'
Plug 'crusoexia/vim-monokai'
Plug 'phanviet/vim-monokai-pro'
Plug 'tomasiser/vim-code-dark'
Plug 'patstockwell/vim-monokai-tasty'

call plug#end()

let NERDTreeShowHidden=1

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

set background=dark

"colorscheme vim-monokai-tasty
"colorscheme codedark
"colorscheme monokai
"colorscheme kanagawa
colorscheme catppuccin_mocha
"colorscheme wombat 
"colorscheme onedark 

