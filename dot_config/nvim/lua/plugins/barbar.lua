return{
    "romgrk/barbar.nvim",

    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        -- plugin config
    },

    version = "^1.0.0",

    config = function ()
        vim.g.barbar_auto_setup = false

        vim.keymap.set("n", "[b", [[:BufferPrevious<CR>]], { noremap = true, silent = true})
        vim.keymap.set("n", "]b", [[:BufferNext<CR>]], { noremap = true, silent = true})
        vim.keymap.set("n", "[d", [[:BufferClose<CR>]], { noremap = true, silent = true})
    end,
}
