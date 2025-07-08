return{
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local color_options = { [1] = "kanagawa", [2] = "kanagawa-wave", [3] = "kanagawa-dragon",
            [4] = "kanagawa-lotus" }
        vim.cmd.colorscheme(color_options[2])
    end
}
