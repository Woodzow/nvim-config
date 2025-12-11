return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",

    -- 最常用的操作
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree", silent = true },
    },

    -- 所有传给 setup 的配置都放这里
    opts = {
        view = {
            width = 30,
            side = "left",
        },
        renderer = {
            indent_markers = { enable = true },
        },
        --update_focused_file = {
        --    enable = true,           -- 自动定位当前文件
        --},
        filters = {
            dotfiles = false,        -- 显示 .gitignore 文件
        },
        actions = {
            open_file = {
                quit_on_open = true, -- 打开文件后自动关闭 nvim-tree
            },
        },
    },

    config = function(_, opts)
        -- 官方推荐禁用 netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- 只剩下 nvim-tree 一个窗口时自动退出 Neovim（可选）
        vim.api.nvim_create_autocmd("BufEnter", {
            nested = true,
            callback = function()
                if #vim.api.nvim_list_wins() == 1
                    and vim.api.nvim_buf_get_name(0):match("NvimTree_") then
                    vim.cmd("quit")
                end
            end,
        })

        -- 只调用一次 setup，用 Lazy 合并好的 opts
        require("nvim-tree").setup(opts)
    end,
}
