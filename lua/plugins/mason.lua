return {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
	},
	event = "VeryLazy",
	config = function()
		-- 1. 初始化 Mason
		require("mason").setup()

		-- 2. 定义需要自动安装和配置的 LSP 列表
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			clangd = {}, -- C/C++
			pyright = {}, -- Python (请务必在系统安装 Node.js/npm)
		}

		-- 3. 使用 mason-lspconfig 确保这些服务器已被安装
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		-- 4. 消除 Warning 的关键：使用 Neovim 0.11+ 推荐的新 API
		for server_name, server_opts in pairs(servers) do
			-- 使用新的内置接口进行配置，替代旧的 setup()
			vim.lsp.config(server_name, server_opts)

			-- 处理 Lua 特有的诊断显示逻辑
			if server_name == "lua_ls" then
				vim.diagnostic.config({
					virtual_text = true,
					update_in_insert = true,
				})
			end

			-- 显式启用该服务器
			vim.lsp.enable(server_name)
		end

		-- 5. 执行启动命令
		vim.cmd("LspStart")
	end,
}
