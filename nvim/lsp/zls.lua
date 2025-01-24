---@type vim.lsp.Config
return {
    cmd = { 'zls' },
    filetypes = { 'zig' },
    root_markers = { 'build.zig', 'build.zig.zon' },

    settings = {
        zls = {
            zig_exe_path = "/Users/m01632/.local/bin/zig",
            semantic_tokens = "partial",
            enable_build_on_save = true,
            build_on_save_args = "install",
        }
    }
}
