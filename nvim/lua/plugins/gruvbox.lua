return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = false,
            folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,    -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- Gruvbox dark hard ftw
        palette_overrides = {},
        overrides = {
            BlinkCmpGhostText = { fg = "#928374" }
        },
        dim_inactive = false,
        transparent_mode = false,
    }
}
