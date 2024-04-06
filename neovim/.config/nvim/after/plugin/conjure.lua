require('cmp').setup{
  sources = {
    {name = 'conjure'},
  }
}

vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"] = 0
vim.g["conjure#log#botright"] = true
local baleia = require('baleia').setup { line_starts_at = 3 }

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local conjure_augroup = augroup("ConjureGroup", {})

local colorize_conjure_log = function (bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    baleia.automatically(bufnr)
end

autocmd('BufWinEnter', {
    group = conjure_augroup,
    pattern = "conjure-log-*",
    callback = function () colorize_conjure_log() end
})
