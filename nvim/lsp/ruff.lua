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
    cmd = { 'ruff', 'server' },
    filetypes = { "python" },
    root_markers = root_files,
}
