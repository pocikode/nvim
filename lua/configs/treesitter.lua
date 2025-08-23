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
    "lua",
    "make",
    "markdown",
    "nix",
    "python",
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
