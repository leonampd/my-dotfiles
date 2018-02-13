" ##################
" ##
" ## My vimrc confs
" ## some copy pastes from devdrops/my-dotfiles xD
" ##
" ## References
" ## - https://dougblack.io/words/a-good-vimrc.html
" ## - http://ctrlpvim.github.io/ctrlp.vim/
" ##################


syntax on
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set number
set relativenumber
set wrapscan
set display=lastline
set cursorline          " add guideline 
set showmatch           " highlight matching [{()}]
set wildmenu
set wildmode=longest:full,full
set noswapfile

" jk is escape (from @piiih)
inoremap jk <ESC>

" :::::::::: Netrw Settings ::::::::::
let g:netrw_banner=0              " Remove netrw banner.


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' 

call plug#end()

map <C-p> :call fzf#run({'sink': 'e'})<CR>
nnoremap <silent> <C-t> :call fzf#run({'sink':'tabe','down':'30%'})<CR>
