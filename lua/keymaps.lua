-- Mapping space to be the leader key. The leader key is used in key maps and will need
-- to be pressed first before the key combination. The g is used to declare a global
-- variable called "mapleader". The "g" is a vim global and not a Lua global or part of
-- the options.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap
keymap.set("n", "<leader>ee", ":Lexplore<CR>", { desc = "Opens the file browser to the left of the window." })
--
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
--
-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Tab movement
vim.keymap.set("n", "<M-Right>", "<cmd>tabnext<CR>", { desc = "Moves to the next tab." })
vim.keymap.set("n", "<M-Left>", "<cmd>tabprev<CR>", { desc = "Moves to the next tab." })

-- Opens a terminal window at the bottom
vim.keymap.set("n", "<leader>1", function()
    vim.cmd.new()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end)

-- Keymap to leave terminal easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
