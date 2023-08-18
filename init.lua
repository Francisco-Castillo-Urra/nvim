vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.mouse = a
vim.opt.number = true
vim.opt.showmode = false
vim.g.mapleader = " "
require('plugins/packer')
require('NvimTree')
require('theme')
require('coc')
vim.cmd('source $HOME/AppData/Local/nvim/lua/lightline.vim')
