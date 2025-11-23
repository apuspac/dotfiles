return {
    "zbirenbaum/copilot.lua",
    dependencies = {
        "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = false,
                auto_trigger = true, -- 自動でサジェストを表示
                keymap = {
                    accept = "<C-y>",
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },
            panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-CR>",
                },
                layout = {
                    position = "bottom",
                    ratio = 0.4,
                },
            },
        })

        vim.api.nvim_create_autocmd("User", {
          pattern = "BlinkCmpMenuOpen",
          callback = function()
            vim.b.copilot_suggestion_hidden = true
          end,
        })

        vim.api.nvim_create_autocmd("User", {
          pattern = "BlinkCmpMenuClose",
          callback = function()
            vim.b.copilot_suggestion_hidden = false
          end,
        })
    end,
}


