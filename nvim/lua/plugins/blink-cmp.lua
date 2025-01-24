return {
    enabled = true,
    "saghen/blink.cmp",
    lazy = false,

    version = "v0.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
                cycle = { from_top = true, from_bottom = true },
            },

            keyword = {
                range = "full",
            },

            accept = {
                create_undo_point = false,
                auto_brackets = {
                    enabled = true,
                },
            },

            documentation = {
                auto_show = false,
                auto_show_delay_ms = 0,
                treesitter_highlighting = true,
            },

            menu = {
                auto_show = false,
            },

            ghost_text = {
                enabled = false,
            },
        },
        keymap = {
            preset = "default",
            ["<Tab>"] = { "accept", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        sources = {
            default = { "lsp", "path", "buffer" },
        },
    },
}
