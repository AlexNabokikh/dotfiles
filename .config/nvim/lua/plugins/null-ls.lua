return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        -- code actions
        nls.builtins.code_actions.cspell.with({
          extra_args = { "--config", "~/.config/nvim/utils/cspell.json" },
          config = {
            find_json = function()
              return vim.fn.expand("~/.config/nvim/utils/cspell.json")
            end,
            on_success = function()
              os.execute(
                "cat ~/.config/nvim/utils/cspell.json | jq -S '.words |= sort' | tee ~/.config/nvim/utils/cspell.json > /dev/null"
              )
            end,
          },
          filetypes = {
            "markdown",
            "text",
            "txt",
          },
        }),
        -- formatters
        nls.builtins.formatting.black,
        nls.builtins.formatting.prettier.with({
          filetypes = {
            "markdown",
            "yaml.ansible",
            "yaml.docker-compose",
            "yaml.kubernetes",
            "yaml",
          },
        }),
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.isort,
        nls.builtins.formatting.markdownlint,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.terraform_fmt,
        -- linters
        nls.builtins.diagnostics.ansiblelint,
        nls.builtins.diagnostics.cspell,
        nls.builtins.diagnostics.flake8,
        nls.builtins.diagnostics.golangci_lint,
        nls.builtins.diagnostics.hadolint,
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.shellcheck,
      },
    }
  end,
}
