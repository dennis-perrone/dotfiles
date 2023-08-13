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
  use ({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'akinsho/bufferline.nvim'
  use 'ekickx/clipboard-image.nvim'

  -- Keep this at the end. Required for Packer to bootstrap properly.
  if packer_bootstrap then
    require('packer').sync()
  end
end)

