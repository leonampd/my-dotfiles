if vim.g.vscode then
    -- VSCode extension
    require("leonampd.vscode")
else
    -- Neovim
    require("leonampd.packer")
    require("leonampd.set")
    require("leonampd.remap")
end