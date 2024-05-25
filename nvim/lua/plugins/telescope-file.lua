return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },

    config = function ()
        -- require('telescope').setup{
            -- extensions = {
            --     defaults = {
            --             layout_config = {
            --                     prompt_position = "top",
            --                 },
            --                 sorting_strategy = "ascending",
            --         }
            --     }
            -- },

        vim.keymap.set("n", "<leader>fo", ":Telescope file_browser path=%:p:h select_buffer=true<CR><ESC>", {})
    end,
}
