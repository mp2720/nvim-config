return { {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            ensure_installed = {
                "go",
                "java",
                "python"
            }
        }
    end
} }
