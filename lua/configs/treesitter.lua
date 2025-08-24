local options = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "gowork",
    "gosum",
    "html",
    "json",
    "json5",
    "latex",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "nix",
    "python",
    "typst",
    "vim",
    "vimdoc",
    "yaml",
  },

  highlight = {
    enable = true,
    use_language_tree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
