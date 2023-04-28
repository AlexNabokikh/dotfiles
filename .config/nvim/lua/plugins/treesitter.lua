return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    ensure_installed = {
      "bash",
      "dockerfile",
      "go",
      "hcl",
      "json",
      "lua",
      "luadoc",
      "luap",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "terraform",
      "vim",
      "vimdoc",
      "yaml",
    },
  },
}
