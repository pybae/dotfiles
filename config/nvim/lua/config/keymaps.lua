vim.opt.number = true           -- Line numbers
vim.opt.relativenumber = true   -- Relative line numbers
vim.opt.mouse = 'a'             -- Enable mouse
vim.opt.ignorecase = true       -- Case insensitive search
vim.opt.smartcase = true        -- Unless uppercase is used
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.shiftwidth = 2          -- Indent width
vim.opt.tabstop = 2             -- Tab width
vim.opt.termguicolors = true    -- True color support

local keymap = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap({'n', 'v'}, ';', ':', { desc = 'Command mode' })
keymap({'n', 'v'}, ':', ';', { desc = 'Repeat f/t' })
keymap({'n', 'v'}, '<leader>f', '<cmd>lua require("fzf-lua").files()<CR>', { desc = 'Find files' })
keymap({'n', 'v'}, '<leader>g', '<cmd>lua require("fzf-lua").live_grep()<CR>', { desc = 'Ripgrep' })
keymap({'n', 'v'}, '<leader>e', '<cmd>lua require("fzf-lua").buffers()<CR>', { desc = 'Recent buffers' })
keymap({'n', 'v'}, '<leader>p', '<cmd>lua require("fzf-lua").commands()<CR>', { desc = 'Commands' })

