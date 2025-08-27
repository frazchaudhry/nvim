return {
    {
        "nvim-telescope/telescope.nvim", tag = '0.1.8',
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous, -- move to previous result
                            ["<C-j>"] = actions.move_selection_next, -- move to next result
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
                        }
                    },
                    file_ignore_patterns = {
                        "build/",
                        "cmake-build-debug/",
                        "node_modules/",
                        "%.git/"
                    }
                }
            })

            local keymap = vim.keymap
            local builtin = require("telescope.builtin")

            keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files. Fuzzy find files in current working directory." })
            keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
            keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep. Find string in cwd" })
            keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
            keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
            keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").load_extension("ui-select")
        end
    }
}
