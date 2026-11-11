return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        keys = {
            { "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle Floating Terminal" },
            { "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle Terminal" },
        },
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<C-\>]],
            hide_numbers = true,
            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = false,
            float_opts = {
                border = "curved",
                winblend = 0,
            },
        },
        config = function(_, opts)
            require("toggleterm").setup(opts)
            local Terminal = require("toggleterm.terminal").Terminal

            -- Helper to run commands in a dedicated runner terminal
            local runner_term = Terminal:new({
                direction = "float",
                close_on_exit = false,
                hidden = true,
            })

            local function run_in_terminal(cmd)
                vim.cmd("silent! write")
                runner_term:send(cmd, true)
                runner_term:open()
            end

            -- Build commands for supported languages
            local function get_cpp_cmd(filepath, outpath)
                return string.format('clang++ -std=c++20 -O2 -Wall "%s" -o "%s" && "%s"', filepath, outpath, outpath)
            end

            local function get_python_cmd(filepath)
                return string.format('python3 "%s"', filepath)
            end

            local function get_dart_cmd(filepath)
                return string.format('dart "%s"', filepath)
            end

            -- Command generator dispatch table
            local dispatch = {
                cpp = function(f, o) return get_cpp_cmd(f, o) end,
                c = function(f, o) return string.format('clang -O2 -Wall "%s" -o "%s" && "%s"', f, o, o) end,
                python = function(f) return get_python_cmd(f) end,
                dart = function(f) return get_dart_cmd(f) end,
            }

            local function smart_run()
                local ft = vim.bo.filetype
                local filepath = vim.fn.expand("%:p")
                local outpath = vim.fn.expand("%:p:r")
                local handler = dispatch[ft]

                if not handler then
                    vim.notify("No runner configured for filetype: " .. ft, vim.log.levels.WARN)
                    return
                end

                run_in_terminal(handler(filepath, outpath))
            end

            -- Keymaps for running code
            local map = vim.keymap.set
            map("n", "<leader>rr", smart_run, { desc = "Smart Run Current File" })
            map("n", "<leader>rc", function()
                local f = vim.fn.expand("%:p")
                local o = vim.fn.expand("%:p:r")
                run_in_terminal(get_cpp_cmd(f, o))
            end, { desc = "Compile & Run C++" })
            map("n", "<leader>rp", function()
                local f = vim.fn.expand("%:p")
                run_in_terminal(get_python_cmd(f))
            end, { desc = "Run Python" })
            map("n", "<leader>rd", function()
                local f = vim.fn.expand("%:p")
                run_in_terminal(get_dart_cmd(f))
            end, { desc = "Run Dart" })
        end,
    },
}
