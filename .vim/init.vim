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
Plug 'nvim-telescope/telescope-ui-select.nvim'

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

Plug 'Olical/conjure', {'tag': 'v4.30.1'}
Plug 'm00qek/completion-conjure'
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-salve'
Plug 'luochen1990/rainbow'
" structural edition
Plug 'guns/vim-sexp', { 'for': 'clojure' } | Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" use . to repeat plugin mappings
Plug 'tpope/vim-repeat'

" Open files on github
Plug 'ruanyl/vim-gh-line'

" git blame
Plug 'APZelos/blamer.nvim'
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
let g:blamer_enabled = 1

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
let g:completion_enable_auto_popup = 1
let g:completion_confirm_key = ""

" Copy the github link instead of open in the browser
let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '

""""""""""""""""""""""""""""""
" Key bindings

lua << EOF
local nvim_lsp = require('lspconfig')

-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
}
require("telescope").load_extension("ui-select")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- telescope
  buf_set_keymap('n', '<space>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  buf_set_keymap('n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'clojure_lsp' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" avoid breaking lines on completion confirm
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

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

" autocmd Syntax clojure EnableSyntaxExtensios

autocmd VimEnter *       RainbowToggle
autocmd Syntax   clojure RainbowToggle

lua << EOF
  vim.g.clojure_syntax_keywords = {
    clojureSpecial = {
      "defproject", "deftest", "defspec", "defflow", "defplugin", "s/deftest",
      "s/def", "s/defn", "s/defrecord", "s/defschema", "s/fn", "h/defc",
    },
    clojureMacro = { "testing", "is", "are", "fact", "facts", "flow", "s/with-fn-validation" }
  }

  vim.g.clojure_fuzzy_indent_patterns = {"^with", "^def", "^let", "^flow", "^fact", "^tabular" }

  vim.g.clojure_special_indent_words =
  "deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn" ..
  ",defplugin,p,div,dom,dom/p,dom/div"
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "clojure", "javascript", "json", "python", "regex", "php"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF
