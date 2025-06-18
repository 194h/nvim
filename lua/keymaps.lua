-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Navigate buffers with control and hjkl in normal mode.
vim.keymap.set('n', '<C-h>', '<cmd>bp<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<C-l>', '<cmd>bn<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-j>', '<cmd>buffers<CR>', { desc = 'List buffers' })
vim.keymap.set('n', '<C-k>', '<cmd>buffer 1<CR>', { desc = 'First buffer' })

--  Use arrow keys to move within wrapped line
vim.keymap.set('n', '<left>', 'g0', { desc = 'Move to left end of screen, wrapped line (g0)' })
vim.keymap.set('n', '<right>', 'g$', { desc = 'Move to right end of screen, wrapped line(g$)' })
vim.keymap.set('n', '<down>', 'gj', { desc = 'Move down wrapped line (gj)' })
vim.keymap.set('n', '<up>', 'gk', { desc = 'Move up wrapped line (gk)' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
