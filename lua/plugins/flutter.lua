return {
    {
        "akinsho/flutter-tools.nvim",
        ft = { "dart" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
        },
        keys = {
            { "<leader>Fr", "<cmd>FlutterRun<CR>", desc = "Flutter Run" },
            { "<leader>Fh", "<cmd>FlutterReload<CR>", desc = "Flutter Hot Reload" },
            { "<leader>FR", "<cmd>FlutterRestart<CR>", desc = "Flutter Hot Restart" },
            { "<leader>Fq", "<cmd>FlutterQuit<CR>", desc = "Flutter Quit" },
            { "<leader>Fd", "<cmd>FlutterDevices<CR>", desc = "Flutter Devices" },
            { "<leader>Fe", "<cmd>FlutterEmulators<CR>", desc = "Flutter Emulators" },
            { "<leader>Fl", "<cmd>FlutterLogToggle<CR>", desc = "Flutter Toggle Log" },
            { "<leader>Fo", "<cmd>FlutterOutlineToggle<CR>", desc = "Flutter Toggle Outline" },
            { "<leader>Fc", "<cmd>FlutterCopyProfilerUrl<CR>", desc = "Flutter Copy Profiler URL" },
            { "<F5>", "<cmd>FlutterReload<CR>", desc = "Flutter Hot Reload" },
        },
        opts = {
            ui = {
                border = "rounded",
            },
            decorations = {
                statusline = {
                    app_version = true,
                    device = true,
                },
            },
            widget_guides = {
                enabled = true,
            },
            closing_tags = {
                highlight = "Comment",
                prefix = ">",
                enabled = true,
            },
            dev_log = {
                enabled = true,
                open_cmd = "botright 12split",
            },
            lsp = {
                color = {
                    enabled = true,
                },
                settings = {
                    showTodos = true,
                    completeFunctionCalls = true,
                    renameFilesWithClasses = "prompt",
                    enableSnippets = true,
                },
            },
        },
    },
}
