" This is my neovim configuration
"
" References
"
" https://github.com/piiih/vimfiles
" https://github.com/thalesmello/vimfiles
" https://github.com/devdrops/my-dotfiles
" https://github.com/thalesmello/slides/tree/master/2017/neovim-from-scratch
"

call plug#begin()
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" theme
Plug 'mhartington/oceanic-next'

" better sintax highlight
Plug 'sheerun/vim-polyglot'

" better statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git management plugin
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" auto complete for "{[(
Plug 'jiangmiao/auto-pairs'

" php code sniffer
" Plug 'joonty/vim-phpqa'

call plug#end()

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

set number
set relativenumber
set hidden
set expandtab
set clipboard=unnamed
set wrapscan
set display=lastline
set cursorline          " add guideline 
set showmatch           " highlight matching [{()}]
set wildmenu
set wildmode=longest:full,full
set noswapfile
set shiftwidth=4
set inccommand=split

let mapleader="\<space>"
let g:netrw_banner=0

" better esc
inoremap jk <ESC>
nnoremap <leader>; A;<esc>
nnoremap <leader>w :w<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" sublime fuzzyfinder like
map <C-p> :call fzf#run({'sink': 'e'})<CR>
nnoremap <silent> <C-t> :call fzf#run({'sink':'tabe','down':'30%'})<CR>

inoremap <leader>; <ESC>A;
