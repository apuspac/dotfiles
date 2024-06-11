return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    config = function()
        vim.cmd([[TSUpdate]])

        require("nvim-treesitter.configs").setup({

            ensure_installed = {
                "c",
                "cpp",
                "python",
                "vim",
                "vimdoc",
                "query",
                "lua",
                "typescript",
                "tsx"
            },

            auto_install = true,
            sync_install = true,

            highlight = {
                enable = true,
                disable = {
                    -- disable language
                }
            },
        })
    end
}
