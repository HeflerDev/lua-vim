-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

map('n', '<leader>W', ':w<CR>')
map('n', '<leader>WQ', ':wq<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>Q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-T>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<leader>E', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>R', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>F', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

-- Git Commands
--map('n', '<leader>gs', ':Gitsigns show<CR>')
--map('n', '<leader>gr', ':Gitsigns refresh<CR>')
--map('n', '<leader>gb', ':Gitsigns blame_line<CR>')
map('n', '<leader>gd', ':Gitsigns diffthis<CR>')
map('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
map('n', '<leader>gn', ':Gitsigns next_hunk<CR>')
map('n', '<leader>gp', ':Gitsigns prev_hunk<CR>')
map('n', '<leader>gg', ':Git<CR>')
map('n', '<leader>gc', ':Git commit<CR>')

--map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>ft', ':Telescope help_tags<CR>')

map('n', '<F12>', ':Mason<CR>')

--[[ Terminal ]]
map('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
