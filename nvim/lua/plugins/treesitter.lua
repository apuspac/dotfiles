return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    config = function()
        require("nvim-treesitter").setup({
            vim.cmd([[TSUpdate]]),

            ensure_installed = {
                "c",
                "cpp",
                "python",
                "vim",
                "vimdoc",
                "query",
                "lua"
            },

            highlight = {
                enable = true,
                disable = {
                    -- disable language
                },
            },

            auto_install = false,

        })
    end,
}
