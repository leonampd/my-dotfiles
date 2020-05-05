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
Plug 'morhetz/gruvbox'

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

" highlights unwanted spaces
Plug 'ntpeters/vim-better-whitespace'

" emmet
Plug 'mattn/emmet-vim'

"vim highlight words
Plug 'lfv89/vim-interestingwords'

" plugin to use gist inside vim
Plug 'mattn/vim-gist'
Plug 'mattn/webapi-vim'

" NerdTree
Plug 'preservim/nerdtree'

" WakaTime
Plug 'wakatime/vim-wakatime'
call plug#end()

"NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-f> :NERDTreeFocus<CR>
map <C-n> :NERDTreeToggle<CR>

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set t_Co=256

" Theme
syntax enable
colorscheme gruvbox
set background=dark

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

set number
set relativenumber
set hidden
set expandtab
set clipboard=unnamedplus
set wrapscan
set display=lastline
set cursorline          " add guideline 
set showmatch           " highlight matching [{()}]
set wildmenu
set wildmode=longest:full,full
set noswapfile
set shiftwidth=4
set inccommand=split
set nowrap

let mapleader="\<space>"
let g:netrw_banner=0

" better esc
inoremap jk <ESC>
nnoremap <leader>; A;<esc>
nnoremap <leader>w :w<CR>

" better :quit
nnoremap <leader>q :q<CR>

" better close file
nnoremap <leader>c :Ex<CR>

nnoremap <leader>sv :source $MYVIMRC<CR>

" sublime fuzzyfinder like
map <C-p> :call fzf#run({'sink': 'e'})<CR>
nnoremap <silent> <C-t> :call fzf#run({'sink':'tabe','down':'30%'})<CR>

inoremap <leader>; <ESC>A;

" Open nvim config - init.vim
nnoremap <C-g> :tabe ~/.config/nvim/init.vim<CR>
