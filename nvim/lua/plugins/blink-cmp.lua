return {
    { "giuxtaposition/blink-cmp-copilot" },
    {
        "saghen/blink.cmp",
        dependencies = {
            {
                "giuxtaposition/blink-cmp-copilot",
            },
        },
        lazy = false,

        version = "v0.*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            completion = {
                list = {
                    selection = "preselect",
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
                    enabled = true,
                },
            },
            keymap = {
                preset = "default",
                ["<C-y>"] = { "accept", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            sources = {
                providers = {
                    copilot = { name = "copilot", module = "blink-cmp-copilot" },
                },
                default = { "copilot", "lsp", "path", "buffer" },
            },
        },
    },
}
