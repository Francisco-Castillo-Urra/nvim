vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.mouse = a
vim.opt.number = true

vim.g.mapleader = " "

vim.api.nvim_set_keymap('','<C-n>','<NvimTreeToggle>', {noremap = true})
require('plugins/packer')
require('general')
require('NvimTree')
require('Feline')
require('coc')
require('Tabby')
require('NightFox')
