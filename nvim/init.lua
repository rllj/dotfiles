-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true

-- Defualt tab settings. Is also set on a per file-basis in after/ftplugin
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.shiftround = true

vim.opt.termguicolors = true

vim.g.have_nerd_font = true

-- Don't wrap lines
vim.opt.wrap = false

-- Text highlighting
vim.opt.hlsearch = true

-- Don't allow the cursor to be at the very top or bottom of the screen
vim.opt.scrolloff = 10

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})
-- ESC in normal mode removes highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Line number settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Set splits to open to the right and bottom,
-- instead of the somewhat confusing default of top and left.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set signcolomn to avoid the buffer shifting to the right
vim.o.signcolumn = 'yes'

-- TODO: Should probably move to after/ftplugin
-- Enable colourcolumn for certain file types
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.zig" },
    command = "set colorcolumn=80",
})

-- LSPs
-- Set root of project to the folder where .git is located for all LSPs
vim.lsp.config('*', {
    root_markers = { '.git' },
    capabilities = require('blink.cmp').get_lsp_capabilities()
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        assert(client ~= nil)

        if client:supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
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
    'luals',
    'gopls',
    'rust_analyzer',
}

vim.lsp.enable(language_servers)

-- Colourscheme
vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')
