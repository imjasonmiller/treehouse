-- Ensure packer is installed 
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
end

-- Install plugins
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color schemes
  use 'christianchiarulli/nvcode-color-schemes.vim'

  -- Status line
  use { 
    'nvim-lualine/lualine.nvim',
    config = function()
      require('plugins.configs.lualine')
    end
  }

  -- Syntactic language support
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugins.configs.treesitter')
    end,
    run = ':TSUpdate'
  }
  use 'editorconfig/editorconfig-vim'
  use 'LnL7/vim-nix'
  use 'tbastos/vim-lua' 
  use 'rust-lang/rust.vim'
  use 'posva/vim-vue' 
  use 'cespare/vim-toml' 
  use 'stephpy/vim-yaml' 

  -- Debug tools while creating themes
  use 'nvim-treesitter/playground'
  use '~/Work/github-primer-color-schemes.nvim'

  -- Rust tools
  use {
    'simrat39/rust-tools.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
  }

  -- Editor enhancements
  use 'tpope/vim-unimpaired'          -- Useful bracket mapping

  -- Enhanced commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Indentation guides
  use {
    'lukas-reineke/indent-blankline.nvim', 
    config = function()
      require('indent_blankline').setup()
    end
  }

  -- Git decorations
  use {
    'lewis6991/gitsigns.nvim',
     requires = {
       'nvim-lua/plenary.nvim'
     },
     config = function()
       require('gitsigns').setup()
     end
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function()
      require('plugins.configs.telescope')
    end
  }

  -- Language Server Protocol support 
  use 'neovim/nvim-lspconfig'
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      require('plugins.configs.lsp_installer')
    end
  }

  -- Completion support
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.configs.nvim_cmp')
    end
  }

  -- Debugging support
  use 'mfussenegger/nvim-dap'

  -- Completion sources for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'         
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'             
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Add pictograms to completion sources
  use 'onsails/lspkind-nvim'

  -- Automatically set up the configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

