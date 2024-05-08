return{
    "sainnhe/gruvbox-material",
    config = function()
        -- require("gruvbox-material").setup({
        -- })
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_matrial_foreground = "mix"
        vim.cmd([[colorscheme gruvbox-material]])
    end
}
