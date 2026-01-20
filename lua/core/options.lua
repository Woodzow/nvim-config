local opt = vim.opt

--行号
opt.relativenumber = true
opt.number = true

--缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

--防止包裹
-- opt.warp = false

--光标行
opt.cursorline = true

--启用鼠标
opt.clipboard:append("unnamedplus")

--默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

--搜索的设置
opt.ignorecase = true
opt.smartcase = true

--外观
opt.termguicolors = true
opt.signcolumn = "yes"
--vim.cmd[[colorscheme tokyonight-moon]]

opt.showmode = false

-- 先将默认状态设为 0 (隐藏)
vim.opt.showtabline = 0

--设置只有dashboard界面不显示tabline
-- 创建一个自动命令组
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		-- 获取当前文件的类型
		local ft = vim.bo.filetype
		-- 获取当前 buffer 的名字
		local bn = vim.api.nvim_buf_get_name(0)

		-- 逻辑判断：
		-- 如果当前是 Alpha 仪表盘，或者没有文件名（空界面），则隐藏
		if ft == "alpha" or ft == "dashboard" or bn == "" then
			vim.opt.showtabline = 0
		else
			-- 只要打开了实际的文件，就显示 tabline
			vim.opt.showtabline = 2
		end
	end,
})
