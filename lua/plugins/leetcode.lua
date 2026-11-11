return {
    {
        "kawre/leetcode.nvim",
        lazy = "leetcode.nvim" ~= vim.fn.argv(0, ""),
        cmd = "Leet",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>ll", "<cmd>Leet list<CR>", desc = "LeetCode: Search Problems (List)" },
            { "<leader>lm", "<cmd>Leet<CR>", desc = "LeetCode: Dashboard / Menu" },
            { "<leader>ld", "<cmd>Leet daily<CR>", desc = "LeetCode: Today's Daily Problem" },
            { "<leader>lr", "<cmd>Leet run<CR>", desc = "LeetCode: Run Test Cases" },
            { "<leader>ls", "<cmd>Leet submit<CR>", desc = "LeetCode: Submit Solution" },
            { "<leader>lt", "<cmd>Leet test<CR>", desc = "LeetCode: Test Custom Input" },
            { "<leader>li", "<cmd>Leet info<CR>", desc = "LeetCode: Toggle Problem Info" },
            { "<leader>lR", "<cmd>Leet random<CR>", desc = "LeetCode: Random Problem" },
            { "<leader>lo", "<cmd>Leet open<CR>", desc = "LeetCode: Open in Browser" },
            { "<leader>ly", "<cmd>Leet yank<CR>", desc = "LeetCode: Copy Solution" },
            { "<leader>lq", "<cmd>Leet exit<CR>", desc = "LeetCode: Exit Session" },
        },
        opts = {
            arg = "leetcode.nvim",
            lang = "cpp", -- Default template language (cpp, python3, etc.)
            cn = {
                enabled = false,
            },
            storage = {
                home = vim.fn.stdpath("data") .. "/leetcode",
                cache = vim.fn.stdpath("cache") .. "/leetcode",
            },
            picker = {
                provider = "telescope", -- Searchable list via Telescope
            },
            console = {
                open_on_runcode = true,
                dir = "row",
                size = {
                    width = "90%",
                    height = "75%",
                },
                result = {
                    size = "60%",
                },
                testcase = {
                    virt_text = true,
                    size = "40%",
                },
            },
            description = {
                position = "left",
                width = "40%",
                show_stats = true,
            },
        },
    },
}
