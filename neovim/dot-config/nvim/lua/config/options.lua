-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Conjure
vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"] = 0
vim.g["conjure#log#botright"] = true
vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = { "deftest", "defflow" }

vim.keymap.set("n", "<localeader>tc", vim.cmd.ConjureCljRunCurrentTest, { noremap = true })
