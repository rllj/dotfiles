---@type vim.lsp.Config
return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_markers = {
        "package.json",
        "package-lock.json",
        "tsconfig.json",
        "jsconfig.json",
        ".git",
    },
    init_options = { hostInfo = 'neovim' },
}
