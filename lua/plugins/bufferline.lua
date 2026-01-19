-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
    'akinsho/bufferline.nvim',
    version = "*", -- 推荐锁定版本，例如 "v3.*" 或具体版本号
    dependencies = { 'nvim-tree/nvim-web-devicons' },-- 依赖 nvim-web-devicons 以显示图标
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function (_, _, diagnostics_dict, _)
                local indicator = " "
                for level, number in pairs(diagnostics_dict) do
                    local symbol
                    if level == "error" then
                        symbol = " "
                    elseif level == "warning" then
                        symbol = " "
                    else
                        symbol = " "
                    end
                    indicator = indicator .. number .. symbol
                end
                return indicator
            end
        }
    },
    keys = {
        { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
        { "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },
        { "<leader>bp", ":BufferLinePick<CR>", silent = true },
        { "<leader>bd", ":bdelete<CR>", silent = true },
    },
    lazy = false, --拒绝懒加载，选择进入nvim前就进行加载
}
