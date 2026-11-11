return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall", "TSInstallSync" },
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "python",
                "dart",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "json",
                "html",
                "markdown",
                "markdown_inline",
                "bash",
                "yaml",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
