return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && " ..
              "cmake --build build --config Release && " ..
              "cmake --install build --prefix build",
    },
  },

  cmd = "Telescope",

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>",               desc = "Find files", silent = true, noremap = true }, --查找文件
    { "<leader>fg", "<cmd>Telescope live_grep<CR>",                desc = "Live grep",  silent = true, noremap = true }, --在项目里搜索内容
    { "<leader>fb", "<cmd>Telescope buffers<CR>",                  desc = "Buffers",    silent = true, noremap = true }, --打开buffer列表
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>",                 desc = "Recent files", silent = true, noremap = true }, --最近打开文件
    { "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search buffer", silent = true, noremap = true }, --当前文件模糊搜索
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",                desc = "Help tags", silent = true, noremap = true }, --nvim帮助文档搜索
  },

  opts = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  },

  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}
