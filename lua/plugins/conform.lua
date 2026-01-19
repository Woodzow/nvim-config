return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Python: 包含排序 (isort) 和格式化 (black)
			python = { "isort", "black" },
			-- C 语言: 添加 clang-format
			c = { "clang-format" },
			cpp = { "clang-format" }, -- 建议同时也给 C++ 加上
			javascript = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettier" },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
