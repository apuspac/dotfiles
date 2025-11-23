return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },


    config = function()
        require('telescope').setup{
            defaults = {
                -- layout_config = {
                --     prompt_position = "top",
                -- },
                -- sorting_strategy = "ascending",

                mappings = {
                    i = {
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["?"] = "which_key",
                    },
                },

                pickers = {
                    find_files = {
                        hidden = true,
                        -- theme = "ivy",
                    }
                }
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },

            }
        }

        require('telescope').load_extension('fzf')


        -- telescope
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>fd", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fn", builtin.help_tags, {})

        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
        -- vim.keymap.set('n', 'gD', '<cmd>Telescope lsp_declarations<cr>') -- lsp_declarations does not exist in Telescope
        vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>')
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>')
        vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>')
        vim.keymap.set('n', 'gO', '<cmd>Telescope lsp_document_symbols<cr>')
        vim.keymap.set('n', 'gS', '<cmd>Telescope lsp_workspace_symbols<cr>')
        vim.keymap.set('n', 'g<', '<cmd>Telescope lsp_incoming_calls<cr>')
        vim.keymap.set('n', 'g>', '<cmd>Telescope lsp_outgoing_calls<cr>')
        vim.keymap.set('n', '<leader>da', '<cmd>Telescope git_bcommits<cr>')
        vim.keymap.set('n', '<leader>ds', '<cmd>Telescope git_commits<cr>')

        -- vim.keymap.set("n", "<C-p>", builtin.find_files, {}) -- vscode

    end,
}
