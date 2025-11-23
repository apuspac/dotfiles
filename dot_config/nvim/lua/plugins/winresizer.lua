return {
    "simeji/winresizer",
    lazy = false,
    init = function()
        vim.g.winresizer_start_key = '<leader>w'
        vim.g.winresizer_vert_resize = 5
        vim.g.winresizer_horiz_resize = 5
    end,
}
