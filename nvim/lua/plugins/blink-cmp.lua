-- TODO: Integrate copilot when available
return {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally

    version = 'v0.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        completion = {
            list = {
                selection = 'preselect',
                cycle = { from_top = true, from_bottom = true },
            },

            keyword = {
                range = 'full',
            },

            accept = {
                create_undo_point = false,
                auto_brackets = {
                    enabled = true,
                }
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                treesitter_highlighting = true,
            },

            menu = {
                auto_show = true,
                draw = {
                    treesitter = true,
                },
            },

            ghost_text = {
                enabled = true,
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
            nerd_font_variant = 'mono'
        },

        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },

    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" }
}
