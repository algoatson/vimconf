-- gruvbox
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "",  -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    SignColumn = { link = "Normal" },
    GruvboxGreenSign = { bg = "" },
    GruvboxOrangeSign = { bg = "" },
    GruvboxPurpleSign = { bg = "" },
    GruvboxYellowSign = { bg = "" },
    GruvboxRedSign = { bg = "" },
    GruvboxBlueSign = { bg = "" },
    GruvboxAquaSign = { bg = "" },
    TelescopeSelection = { link = "Visual" },
    ["@variable"] = { link = "GruvboxBlue" },
    TermCursor = { bg = "#fabd2f", fg = "#282828" },
    Visual = {bg = "#d79921", fg = "#282828"},
    Linenr = {fg = "#7c6f64", bg = ""},
    debugPC = {fg = "", bg = "#3d4220"},
    DapBreakpoint = {fg = "", bg = "#472322"},
    DapBreakpointSymbol = {bg = ""}
  },
  dim_inactive = false,
  transparent_mode = false,
})

require("tokyonight").setup({
  style = "night",
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "",  -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    SignColumn = { link = "Normal" },
    GruvboxGreenSign = { bg = "" },
    GruvboxOrangeSign = { bg = "" },
    GruvboxPurpleSign = { bg = "" },
    GruvboxYellowSign = { bg = "" },
    GruvboxRedSign = { bg = "" },
    GruvboxBlueSign = { bg = "" },
    GruvboxAquaSign = { bg = "" },
    TelescopeSelection = { link = "Visual" },
    ["@variable"] = { link = "GruvboxBlue" },
    TermCursor = { bg = "#fabd2f", fg = "#282828" },
    Visual = {bg = "#d79921", fg = "#282828"},
    Linenr = {fg = "#7c6f64", bg = ""},
    debugPC = {fg = "", bg = "#3d4220"},
    DapBreakpoint = {fg = "", bg = "#472322"},
    DapBreakpointSymbol = {bg = ""}
  },
  dim_inactive = false,
  transparent_mode = false,
  transparent = false,
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(hl, c)
  local prompt = "#2d3149"
  hl.TelescopeNormal = {
    bg = c.bg_dark,
    fg = c.fg_dark,
  }
  hl.TelescopeBorder = {
    bg = c.bg_dark,
    fg = c.bg_dark,
  }
  hl.TelescopePromptNormal = {
    bg = prompt,
  }
  hl.TelescopePromptBorder = {
    bg = prompt,
    fg = prompt,
  }
  hl.TelescopePromptTitle = {
    bg = prompt,
    fg = prompt,
  }
  hl.TelescopePreviewTitle = {
    bg = c.bg_dark,
    fg = c.bg_dark,
  }
  hl.TelescopeResultsTitle = {
    bg = c.bg_dark,
    fg = c.bg_dark,
  }
  end,
})

require("evangelion").setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "",
  transparent_mode = true,
  palette_overrides = {},
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(hl, c)
  local prompt = "#2d3149"
  hl.TelescopeNormal = {
    bg = c.bg_dark,
    fg = c.fg_dark,
  }
  hl.TelescopeBorder = {
    bg = c.bg_dark,
    fg = c.bg_dark,
  }
  hl.TelescopePromptNormal = {
    bg = prompt,
  }
  hl.TelescopePromptBorder = {
    bg = prompt,
    fg = prompt,
  }
  hl.TelescopePromptTitle = {
    bg = prompt,
    fg = prompt,
  }
  hl.TelescopePreviewTitle = {
    bg = c.bg_dark,
    fg = c.bg_dark,
  }
  hl.TelescopeResultsTitle = {
    bg = c.bg_dark,
    fg = c.bg_dark,
  }
  end,
})

vim.o.background = "dark"
vim.o.termguicolors = true
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme evangelion")
vim.cmd("colorscheme tokyonight")
-- lualine
require('lualine').setup(
  {
    option = {
      theme = "tokyonight",
      component_separators = {
        left = "░",
        right = "░",
      },
      sections_separators = {
        left = "▓▒░",
        right = "░▒▓",
      },
      globalstatus = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_z = {'location'},
      lualine_y = {'searchcount', 'progress'},
      lualine_x = {
        { "encoding", padding = { left = 1, right = 1 }, separator = { left = "░▒▓" } },
        { "fileformat" },
        { "filetype" },
      },
    },
  }
)

require('colorizer').setup() -- this will create an autocmd for FileType *
                             -- this result in colorizer toggling automatically.

require('startup').setup({theme = "nvim_sharp"})

require('bufferline').setup()
