local lsp = require("lsp-zero")
local autocmd = vim.api.nvim_create_autocmd

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    local buf_set_keymap = vim.keymap.set

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
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

    -- telescope
    buf_set_keymap('n', '<space>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
    buf_set_keymap('n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
    buf_set_keymap('n', '<space>fs', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
end)

lsp.nvim_workspace()

lsp.setup()

autocmd({ "BufEnter", "InsertLeave" }, {
    callback = function() vim.lsp.codelens.refresh() end
})
