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
"Plug 'sheerun/vim-polyglot'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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
Plug 'm00qek/completion-conjure'
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-salve'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fireplace'
Plug 'clojure-vim/clojure.vim'
Plug 'jrdoane/vim-clojure-highlight'
" structural edition
Plug 'guns/vim-sexp', { 'for': 'clojure' } | Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
call plug#end()

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set t_Co=256

" Theme
syntax on
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

nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>

nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gA <cmd>lua vim.lsp.buf.code_action()<CR>

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

" telescope keybindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

command! ReloadVimrc :source $MYVIMRC " Reload vimrc config
command! Vimrc :vs $MYVIMRC           " opens vim config anywhere

function! FormatJSON()
:%!python -m json.tool
endfunction

" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

" autocmd Syntax clojure EnableSyntaxExtensios

autocmd VimEnter *       RainbowToggle
autocmd Syntax   clojure RainbowToggle
