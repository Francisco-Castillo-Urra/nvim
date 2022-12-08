-- IndentBlankline {{{
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
-- }}}
-- TreeSitter {{{
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
-- }}}
-- AutoPairs {{{
require("nvim-autopairs").setup{}
-- }}}
<<<<<<< HEAD
-- Catpuccin {{{
require("catppuccin").setup({
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = false,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})
vim.cmd.colorscheme "catppuccin"
-- }}}
-- Feline {{{

--}}}
=======
-- NightFox {{{
-- Default options
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    module_default = true,  -- Default enable value for modules
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- setup must be called before loading
vim.cmd("colorscheme nightfox")
-- }}}
-- Feline {{{
-- Feline
-- https://github.com/EdenEast/nightfox.nvim/blob/main/mics/feline.lua
--
-- This file is a complete example of creating the feline configuration shown in the readme of
-- nightfox. This configuration generates its own highlight groups from the currently applied
-- colorscheme. These highlight groups are regenreated on colorscheme changes.
--
-- Required plugins:
--    - `feline-nvim/feline.nvim`
--    - `kyazdani42/nvim-web-devicons`
--
-- This file is required to be in your `lua` folder of your config.  Your colorscheme should also
-- be applied before this file is sourced. This file cannot be located `lua/feline.lua` as this
-- would clash with the actual plugin require path.
--
-- # Example:
--
-- ```lua
-- vim.cmd("colorscheme nightfox")
-- require('user.ui.feline')
-- ```
--
-- This assumes that this file is located at `lua/user/ui/feline.lua`

local fmt = string.format

----------------------------------------------------------------------------------------------------
-- Colors

---Convert color number to hex string
---@param n number
---@return string
local hex = function(n)
  if n then
    return fmt("#%06x", n)
  end
end

---Parse `style` string into nvim_set_hl options
---@param style string
---@return table
local function parse_style(style)
  if not style or style == "NONE" then
    return {}
  end

  local result = {}
  for token in string.gmatch(style, "([^,]+)") do
    result[token] = true
  end

  return result
end

---Get highlight opts for a given highlight group name
---@param name string
---@return table
local function get_highlight(name)
  local hl = vim.api.nvim_get_hl_by_name(name, true)
  if hl.link then
    return get_highlight(hl.link)
  end

  local result = parse_style(hl.style)
  result.fg = hl.foreground and hex(hl.foreground)
  result.bg = hl.background and hex(hl.background)
  result.sp = hl.special and hex(hl.special)

  return result
end

---Set highlight group from provided table
---@param groups table
local function set_highlights(groups)
  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

---Generate a color palette from the current applied colorscheme
---@return table
local function generate_pallet_from_colorscheme()
  -- stylua: ignore
  local color_map = {
    black   = { index = 0, default = "#393b44" },
    red     = { index = 1, default = "#c94f6d" },
    green   = { index = 2, default = "#81b29a" },
    yellow  = { index = 3, default = "#dbc074" },
    blue    = { index = 4, default = "#719cd6" },
    magenta = { index = 5, default = "#9d79d6" },
    cyan    = { index = 6, default = "#63cdcf" },
    white   = { index = 7, default = "#dfdfe0" },
  }

  local diagnostic_map = {
    hint = { hl = "DiagnosticHint", default = color_map.green.default },
    info = { hl = "DiagnosticInfo", default = color_map.blue.default },
    warn = { hl = "DiagnosticWarn", default = color_map.yellow.default },
    error = { hl = "DiagnosticError", default = color_map.red.default },
  }

  local pallet = {}
  for name, value in pairs(color_map) do
    local global_name = "terminal_color_" .. value.index
    pallet[name] = vim.g[global_name] and vim.g[global_name] or value.default
  end

  for name, value in pairs(diagnostic_map) do
    pallet[name] = get_highlight(value.hl).fg or value.default
  end

  pallet.sl = get_highlight("StatusLine")
  pallet.sel = get_highlight("TabLineSel")

  return pallet
end

---Generate user highlight groups based on the curent applied colorscheme
---
---NOTE: This is a global because I dont known where this file will be in your config
---and it is needed for the autocmd below
_G._generate_user_statusline_highlights = function()
  local pal = generate_pallet_from_colorscheme()

  -- stylua: ignore
  local sl_colors = {
    Black   = { fg = pal.black,   bg = pal.white },
    Red     = { fg = pal.red,     bg = pal.sl.bg },
    Green   = { fg = pal.green,   bg = pal.sl.bg },
    Yellow  = { fg = pal.yellow,  bg = pal.sl.bg },
    Blue    = { fg = pal.blue,    bg = pal.sl.bg },
    Magenta = { fg = pal.magenta, bg = pal.sl.bg },
    Cyan    = { fg = pal.cyan,    bg = pal.sl.bg },
    White   = { fg = pal.white,   bg = pal.black },
  }

  local colors = {}
  for name, value in pairs(sl_colors) do
    colors["User" .. name] = { fg = value.fg, bg = value.bg, bold = true }
    colors["UserRv" .. name] = { fg = value.bg, bg = value.fg, bold = true }
  end

  local status = vim.o.background == "dark" and { fg = pal.black, bg = pal.white } or { fg = pal.white, bg = pal.black }

  local groups = {
    -- statusline
    UserSLHint = { fg = pal.sl.bg, bg = pal.hint, bold = true },
    UserSLInfo = { fg = pal.sl.bg, bg = pal.info, bold = true },
    UserSLWarn = { fg = pal.sl.bg, bg = pal.warn, bold = true },
    UserSLError = { fg = pal.sl.bg, bg = pal.error, bold = true },
    UserSLStatus = { fg = status.fg, bg = status.bg, bold = true },

    UserSLFtHint = { fg = pal.sel.bg, bg = pal.hint },
    UserSLHintInfo = { fg = pal.hint, bg = pal.info },
    UserSLInfoWarn = { fg = pal.info, bg = pal.warn },
    UserSLWarnError = { fg = pal.warn, bg = pal.error },
    UserSLErrorStatus = { fg = pal.error, bg = status.bg },
    UserSLStatusBg = { fg = status.bg, bg = pal.sl.bg },

    UserSLAlt = pal.sel,
    UserSLAltSep = { fg = pal.sl.bg, bg = pal.sel.bg },
    UserSLGitBranch = { fg = pal.yellow, bg = pal.sl.bg },
  }

  set_highlights(vim.tbl_extend("force", colors, groups))
end

_generate_user_statusline_highlights()

vim.api.nvim_create_augroup("UserStatuslineHighlightGroups", { clear = true })
vim.api.nvim_create_autocmd({ "SessionLoadPost", "ColorScheme" }, {
  callback = function()
    _generate_user_statusline_highlights()
  end,
})

----------------------------------------------------------------------------------------------------
-- Feline

local vi = {
  -- Map vi mode to text name
  text = {
    n = "NORMAL",
    no = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    [""] = "V-BLOCK",
    c = "COMMAND",
    cv = "COMMAND",
    ce = "COMMAND",
    R = "REPLACE",
    Rv = "REPLACE",
    s = "SELECT",
    S = "SELECT",
    [""] = "SELECT",
    t = "TERMINAL",
  },

  -- Maps vi mode to highlight group color defined above
  colors = {
    n = "UserRvCyan",
    no = "UserRvCyan",
    i = "UserSLStatus",
    v = "UserRvMagenta",
    V = "UserRvMagenta",
    [""] = "UserRvMagenta",
    R = "UserRvRed",
    Rv = "UserRvRed",
    r = "UserRvBlue",
    rm = "UserRvBlue",
    s = "UserRvMagenta",
    S = "UserRvMagenta",
    [""] = "FelnMagenta",
    c = "UserRvYellow",
    ["!"] = "UserRvBlue",
    t = "UserRvBlue",
  },

  -- Maps vi mode to seperator highlight goup defined above
  sep = {
    n = "UserCyan",
    no = "UserCyan",
    i = "UserSLStatusBg",
    v = "UserMagenta",
    V = "UserMagenta",
    [""] = "UserMagenta",
    R = "UserRed",
    Rv = "UserRed",
    r = "UserBlue",
    rm = "UserBlue",
    s = "UserMagenta",
    S = "UserMagenta",
    [""] = "FelnMagenta",
    c = "UserYellow",
    ["!"] = "UserBlue",
    t = "UserBlue",
  },
}

local icons = {
  locker = "", -- #f023
  page = "☰", -- 2630
  line_number = "", -- e0a1
  connected = "", -- f817
  dos = "", -- e70f
  unix = "", -- f17c
  mac = "", -- f179
  mathematical_L = "𝑳",
  vertical_bar = "┃",
  vertical_bar_thin = "│",
  left = "",
  right = "",
  block = "█",
  left_filled = "",
  right_filled = "",
  slant_left = "",
  slant_left_thin = "",
  slant_right = "",
  slant_right_thin = "",
  slant_left_2 = "",
  slant_left_2_thin = "",
  slant_right_2 = "",
  slant_right_2_thin = "",
  left_rounded = "",
  left_rounded_thin = "",
  right_rounded = "",
  right_rounded_thin = "",
  circle = "●",
}

---Get the number of diagnostic messages for the provided severity
---@param str string [ERROR | WARN | INFO | HINT]
---@return string
local function get_diag(str)
  local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity[str] })
  local count = #diagnostics

  return (count > 0) and " " .. count .. " " or ""
end

---Get highlight group from vi mode
---@return string
local function vi_mode_hl()
  return vi.colors[vim.fn.mode()] or "UserSLViBlack"
end

---Get sep highlight group from vi mode
local function vi_sep_hl()
  return vi.sep[vim.fn.mode()] or "UserSLBlack"
end

---Get the path of the file relative to the cwd
---@return string
local function file_info()
  local list = {}
  if vim.bo.readonly then
    table.insert(list, "🔒")
  end

  if vim.bo.modified then
    table.insert(list, "●")
  end

  table.insert(list, vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":~:."))

  return table.concat(list, " ")
end

-- Create a table that contians every status line commonent
local c = {
  vimode = {
    provider = function()
      return fmt(" %s ", vi.text[vim.fn.mode()])
    end,
    hl = vi_mode_hl,
    right_sep = { str = " ", hl = vi_sep_hl },
  },
  gitbranch = {
    provider = "git_branch",
    icon = " ",
    hl = "UserSLGitBranch",
    right_sep = { str = "  ", hl = "UserSLGitBranch" },
    enabled = function()
      return vim.b.gitsigns_status_dict ~= nil
    end,
  },
  file_type = {
    provider = function()
      return fmt(" %s ", vim.bo.filetype:upper())
    end,
    hl = "UserSLAlt",
  },
  fileinfo = {
    provider = { name = "file_info", opts = { type = "relative" } },
    hl = "UserSLAlt",
    left_sep = { str = " ", hl = "UserSLAltSep" },
    right_sep = { str = " ", hl = "UserSLAltSep" },
  },
  file_enc = {
    provider = function()
      local os = icons[vim.bo.fileformat] or ""
      return fmt(" %s %s ", os, vim.bo.fileencoding)
    end,
    hl = "StatusLine",
    left_sep = { str = icons.left_filled, hl = "UserSLAltSep" },
  },
  cur_position = {
    provider = function()
      -- TODO: What about 4+ diget line numbers?
      return fmt(" %3d:%-2d ", unpack(vim.api.nvim_win_get_cursor(0)))
    end,
    hl = vi_mode_hl,
    left_sep = { str = icons.left_filled, hl = vi_sep_hl },
  },
  cur_percent = {
    provider = function()
      return " " .. require("feline.providers.cursor").line_percentage() .. "  "
    end,
    hl = vi_mode_hl,
    left_sep = { str = icons.left, hl = vi_mode_hl },
  },
  default = { -- needed to pass the parent StatusLine hl group to right hand side
    provider = "",
    hl = "StatusLine",
  },
  lsp_status = {
    provider = function()
      return vim.tbl_count(vim.lsp.buf_get_clients(0)) == 0 and "" or " ◦ "
    end,
    hl = "UserSLStatus",
    left_sep = { str = "", hl = "UserSLStatusBg", always_visible = true },
    right_sep = { str = "", hl = "UserSLErrorStatus", always_visible = true },
  },
  lsp_error = {
    provider = function()
      return get_diag("ERROR")
    end,
    hl = "UserSLError",
    right_sep = { str = "", hl = "UserSLWarnError", always_visible = true },
  },
  lsp_warn = {
    provider = function()
      return get_diag("WARN")
    end,
    hl = "UserSLWarn",
    right_sep = { str = "", hl = "UserSLInfoWarn", always_visible = true },
  },
  lsp_info = {
    provider = function()
      return get_diag("INFO")
    end,
    hl = "UserSLInfo",
    right_sep = { str = "", hl = "UserSLHintInfo", always_visible = true },
  },
  lsp_hint = {
    provider = function()
      return get_diag("HINT")
    end,
    hl = "UserSLHint",
    right_sep = { str = "", hl = "UserSLFtHint", always_visible = true },
  },

  in_fileinfo = {
    provider = "file_info",
    hl = "StatusLine",
  },
  in_position = {
    provider = "position",
    hl = "StatusLine",
  },
  file_winbar = {
    provider = file_info,
    hl = "Comment",
  },
}

local active = {
  { -- left
    c.vimode,
    c.gitbranch,
    c.fileinfo,
    c.default, -- must be last
  },
  { -- right
    c.lsp_status,
    c.lsp_error,
    c.lsp_warn,
    c.lsp_info,
    c.lsp_hint,
    c.file_type,
    c.file_enc,
    c.cur_position,
    c.cur_percent,
  },
}

local inactive = {
  { c.in_fileinfo }, -- left
  { c.in_position }, -- right
}

require("feline").setup({
  components = { active = active, inactive = inactive },
  highlight_reset_triggers = {},
  force_inactive = {
    filetypes = {
      "NvimTree",
      "packer",
      "dap-repl",
      "dapui_scopes",
      "dapui_stacks",
      "dapui_watches",
      "dapui_repl",
      "LspTrouble",
      "qf",
      "help",
    },
    buftypes = { "terminal" },
    bufnames = {},
  },
  disable = {
    filetypes = {
      "dashboard",
      "startify",
    },
  },
})
--}}}
-- Tabby {{{
-- Tabby
-- https://github.com/UserEast/nightfox.nvim/tree/main/mics/tabby.lua
--
-- This file is a complete example of creating the tabby configuration shown in the readme of
-- nightfox. This configuration generates its own highlight groups from the currently applied
-- colorscheme. These highlight groups are regenreated on colorscheme changes.
--
-- Required plugins:
--    - `nanozuki/tabby.nvim`
--
-- This file is required to be in your `lua` folder of your config.  Your colorscheme should also
-- be applied before this file is sourced. This file cannot be located `lua/tabby.lua` as this
-- would clash with the actual plugin require path.
--
--
-- # Example:
--
-- ```lua
-- vim.cmd("colorscheme nightfox")
-- require('user.ui.tabby')
-- ```
--
-- This assumes that this file is located at `lua/user/ui/tabby.lua`

local fmt = string.format

----------------------------------------------------------------------------------------------------
-- Colors

---Convert color number to hex string
---@param n number
---@return string
local hex = function(n)
  if n then
    return fmt("#%06x", n)
  end
end

---Parse `style` string into nvim_set_hl options
---@param style string
---@return table
local function parse_style(style)
  if not style or style == "NONE" then
    return {}
  end

  local result = {}
  for token in string.gmatch(style, "([^,]+)") do
    result[token] = true
  end

  return result
end

---Get highlight opts for a given highlight group name
---@param name string
---@return table
local function get_highlight(name)
  local hl = vim.api.nvim_get_hl_by_name(name, true)
  if hl.link then
    return get_highlight(hl.link)
  end

  local result = parse_style(hl.style)
  result.fg = hl.foreground and hex(hl.foreground)
  result.bg = hl.background and hex(hl.background)
  result.sp = hl.special and hex(hl.special)

  return result
end

---Set highlight group from provided table
---@param groups table
local function set_highlights(groups)
  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

---Generate a color palette from the current applied colorscheme
---@return table
local function generate_pallet_from_colorscheme()
  -- stylua: ignore
  local color_map = {
    black   = { index = 0, default = "#393b44" },
    red     = { index = 1, default = "#c94f6d" },
    green   = { index = 2, default = "#81b29a" },
    yellow  = { index = 3, default = "#dbc074" },
    blue    = { index = 4, default = "#719cd6" },
    magenta = { index = 5, default = "#9d79d6" },
    cyan    = { index = 6, default = "#63cdcf" },
    white   = { index = 7, default = "#dfdfe0" },
  }

  local pallet = {}
  for name, value in pairs(color_map) do
    local global_name = "terminal_color_" .. value.index
    pallet[name] = vim.g[global_name] and vim.g[global_name] or value.default
  end

  pallet.sl = get_highlight("StatusLine")
  pallet.tab = get_highlight("TabLine")
  pallet.sel = get_highlight("TabLineSel")
  pallet.fill = get_highlight("TabLineFill")

  return pallet
end

---Generate user highlight groups based on the curent applied colorscheme
---
---NOTE: This is a global because I dont known where this file will be in your config
---and it is needed for the autocmd below
_G._genreate_user_tabline_highlights = function()
  local pal = generate_pallet_from_colorscheme()

  -- stylua: ignore
  local sl_colors = {
    Black   = { fg = pal.black,   bg = pal.white },
    Red     = { fg = pal.red,     bg = pal.sl.bg },
    Green   = { fg = pal.green,   bg = pal.sl.bg },
    Yellow  = { fg = pal.yellow,  bg = pal.sl.bg },
    Blue    = { fg = pal.blue,    bg = pal.sl.bg },
    Magenta = { fg = pal.magenta, bg = pal.sl.bg },
    Cyan    = { fg = pal.cyan,    bg = pal.sl.bg },
    White   = { fg = pal.white,   bg = pal.black },
  }

  local colors = {}
  for name, value in pairs(sl_colors) do
    colors["User" .. name] = { fg = value.fg, bg = value.bg, bold = true }
    colors["UserRv" .. name] = { fg = value.bg, bg = value.fg, bold = true }
  end

  local groups = {
    -- tabline
    UserTLHead = { fg = pal.fill.bg, bg = pal.cyan },
    UserTLHeadSep = { fg = pal.cyan, bg = pal.fill.bg },
    UserTLActive = { fg = pal.sel.fg, bg = pal.sel.bg, bold = true },
    UserTLActiveSep = { fg = pal.sel.bg, bg = pal.fill.bg },
    UserTLBoldLine = { fg = pal.tab.fg, bg = pal.tab.bg, bold = true },
    UserTLLineSep = { fg = pal.tab.bg, bg = pal.fill.bg },
  }

  set_highlights(vim.tbl_extend("force", colors, groups))
end

_genreate_user_tabline_highlights()

vim.api.nvim_create_augroup("UserTablineHighlightGroups", { clear = true })
vim.api.nvim_create_autocmd({ "SessionLoadPost", "ColorScheme" }, {
  callback = function()
    _genreate_user_tabline_highlights()
  end,
})

----------------------------------------------------------------------------------------------------
-- Feline

local filename = require("tabby.filename")

local cwd = function()
  return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
end

local line = {
  hl = "TabLineFill",
  layout = "active_wins_at_tail",
  head = {
    { cwd, hl = "UserTLHead" },
    { "", hl = "UserTLHeadSep" },
  },
  active_tab = {
    label = function(tabid)
      return {
        "  " .. tabid .. " ",
        hl = "UserTLActive",
      }
    end,
    left_sep = { "", hl = "UserTLActiveSep" },
    right_sep = { "", hl = "UserTLActiveSep" },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        "  " .. tabid .. " ",
        hl = "UserTLBoldLine",
      }
    end,
    left_sep = { "", hl = "UserTLLineSep" },
    right_sep = { "", hl = "UserTLLineSep" },
  },
  top_win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { "", hl = "UserTLLineSep" },
    right_sep = { "", hl = "UserTLLineSep" },
  },
  win = {
    label = function(winid)
      return {
        "  " .. filename.unique(winid) .. " ",
        hl = "TabLine",
      }
    end,
    left_sep = { "", hl = "UserTLLineSep" },
    right_sep = { "", hl = "UserTLLineSep" },
  },
  tail = {
    { "", hl = "UserTLHeadSep" },
    { "  ", hl = "UserTLHead" },
  },
}

require("tabby").setup({
  tabline = line,
})
-- }}}
>>>>>>> 87a050d (Tema NightFox, agregado tabby)
