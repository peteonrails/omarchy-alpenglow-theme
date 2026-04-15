return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg         = "#121515",
        dark_bg    = "#0e1010",
        darker_bg  = "#090b0b",
        lighter_bg = "#2a2c2c",

        fg         = "#FCFBF8",
        dark_fg    = "#bdbcba",
        light_fg   = "#fcfcf9",
        bright_fg  = "#fdfcfa",
        muted      = "#697171",

        red        = "#A48364",
        yellow     = "#FEE88B",
        orange     = "#b2967b",
        green      = "#F8E7AE",
        cyan       = "#59c1c0",
        blue       = "#6E89C2",
        purple     = "#8BA6DF",
        brown      = "#6b5a4a",

        bright_red    = "#cca87f",
        bright_yellow = "#fce668",
        bright_green  = "#f6e59c",
        bright_cyan   = "#70e4e3",
        bright_blue   = "#90acf5",
        bright_purple = "#adc9ff",

        accent               = "#6E89C2",
        cursor               = "#FCFBF8",
        foreground           = "#FCFBF8",
        background           = "#121515",
        selection             = "#2a2c2c",
        selection_foreground = "#FCFBF8",
        selection_background = "#2a2c2c",
      },
    },
    -- set up hot reload
    config = function(_, opts)
      require("aether").setup(opts)
      vim.cmd.colorscheme("aether")
      require("aether.hotreload").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
