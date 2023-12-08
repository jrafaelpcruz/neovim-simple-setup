set number "numbers on the left
set relativenumber "relative numers for navegation
set autoindent
set shiftwidth=4
set tabstop=4
set smarttab
set softtabstop=4
set expandtab
set mouse=v
set mouse=a
set showmatch
set hlsearch
syntax on
set clipboard=unnamedplus
filetype plugin on
set nocompatible
set ttyfast

call plug#begin()
    Plug 'vim-airline/vim-airline' "Status bar
    Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' "Developer Icons
    Plug 'tpope/vim-commentary' "Commenting gcc & gc
    Plug 'tpope/vim-surround' "Surrounding ysw)
    Plug 'ap/vim-css-color' "CSS color preview
    Plug 'preservim/tagbar' "navigation bar
    Plug 'neoclide/coc.nvim' "auto completion
    Plug 'christoomey/vim-tmux-navigator' "seamless nvim/tmux navigation
call plug#end()

" Nerdtree keybinds:
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" More natural split navigation:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" configuration file for coc
source $HOME/.config/nvim/plug-config/coc.vim
:set completeopt-=preview "For no Previews
:set autochdir "terminal buffers will open on the work directory

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
