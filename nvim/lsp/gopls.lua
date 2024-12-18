vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    root_markers = { ".git", "go.mod", "go.work" },
    filetypes = { "go", "gotempl", "gowork", "gomod" },
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
            ["ui.inlayhint.hints"] = {
                compositeLiteralFields = true,
                constantValues = true,
                parameterNames = true,
                rangeVariableTypes = true,
            }
        }
    }
})
