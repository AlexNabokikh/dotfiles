return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        ansible_language_server,
        ansible_lint,
        bash_language_server,
        black,
        dockerfile_language_server,
        flake8,
        goimports,
        golangci_lint_langserver,
        golangci_lint,
        hadolint,
        helm_ls,
        isort,
        json_lsp,
        lua_language_server,
        markdownlint,
        prittier,
        pyright,
        shellcheck,
        shfmt,
        stylua,
        terraform_ls,
        tflint,
        yaml_language_server,
      },
    }
  },
}
