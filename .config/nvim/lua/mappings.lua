require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "Mode enter command mode" })
map("i", "jk", "<ESC>", { desc = "Mode enter normal mode"})

map("n", "<M-Up>", "<CMD> m-2 <CR>", { desc = "Linsel move up" })
map("n", "<M-Down>", "<CMD> m+1 <CR>", { desc = "Linsel move down" })
map("n", "<C-a>", "<CMD> a <CR>", { desc = "Linsel select all" })
map("n", "<M-p>", "yyp", { desc = "Linsel Duplicate"})

map("n", "<C-q>", "<CMD> q <CR>", { desc = "Quit single file" })
map("n", "<C-M-q>", "<CMD> qa <CR>", { desc = "Quit all file" })

map("v", "<", "<gv", { desc = "Tab left" })
map("v", ">", ">gv", { desc = "Tab right" })
