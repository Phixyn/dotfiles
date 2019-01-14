syntax on
" https://github.com/dracula/vim
color dracula
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set number
set numberwidth=4
set cursorline
set showmatch " highlight matching brackets
set incsearch " search as characters are entered
set hlsearch " highlight search matches

" Nerd Tree toggling
" https://github.com/scrooloose/nerdtree
map <C-b> :NERDTreeToggle<CR>
" Auto quit if only Nerd Tree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l

" Start pathogen
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
call pathogen#helptags()
