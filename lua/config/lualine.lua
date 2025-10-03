local colors = {
  white = "#c0caf5",
  black = "#1a1b26",
  one_bg = "#24283b",
  gray = "#40486a",
  light_gray = "#545c7e",
  red = "#f7768e",
  green = "#9ece6a",
  nord_blue = "#80a8fd",
  blue = "#7aa2f7",
  yellow = "#e0af68",
  dark_purple = "#9d7cd8",
  teal = "#1abc9c",
  orange = "#ff9e64",
  cyan = "#7dcfff",
  bg = "#1d1e29",
  lightbg = "#32333e",
}

local lualine_require = require("lualine_require")
lualine_require.require = require

local theme = {
  normal = {
    a = { fg = colors.black, bg = colors.nord_blue, gui = "bold" },
    b = { fg = colors.white, bg = colors.lightbg },
    c = { fg = colors.light_gray, bg = colors.bg },
    y = { fg = colors.white, bg = colors.lightbg },
    z = { fg = colors.green, bg = colors.lightbg },
  },
  visual = {
    a = { fg = colors.black, bg = colors.cyan, gui = "bold" },
  },
  insert = {
    a = { fg = colors.black, bg = colors.dark_purple, gui = "bold" },
  },
  terminal = {
    a = { fg = colors.black, bg = colors.green, gui = "bold" },
  },
  nterminal = {
    a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
  },
  replace = {
    a = { fg = colors.black, bg = colors.orange, gui = "bold" },
  },
  confirm = {
    a = { fg = colors.black, bg = colors.teal, gui = "bold" },
  },
  command = {
    a = { fg = colors.black, bg = colors.green, gui = "bold" },
  },
  select = {
    a = { fg = colors.black, bg = colors.blue, gui = "bold" },
  },
}

local separators = {
  diagonal = { left = "", right = "" },
  pill = { left = "", right = "" },
}

local icons = LazyVim.config.icons

return {
  options = {
    theme = theme,
    globalstatus = vim.o.laststatus == 3,
    disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        icons_enabled = true,
        icon = "",
        separator = { right = separators.diagonal.right },
      },
      {
        "",
        draw_empty = true,
        separator = separators.diagonal,
        color = { fg = colors.gray, bg = colors.gray },
      },
    },
    lualine_b = {
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      {
        LazyVim.lualine.pretty_path(),
        separator = { right = separators.diagonal.right },
      },
    },
    lualine_c = {
      {
        "branch",
        icon = "",
        separator = {},
      },
      {
        "diff",
        colored = false,
        symbols = { added = "  ", modified = "  ", removed = "  " },
      },
    },
    lualine_x = {
      -- Snacks.profiler.status(),
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
      -- stylua: ignore
      {
        function() return require("noice").api.status.command.get() end,
        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
        color = function() return { fg = Snacks.util.color("Statement") } end,
      },
      -- stylua: ignore
      {
        function() return require("noice").api.status.mode.get() end,
        cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
        color = function() return { fg = Snacks.util.color("Constant") } end,
      },
      -- stylua: ignore
      {
        function() return "  " .. require("dap").status() end,
        cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
        color = function() return { fg = Snacks.util.color("Debug") } end,
      },
      -- stylua: ignore
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = function() return { fg = Snacks.util.color("Special") } end,
      },
    },
    lualine_y = {
      {
        "%s ",
        separator = { left = separators.pill.left },
        color = { fg = colors.one_bg, bg = colors.red },
        padding = 0,
      },
      {
        LazyVim.root,
        separator = nil,
      },
    },
    lualine_z = {
      {
        "%s ",
        separator = { left = separators.pill.left },
        color = { fg = colors.black, bg = colors.green },
        padding = 0,
      },
      {
        "location",
        separator = nil,
      },
    },
  },

  extensions = { "neo-tree", "lazy", "fzf" },
}
