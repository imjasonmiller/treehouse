local maps = require("maps")

-- Import remap binding
local nmap = maps.nmap
local nnoremap = maps.nnoremap
local noremap = maps.noremap
local vmap = maps.vmap
local vnoremap = maps.vnoremap

vim.cmd('colorscheme gruvbox')				-- Use gruvbox colorscheme

o.syntax = "on"
o.hidden = true  					-- Do not unload a buffer when it is abandoned
o.mouse = o.mouse .. "a" 				-- Enable mouse usage for all modes

wo.foldenable = false 					-- Disable code folding

-- Indentation
vim.cmd("filetype plugin indent on") 			-- Load plugin files for filetypes
o.shiftwidth = 2					-- Auto-indentation of two spaces
o.tabstop = 2						-- Tab width of two spaces
o.expandtab = true					-- Expand tabs to spaces

-- Columns
o.signcolumn = "yes"					-- Always draw the sign column to prevent buffer movement
wo.relativenumber = true				-- Display relative line numbers
wo.number = true 					-- Display current line number

-- Performance
o.synmaxcol = 1000					-- Disable syntax highlighting on long lines
o.lazyredraw = true					-- Disable updates during non-typed commands, e.g. macros

-- Status line improvements
o.laststatus = 2					-- Always display the status line
o.shortmess = o.shortmess .. "c"			-- Do not display ins-completion messages

-- Wrapping
o.formatoptions = o.formatoptions .. "tc" 		-- Wrap text and comments using textwidth
o.formatoptions = o.formatoptions:gsub("o", "") 	-- Do not insert comment leader on pressing 'o' or 'O' in normal mode
wo.colorcolumn = "80" 					-- Highlight lines past col 80
o.scrolloff = 2						-- Minimum lines to keep below and above cursor

-- Completion
o.completeopt = "noinsert,menuone,noselect"
o.inccommand = "nosplit"				-- Incremental updates while performing substition

-- Search improvements
o.ignorecase = true 					-- Ignore casing in searches
o.incsearch = true  					-- Show search pattern matches
o.smartcase = true  					-- Override ignorecase if pattern contains uppercase
o.gdefault = true   					-- Substitute all matches on a line

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
vim.cmd([[ au Filetype rust set colorcolumn=100 ]])

-- Highlight yanking
vim.cmd([[
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END
]])

-- No line numbers in terminal mode
vim.cmd([[au TermOpen * setlocal nonumber norelativenumber]])

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
nnoremap('<leader>ff', tb .. 'find_files()<cr>')
nnoremap('<leader>fe', tb .. 'file_browser()<cr>')
nnoremap('<leader>fg', tb .. 'live_grep()<cr>')
nnoremap('<leader>fb', tb .. 'buffers()<cr>')
nnoremap('<leader>fh', tb .. 'help_tags()<cr>')
nnoremap('<leader>la', tb .. 'lsp_code_actions()<cr>')
