return {
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm" },
    opts = {
      size = 20,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
    end,
    keys = {
      { "_", "<cmd>ToggleTerm<cr>", desc = "Terminal" },
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Terminal" },
    },
  },
}