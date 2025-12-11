return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = { "lua", "toml", "vim", "bash", "c", "cpp", "python", "java", "json" },
        highlight = {enable = true },
    }
}
