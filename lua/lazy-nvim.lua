-- Setup for lazy.nvim
-- lazypath is a local variable. By default in lua defining a variable without the local
-- keyword will make it available globally. Sets the lazy.nvim install directory.
-- Bootstrap lazy.nvim
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- rtp is the runtime path. This path contains a list of directories. These directories
-- contain information that isn't available to Neovim by default. For example, when
-- editing a .cpp file, Neovim does not know how to highlight the syntax for C++. So it
-- will look in the list of directories defined inside the rtp to answer that question.
-- This is not only true for syntax highlighting but various other things that Neovim
-- might not know about by default.
vim.opt.rtp:prepend(lazypath)

-- Setting up plugins
require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.colorschemes" }
})

