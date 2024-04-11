-- [[ Setting basic keymaps ]]

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- File keymaps
vim.keymap.set('n', '<leader>fw', ':w<CR>', { desc = 'Save current file', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fa', ':wa<CR>', { desc = 'Save all files', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fq', ':wqa<CR>', { desc = 'Save all files and quit', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fe', ':Ex<CR>', { desc = 'Go to the File Explorer', noremap = true, silent = true })

-- Tool keymaps
vim.keymap.set('n', '<leader>tll', ':Lazy<CR>', { desc = 'Open Lazy', noremap = true, silent = true })
vim.keymap.set('n', '<leader>tlu', ':Lazy update<CR>', { desc = 'Lazy update', noremap = true, silent = true })
vim.keymap.set('n', '<leader>tmm', ':Mason<CR>', { desc = 'Open Mason', noremap = true, silent = true })
vim.keymap.set('n', '<leader>tmu', ':MasonUpdate<CR>', { desc = 'Mason update', noremap = true, silent = true })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
