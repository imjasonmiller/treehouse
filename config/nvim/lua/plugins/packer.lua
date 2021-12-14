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
  use 'LnL7/vim-nix'
  use 'editorconfig/editorconfig-vim'
  use 'tbastos/vim-lua' 

  -- Automatically set up the configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

