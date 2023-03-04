return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'
        use 'kyazdani42/nvim-web-devicons'
        use 'kyazdani42/nvim-tree.lua'
        use 'lukas-reineke/indent-blankline.nvim'
        use {'neoclide/coc.nvim',branch='release'}
        use 'feline-nvim/feline.nvim'
        use 'nvim-treesitter/nvim-treesitter'
        use 'windwp/nvim-autopairs'
        use 'christoomey/vim-tmux-navigator'
        use 'EdenEast/nightfox.nvim'
        use 'nanozuki/tabby.nvim'
        use {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}
end)
