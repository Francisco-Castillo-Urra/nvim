vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.mouse = a
vim.opt.number = true
vim.g.mapleader = " "
require('plugins/packer')
require('general')
require('NvimTree')
require('Feline')
require('coc')
require('Tabby')
require('NightFox')
