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
    cmd = { 'pyright-langserver', '--stdio', },
    filetypes = { "python" },
    root_markers = root_files,
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                ignore = { '*' }, -- Using Ruff
                diagnosticMode = "openFilesOnly",
            },
            venvPath = vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV or vim.env.PYENV_ROOT,
        },
    },
}
