return {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- formatters
          nls.builtins.formatting.black,
          nls.builtins.formatting.prettier.with {
            filetypes = {
              "yaml",
              "yaml.ansible",
              "yaml.docker-compose",
              "yaml.kubernetes",
              "yaml.terraform",
            },
          },
          nls.builtins.formatting.goimports,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.markdownlint,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.stylua,
          -- linters
          nls.builtins.diagnostics.flake8,
          nls.builtins.diagnostics.golangci_lint,
          nls.builtins.diagnostics.hadolint,
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.diagnostics.ruff,
          nls.builtins.diagnostics.shellcheck,
        },
      }
    end
}
