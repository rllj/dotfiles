-- Set root of project to the folder where .git is located for all LSPs
vim.lsp.config("*", {
    root_markers = { ".git" },
})

-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        assert(client ~= nil)

        if client:supports_method("textDocument/implementation") then
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
        end
        if client:supports_method("textDocument/definition") then
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        end
        if client:supports_method("textDocument/declaration") then
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
        end

        if client:supports_method("textDocument/formatting") then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                    vim.diagnostic.enable() -- Workaround for bug where diagnostics are cleared when formatting.
                    -- See https://github.com/neovim/neovim/issues/25014
                end,
            })
        end
    end,
})

-- Diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

local language_servers = {
    "luals",
    "gopls",
    "rust_analyzer",
    "zls",
    "pyright",
}

vim.lsp.enable(language_servers)
