return {
    "neoclide/coc.nvim",
    config = function()
        vim.g.coc_global_extensions = {
            --basic
            'coc-json',
            'coc-git',
            'coc-sumneko-lua',
            'coc-docker',

            'coc-clangd',
            -- 'coc-co;ilot',

        }
    end
}
