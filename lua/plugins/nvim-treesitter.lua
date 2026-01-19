return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "toml", "vim", "bash", "c", "cpp", "python", "java", "json" },
    highlight = { enable = true },
  },
  config = function(_, opts)
    require'nvim-treesitter'.setup(opts)
  end,
}

