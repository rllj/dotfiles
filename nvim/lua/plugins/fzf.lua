return {
    "ibhagwan/fzf-lua",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        'fzf-native',
    },
    keys = {
        { "<leader>ff",  "<cmd>FzfLua files<cr>",                      desc = "Fzf files" },
        { "<leader>fg",  "<cmd>FzfLua live_grep<cr>",                  desc = "Fzf live_grep" },
        { "<leader>*",   "<cmd>FzfLua grep_cword<cr>",                 desc = "Fzf grep_cword" },
        { "<leader>fw",  "<cmd>FzfLua grep_cword<cr>",                 desc = "Fzf grep_cword" },
        { "<leader>fW",  "<cmd>FzfLua grep_cWORD<cr>",                 desc = "Fzf grep_cWORD" },
        { "<leader>fb",  "<cmd>FzfLua buffers<cr>",                    desc = "Fzf Buffers" },
        { "<leader>fh",  "<cmd>FzfLua help_tags<cr>",                  desc = "Fzf Help Tags" },
        { "<leader>qf",  "<cmd>FzfLua quickfix<cr>",                   desc = "Fzf Quickfix List" },
        { "<leader>q:",  "<cmd>FzfLua command_history<cr>",            desc = "Fzf Command History" },
        { "<leader>tm",  "<cmd>FzfLua tmux_buffers<cr>",               desc = "Fzf Tmux Buffers" },

        { "<leader>rr",  "<cmd>FzfLua resume<cr>",                     desc = "Fzf Resume" },

        { "<leader>gc",  "<cmd>FzfLua git_commits<cr>" },
        { "<leader>gf",  "<cmd>FzfLua git_files<cr>" },
        { "<leader>gh",  "<cmd>FzfLua git_bcommits<cr>",               desc = "History - FzfLua Git Commits (buffer)" },
        { "<leader>gs",  "<cmd>FzfLua git_status<cr>" },

        { "<leader>ga",  "<cmd>FzfLua lsp_code_actions<cr>",           desc = "Fzf Code Actions" },
        { "<leader>gf",  "<cmd>FzfLua lsp_finder<cr>",                 desc = "Fzf LSP Finder" },
        { "<leader>gi",  "<cmd>FzfLua lsp_implementations<cr>",        desc = "Fzf Implementations" },
        { "<leader>go",  "<cmd>FzfLua lsp_outgoing_calls<cr>",         desc = "Fzf Outgoing Calls" },
        { "<leader>gc",  "<cmd>FzfLua lsp_incoming_calls<cr>",         desc = "Fzf Incoming Calls" },
        { "<leader>gr",  "<cmd>FzfLua lsp_references<cr>",             desc = "Fzf References" },
        { "<leader>gd",  "<cmd>FzfLua lsp_definitions<cr>",            desc = "Fzf Definitions" },
        { "<leader>gD",  "<cmd>FzfLua lsp_declarations<cr>",           desc = "Fzf Declarations" },
        { "<leader>gt",  "<cmd>FzfLua lsp_typedefs<cr>",               desc = "Fzf Type Definitions" },
        { "<leader>gl",  "<cmd>FzfLua lsp_document_diagnostics<cr>",   desc = "Fzf Document Diagnostics" },
        { "<leader>gs",  "<cmd>FzfLua lsp_document_symbols<cr>",       desc = "Fzf Document Symbols" },

        { "<leader>gj",  "<cmd>FzfLua jumps<cr>",                      desc = "Fzf Jumps" },
        { "<leader>gh",  "<cmd>FzfLua changes<cr>",                    desc = "FZf Changes" },

        { "<leader>gwl", "<cmd>FzfLua lsp_workspace_diagnostics<cr>",  desc = "Fzf Workspace Diagnostics" },
        { "<leader>gws", "<cmd>FzfLua lsp_workspace_symbols<cr>",      desc = "Fzf Workspace Symbols" },
        { "<leader>gwy", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "Fzf Live Workspace Symbols" },
    },
}
