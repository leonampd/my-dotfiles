local vscode = require('vscode')

vim.notify = vscode.notify

vim.keymap.set('n', 'gD', "<cmd>lua require('vscode').action('editor.action.revealDefinitionAside')<CR>", {noremap = true})
vim.keymap.set('n', "<space>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>", {noremap = true})
vim.keymap.set('n', "<C-i>", "<cmd>lua require('vscode').action('workbench.action.navigateForward')<CR>", {noremap = true})
vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.keymap.set('n', '<space>w', "<cmd>lua require('vscode').action('workbench.action.files.saveAll')<CR>", {noremap = true})
vim.keymap.set('n', '<space>q', "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>", {noremap = true})