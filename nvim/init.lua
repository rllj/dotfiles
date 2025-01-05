-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")
require("config.lsp")

vim.opt.clipboard = "unnamedplus"

-- Save undos after closing file
vim.opt.undofile = true

-- Defualt tab settings. Is also set on a per filetype-basis in after/ftplugin
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
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
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

-- Ignore case unless there is at least one capital letter in the search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- TODO: Should probably move to after/ftplugin
-- Enable colourcolumn for certain file types
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.zig" },
    command = "set colorcolumn=80",
})

-- Colourscheme
vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')
