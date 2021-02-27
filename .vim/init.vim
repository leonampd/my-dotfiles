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
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" theme
Plug 'morhetz/gruvbox'

" better statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git management plugin
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" auto complete for "{[(
Plug 'jiangmiao/auto-pairs'

" highlights unwanted spaces
Plug 'ntpeters/vim-better-whitespace'

"vim highlight words
Plug 'lfv89/vim-interestingwords'

" WakaTime
Plug 'wakatime/vim-wakatime'

Plug 'metakirby5/codi.vim'

Plug 'Olical/conjure', {'tag': 'v4.14.1'}
call plug#end()

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set t_Co=256

" Theme
syntax enable
filetype plugin indent on
colorscheme gruvbox
set background=dark

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

" Setup LSP
lua << EOF
  require'lspconfig'.clojure_lsp.setup{ on_attach=require'completion'.on_attach }
EOF

" set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
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
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set ruler
set colorcolumn=81
set signcolumn=yes

let mapleader="\<space>"
let maplocalleader=','
let g:netrw_banner=0
let g:rainbow_active = 1

let g:conjure#mapping#def_word = "gd"
let g:conjure#mapping#doc_word = "K"
let g:conjure#log#botright = "true"
" use static analysis engine to autocomplete, but get results also from REPL
" if it is available
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = {'clojure': [{'complete_items': ['conjure', 'lsp', 'snippet']}]}
" Set completion list to match using fuzzy strategy
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

""""""""""""""""""""""""""""""
" Key bindings

" better esc
inoremap jk <ESC>

" better write
nnoremap <leader>w :w<CR>

" better quit
nnoremap <leader>q :q<CR>

" togggle rainbow
nmap <silent> <leader>rp :RainbowToggle<R>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" sublime fuzzyfinder like
map <C-p> :call fzf#run({'sink': 'e'})<CR>
nnoremap <silent> <C-t> :call fzf#run({'sink':'tabe','down':'30%'})<CR>

command! ReloadVimrc :source $MYVIMRC " Reload vimrc config
command! Vimrc :vs $MYVIMRC           " opens vim config anywhere

function! FormatJSON()
:%!python -m json.tool
endfunction
