return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		------------------------------------------------------------------
		-- 1️⃣ 定义渐变高亮（从深到浅）
		------------------------------------------------------------------
		vim.api.nvim_set_hl(0, "AlphaGrad1", { fg = "#5f87ff", bold = true })
		vim.api.nvim_set_hl(0, "AlphaGrad2", { fg = "#6faaff", bold = true })
		vim.api.nvim_set_hl(0, "AlphaGrad3", { fg = "#7fcfff", bold = true })
		vim.api.nvim_set_hl(0, "AlphaGrad4", { fg = "#9fe3ff", bold = true })

		------------------------------------------------------------------
		-- 2️⃣ NEOVIM ASCII Logo
		------------------------------------------------------------------
		dashboard.section.header.val = {
			" ",
			" ",
			" ",
			"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
			"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
			"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
			"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
			"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
			" ",
			"                BE DELICATED TO",
			"              wuzhongwz@gmail.com",
			" ",
			" ",
		}

		------------------------------------------------------------------
		-- 3️⃣ 关键：每一行一个完整 hl table（安全写法）
		------------------------------------------------------------------
		dashboard.section.header.opts.hl = {
			{ { "AlphaGrad1", 0, -1 } },
			{ { "AlphaGrad2", 0, -1 } },
			{ { "AlphaGrad3", 0, -1 } },
			{ { "AlphaGrad4", 0, -1 } },
			{ { "AlphaGrad3", 0, -1 } },
			{ { "AlphaGrad2", 0, -1 } },
		}

		------------------------------------------------------------------
		-- 4️⃣（可选）给按钮也统一配色（推荐）
		------------------------------------------------------------------
		vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#cdd6f4" })
		vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#89b4fa", italic = true })

		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.buttons.opts.hl_shortcut = "AlphaShortcut"

		------------------------------------------------------------------
		-- 5️⃣ 启动 alpha
		------------------------------------------------------------------
		alpha.setup(dashboard.config)
	end,
}
