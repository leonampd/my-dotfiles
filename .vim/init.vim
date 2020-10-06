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

" easy align
Plug 'junegunn/vim-easy-align'

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

" highlights unwanted spaces
Plug 'ntpeters/vim-better-whitespace'

"vim highlight words
Plug 'lfv89/vim-interestingwords'

" WakaTime
Plug 'wakatime/vim-wakatime'

Plug 'metakirby5/codi.vim'

" Vim smart as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-highlight', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'iamcco/coc-vimlsp', { 'do': 'yarn install --frozen-lockfile && yarn build' }

"""""""""""" Clojure
Plug 'luochen1990/rainbow'

" structural editing
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'Olical/conjure', {'for' : 'clojure' }
Plug 'tpope/vim-dispatch', { 'for' : 'clojure' }
Plug 'clojure-vim/vim-jack-in', { 'for' : 'clojure' }
Plug 'radenling/vim-dispatch-neovim', { 'for' : 'clojure' }
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

""""""""""""""""""""""""""
" Coc
let g:coc_global_extensions = ['coc-json', 'coc-conjure', 'coc-vimlsp']
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = ' '
let airline#extensions#coc#warning_symbol = ' '

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHoldI * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

""""""""""""""""""""""""""""""
"Key bindings
inoremap jk <ESC>
nnoremap <leader>w :w<CR> " write file
nnoremap <leader>q :q<CR> " better quit

" togggle rainbow
nmap <silent> <leader>rp :RainbowToggle<R> " toggles rainbow plugin

xmap ga <Plug>(EasyAlign) " Start interactive EasyAlign in visual mode (e.g. vipga)
nmap ga <Plug>(EasyAlign) " Start interactive EasyAlign for a motion/text object (e.g. gaip)

" sublime fuzzyfinder like
map <C-p> :call fzf#run({'sink': 'e'})<CR>                               " opens fuzzyfinder in current buffer
nnoremap <silent> <C-t> :call fzf#run({'sink':'tabe','down':'30%'})<CR>  " open file in new tab

command! ReloadVimrc :source $MYVIMRC " Reload vimrc config
command! Vimrc :vs $MYVIMRC           " opens vim config anywhere
