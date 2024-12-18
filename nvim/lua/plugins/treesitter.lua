return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "zig",
                "bash",
                "comment",
                "gitignore",
                "go",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "php",
                "sql",
                "yaml",
                "vim",
                "rust",
                "typescript",
            },
            highlight = {
                enable = true,
                disable = {},
            },
            sync_install = false,
            auto_install = true,
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end,
}
