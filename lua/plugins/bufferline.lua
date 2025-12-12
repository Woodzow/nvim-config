-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
    'akinsho/bufferline.nvim',
    version = "*", -- 推荐锁定版本，例如 "v3.*" 或具体版本号
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- 依赖 nvim-web-devicons 以显示图标
    keys = {
        { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
        { "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },
        { "<leader>bp", ":BufferLinePick<CR>", silent = true },
        { "<leader>bd", ":bdelete<CR>", silent = true },
    },
    lazy = false, --拒绝懒加载，选择进入nvim前就进行加载
    config = function()
        require('bufferline').setup({
            options = {
                -- 这里是 bufferline 的各种配置选项
                -- 例如：
                mode = "buffers", -- 显示缓冲区
                numbers = "none", -- 不显示缓冲区编号，可选 "ordinal", "buffer_id", "both"
                close_icon = ' X', -- 关闭图标
                buffer_close_icon = ' X',
                modified_icon = '●', -- 修改图标
                show_buffer_close_buttons = true, -- 显示关闭按钮
                separator_style = "slant", -- 分隔符样式 "slant" | "padded_slant" | "nil"
                offsets = {
                    { filetype = "NvimTree", text = "File Explorer", text_align = "left" }
                }, -- 如果使用 NvimTree，添加偏移
                diagnostics = "nvim_lsp", -- 集成 LSP 诊断信息
                -- 主题相关：
                -- groups = {
                --     options = {
                --         toggle_hidden_on_enter = true,
                --     }
                -- },
                -- theme_setup = {
                --     -- 可以为不同主题设置特定颜色
                --     catppuccin = {
                --         background = '#282a36',
                --         indicator = '#f1fa8c',
                --     },
                -- },
            }
        })

        ------------------------------------------------------------------
        -- ✅ 只在 alpha dashboard 隐藏 tabline；进入其它 buffer 自动恢复
        ------------------------------------------------------------------
        local aug = vim.api.nvim_create_augroup("AlphaTablineToggle", { clear = true })

        vim.api.nvim_create_autocmd("FileType", {
            group = aug,
            pattern = "alpha",
            callback = function()
                vim.opt.showtabline = 0
            end,
        })

        vim.api.nvim_create_autocmd("BufEnter", {
            group = aug,
            callback = function()
                if vim.bo.filetype ~= "alpha" then
                    vim.opt.showtabline = 2
                end
            end,
        })
    end
}
