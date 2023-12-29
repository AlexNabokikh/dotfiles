return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
        "ansible-language-server",
        "ansible-lint",
        "bash-language-server",
        "black",
        "dockerfile-language-server",
        "goimports",
        "golangci-lint",
        "golangci-lint-langserver",
        "hadolint",
        "isort",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "marksman",
        "prettier",
        "pyright",
        "ruff-lsp",
        "shellcheck",
        "shfmt",
        "stylua",
        "terraform-ls",
        "tflint",
        "yaml-language-server",
			})
		end,
	},
}
