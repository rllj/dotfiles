local root_files = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
}

---@type vim.lsp.Config
return {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { "python" },
    root_markers = root_files,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
            },
            venvPath = vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV or vim.env.PYENV_ROOT,
        },
    },
}
