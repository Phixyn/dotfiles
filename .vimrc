syntax on
" https://github.com/dracula/vim
color dracula
set smartindent
set shiftwidth=4
set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tab to spaces
set autoindent
set number
set numberwidth=4
set cursorline
set showmatch " highlight matching brackets
set incsearch " search as characters are entered
set hlsearch " highlight search matches

" ctrl-p
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_show_hidden=1
" ctrl-p plugin shortcuts
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-airline
" Use when vim-airline is present
set noruler
set noshowmode
set laststatus=2

let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''

" Move between buffers
map <C-j> <Esc>:bprev<CR>
map <C-k> <Esc>:bnext<CR>

" Nerd Tree
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
