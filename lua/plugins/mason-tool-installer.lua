-- 假设你使用的是 lazy.nvim
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Python 格式化工具
				"black",
				"isort",
				-- C/C++ 格式化工具
				"clang-format",
				-- 你之前配置里提到的其他工具
				"stylua",
				"prettierd",
			},
			auto_update = true, -- 启动时自动更新
			run_on_start = true, -- 启动时自动安装缺失项
		})
	end,
}
