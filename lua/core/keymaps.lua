vim.g.mapleader = " "

local keymap = vim.keymap

-- --------插入模式-------- --

-- --------视觉模式-------- --


-- 视觉模式
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- --------正常模式-------- --

-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") --水平增加窗口
keymap.set("n", "<leader>sh", "<C-w>s") --垂直增加窗口

-- 取消搜索后持续的高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")




