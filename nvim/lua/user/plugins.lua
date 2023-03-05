-- Automatically install Packer if not present.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Install plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                             -- Packer

  use 'nvim-telescope/telescope.nvim'                      -- Search and find
  use 'nvim-lua/plenary.nvim'                              -- Useful Lua functions

  use 'kyazdani42/nvim-web-devicons'                       -- Icons for use on status line
  use 'nvim-lualine/lualine.nvim'                          -- Status line within nvim
  use 'vimwiki/vimwiki'                                    -- Vimwiki
  use 'airblade/vim-gitgutter'                             -- Git Gutter

  use 'gruvbox-community/gruvbox'                          -- Gruvbox colorscheme

  use 'nvim-tree/nvim-tree.lua'                            -- Nvim Tree

--  use {                                                    -- Telescope and Plenary
--    'nvim-telescope/telescope.nvim', tag = '0.1.0',
--   requires = { {'nvim-lua/plenary.nvim'} }
--  }

--  use {                                                    -- Statusline and Icons
--    'nvim-lualine/lualine.nvim',
--    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
--  }
  

  -- Keep this at the end. Required for Packer to bootstrap properly.
  if packer_bootstrap then
    require('packer').sync()
  end
end)

