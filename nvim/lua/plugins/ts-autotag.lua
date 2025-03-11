return {
    "windwp/nvim-ts-autotag",

    config = function()
        require("nvim-ts-autotag").setup({
            ops = {
                enable_close = true,
                enable_rename = true,
                enabel_close_on_slash = false,
            },

            per_filetype = {
                ["astro"] = {
                    snable_close = true
                }
            }
        })
    end
}
