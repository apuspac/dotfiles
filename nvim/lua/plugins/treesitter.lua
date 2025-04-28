return {
    "nvim-treesitter/nvim-treesitter",
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
                "tsx",
                "glsl",
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


