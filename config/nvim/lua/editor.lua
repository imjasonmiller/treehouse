local maps = require("utils.maps")

-- Import remap binding
local nmap = maps.nmap
local nnoremap = maps.nnoremap
local noremap = maps.noremap
local vmap = maps.vmap
local vnoremap = maps.vnoremap

o.termguicolors = true                            -- Enable 24-bit RGB color

g.tokynight_italic_functions = true               -- Italicize function names
g.tokynight_italic_variables = true               -- Italicize variable names
vim.cmd[[colorscheme tokyonight-night]]           -- Enable tokynight-night colorscheme

o.syntax = "on"
o.hidden = true  					                        -- Do not unload a buffer when it is abandoned
o.mouse = o.mouse .. "a" 				                  -- Enable mouse usage for all modes
o.ls = 0                                          -- Set last status height to `0`
o.ch = 0                                          -- Set command height to `0`

wo.foldenable = false 					                  -- Disable code folding

-- Indentation
vim.cmd("filetype plugin indent on") 			        -- Load plugin files for filetypes
o.shiftwidth = 2					                        -- Auto-indentation of two spaces
o.tabstop = 2						                          -- Tab width of two spaces
o.expandtab = true					                      -- Expand tabs to spaces

-- Columns
o.signcolumn = "yes"					                    -- Always draw the sign column to prevent buffer movement
wo.relativenumber = true				                  -- Display relative line numbers
wo.number = true 					                        -- Display current line number
o.cursorline = true                               -- Highlight current cursor line
o.cursorlineopt = "number"                        -- Highlight only current line number

-- Performance
o.synmaxcol = 1000					                      -- Disable syntax highlighting on long lines
o.lazyredraw = true					                      -- Disable updates during non-typed commands, e.g. macros

-- Status line improvements
o.laststatus = 3					                        -- Use a global status line
o.shortmess = o.shortmess .. "c"			            -- Do not display ins-completion messages

-- Wrapping
o.formatoptions = o.formatoptions .. "tc"         -- Wrap text and comments using textwidth
o.formatoptions = o.formatoptions:gsub("o", "") 	-- Do not insert comment leader on pressing 'o' or 'O' in normal mode
wo.colorcolumn = "80" 					                  -- Highlight lines past col 80
o.scrolloff = 2						                        -- Minimum lines to keep below and above cursor

-- Completion
o.completeopt = "noinsert,menuone,noselect"
o.inccommand = "nosplit"				                  -- Incremental updates while performing substition

-- Search improvements
o.ignorecase = true 					                    -- Ignore casing in searches
o.incsearch = true  					                    -- Show search pattern matches
o.smartcase = true  					                    -- Override ignorecase if pattern contains uppercase
o.gdefault = true   					                    -- Substitute all matches on a line

-- Disable backups
g.nobackup = true
g.noswapfile = true
g.nowritebackup = true

-- Use clipboard for all operations instead of `+` and/or `*` registers
o.clipboard = o.clipboard .. 'unnamedplus'

------------------
-- Autocommands --
------------------
-- Rust code style guidelines
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "rust",
  callback = function() 
    wo.colorcolumn = "100" 					            -- Highlight lines past col 100
  end,
})

-- Highlight yanking
local highlightYankGroup = vim.api.nvim_create_augroup(
  "highlight_yank",
  { clear = true }
)
vim.api.nvim_create_autocmd('TextYankPost', {
  group = "highlight_yank",
  pattern = "*",
  callback = function() vim.highlight.on_yank({ on_visual = true }) end,
})

-- Remove line numbers in terminal mode, start it in insert mode and delete the
-- buffer when it is no longer displayed
vim.api.nvim_create_augroup("TerminalMode", {})
vim.api.nvim_create_autocmd("TermOpen", {
  group = "TerminalMode",
  pattern = "*",
  callback = function()
    wo.number = false                           -- Hide line numbers
    wo.relativenumber = false                   -- Hide relative line number
    vim.api.nvim_command("startinsert")
  end,
})
vim.api.nvim_create_autocmd("TermLeave", {
  group = "TerminalMode",
  pattern = "term://*",
  callback = function()
    vim.opt.bufhidden = "delete"
  end,
})

------------
-- Remaps --
------------
g.mapleader = " "					-- Remap leader to <Space>

-- Map <ctrl + c> and <ctrl + j> to <esc>
inoremap('<C-j>', '<Esc>')
vnoremap('<C-j>', '<Esc>')
inoremap('<C-c>', '<Esc>')
vnoremap('<C-c>', '<Esc>')

-- Disable arrow keys and force yourself to use the home row
nnoremap('<up>', '<nop>')
nnoremap('<down>', '<nop>')
inoremap('<up>', '<nop>')
inoremap('<down>', '<nop>')
inoremap('<left>', '<nop>')
inoremap('<right>', '<nop>')

-- Jump to start and end of line using the home row keys
noremap('H', '^')
noremap('L', '$')

-- Switch between current and previous buffer using <leader>
nnoremap('<leader><leader>', '<C-^>')

-- Switch buffer using <left> and <right>
nnoremap('<left>', ':bp<CR>')
nnoremap('<right>', ':bn<CR>')

-- Center search results
nnoremap_silent('n', 'nzz')
nnoremap_silent('N', 'Nzz')
nnoremap_silent('*', '*zz')
nnoremap_silent('#', '3zz')
nnoremap_silent('g*', 'g*zz')

-- Quick save
nmap('<leader>w', ':w<CR>')

-- Move a single selected line in normal mode using <alt + j> or <alt + k>
nmap('<A-j>', ']e')
nmap('<A-k>', '[e')

-- Move multiple selected lines in visual mode using <alt + j> or <alt + k>
vmap('<A-j>', ']egv')
vmap('<A-k>', '[egv')

---------------
-- Telescope --
---------------
local tb = "<cmd>lua require('telescope.builtin')."
local te = "<cmd>lua require('telescope').extensions."
nnoremap('<leader>ff', tb .. 'find_files()<cr>')
nnoremap('<leader>fe', te .. 'file_browser.file_browser()<cr>')
nnoremap('<leader>fg', tb .. 'live_grep()<cr>')
nnoremap('<leader>fb', tb .. 'buffers()<cr>')
nnoremap('<leader>fh', tb .. 'help_tags()<cr>')
nnoremap('<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')

-----------------
-- Diagnostics --
-----------------
nnoremap('<leader>dd', '<cmd> lua vim.diagnostic.open_float() <CR>')
