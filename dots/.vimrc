syntax on
let g:gruvbox_italic='1'
set background=dark

set termguicolors
set mouse=a
set cursorline
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~./vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plugins
call plug#begin()
Plug 'morhetz/gruvbox'  
call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox