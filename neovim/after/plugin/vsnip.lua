vim.keymap.set({"i", "s"}, "C-j", function ()
   return '<Plug>(vsnip-expand)'
end, { noremap = false, expr = true })

vim.keymap.set({"i", "s"}, "C-l", function ()
   return '<Plug>(vsnip-expand-or-jump)'
end, { noremap = false, expr = true})

