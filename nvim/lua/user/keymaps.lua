-- Keymaps

-- Modes
-- n: normal_mode
-- i: insert_mode
-- v: visual_mode
-- x: visual_block_mote
-- t: term_mode
-- c: command_mode

-- Set base opts and term_opts
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten the function name
local keymap = vim.api.nvim_set_keymap

-- Remap the leader key to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- --------------------------
-- Normal Mode
-- --------------------------
-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<S-Left>", ":bprevious<CR>", opts)

-- General remaps
keymap("n", "<leader>w", ":w<cr>", opts)
keymap("n", "<leader>fs", "z=", opts)
keymap("n", "<leader>s", ":set spell!<cr>", opts)
keymap("n", "<leader>y", "*y", opts)
keymap("n", "<leader>p", "*p", opts)
keymap("n", "<leader>Y", "+y", opts)
keymap("n", "<leader>P", "+p", opts)

-- Telescope
keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap('n', '<leader>fw', "<cmd>lua require('telescope.builtin').live_grep({search_dirs = {'~/wiki'}})<cr>", opts)
keymap('n', '<leader>fn', "<cmd>lua require('telescope.builtin').live_grep({search_dirs = {'~/wiki/public'}})<cr>", opts)
keymap('n', '<leader>fm', "<cmd>lua require('telescope.builtin').live_grep({search_dirs = {'~/wiki/private'}})<cr>", opts)
--keymap('n', '<leader>fw', "<cmd>lua require('telescope.builtin').live_grep({search_dirs = {'~/wiki'}})<cr>", opts)
--keymap('n', '<leader>fn', "<cmd>lua require('telescope.builtin').live_grep({search_dirs = {'~/wiki/notes'}})<cr>", opts)
--keymap('n', '<leader>fm', "<cmd>lua require('telescope.builtin').live_grep({search_dirs = {'~/wiki/meeting-notes'}})<cr>", opts)

-- Vimwiki
keymap('n', '<leader>tc', ":VimwikiTOC<cr>", opts)

-- NerdTree
--keymap('n', '<leader>n', ":NERDTreeToggle<cr>", opts)
--keymap('n', '<C-f>', ":NERDTreeFind<cr>", opts)

-- Nvim Tree
keymap('n', '<leader>n', ":NvimTreeToggle<cr>", opts)
keymap('n', '<leader>nf', ":NvimTreeFind<cr>", opts)

-- Markdown Preview
keymap('n', '<leader>mp', ":MarkdownPreviewToggle<cr>", opts)

-- Clipboard Paste Image
keymap('n', '<leader>pi', ":PasteImg<cr>", opts)

-- Calling Functions
keymap('n', '<leader>wa', ":call VimwikiFindAllIncompleteTasks()<cr>", opts)
keymap('n', '<leader>wx', ":call VimwikiFindIncompleteTasks()<cr>", opts)
