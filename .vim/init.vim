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

" highlights unwanted spaces
Plug 'ntpeters/vim-better-whitespace'

" emmet
Plug 'mattn/emmet-vim'

"vim highlight words
Plug 'lfv89/vim-interestingwords'

" plugin to use gist inside vim
Plug 'mattn/vim-gist'
Plug 'mattn/webapi-vim'

" WakaTime
Plug 'wakatime/vim-wakatime'

Plug 'metakirby5/codi.vim'

" Vim smart as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" clojure
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'luochen1990/rainbow'
call plug#end()

" Enable vim-iced's default key mapping
let g:iced_enable_default_key_mappings = v:true

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
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

let mapleader="\<space>"
let g:netrw_banner=0

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
