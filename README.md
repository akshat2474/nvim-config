# ⚡ Modern Neovim Configuration

A clean, modular, and blazing-fast Neovim setup optimized for **C++**, **Python**, **Dart & Flutter**, and **LeetCode** problem solving directly from the editor with fuzzy-searchable problem lists.

Powered by [`lazy.nvim`](https://github.com/folke/lazy.nvim).

---

## 🚀 Features

- 🏎️ **Fast Startup & Modular Architecture**: Clean separation into `lua/config/` and `lua/plugins/`.
- 🎨 **Aesthetic TokyoNight Theme**: Polished statusline (`lualine.nvim`), bufferline (`bufferline.nvim`), and file explorer (`neo-tree.nvim`).
- 🧠 **Full LSP & Autocompletion**:
  - `clangd` for C & C++ (background indexing, clang-tidy, header insertion).
  - `pyright` for Python with type checking.
  - `dartls` for Dart & Flutter.
  - `lua_ls` for Neovim Lua development.
  - Autocompletion via `nvim-cmp` + `LuaSnip` + `friendly-snippets`.
- ⚡ **Instant Code Runner**:
  - `<leader>rr`: Auto-detects and runs C++, Python, or Dart.
  - `<leader>rc`: Compiles C++ (`clang++ -std=c++20 -O2 -Wall`) and runs in an interactive terminal.
  - `<leader>rp`: Runs current Python script (`python3`).
  - `<leader>rd`: Runs current Dart file (`dart`).
- 📱 **First-Class Flutter & Dart Integration**:
  - Powered by `flutter-tools.nvim`.
  - Hot reload (`<leader>Fh` or `<F5>`), Hot restart (`<leader>FR`), Flutter Run (`<leader>Fr`), Quit (`<leader>Fq`).
  - Device selector (`<leader>Fd`), Emulator selector (`<leader>Fe`), Logs toggle (`<leader>Fl`), Outline (`<leader>Fo`).
- 🧩 **LeetCode directly inside Neovim**:
  - Powered by `kawre/leetcode.nvim` integrated with Telescope.
  - `<leader>ll`: Searchable list of all LeetCode questions (filter by difficulty, status, tags).
  - `<leader>lm`: LeetCode Dashboard / Menu.
  - `<leader>ld`: Today's Daily Challenge.
  - `<leader>lr`: Run test cases.
  - `<leader>ls`: Submit solution.
  - `<leader>lt`: Run custom testcase input.
  - `<leader>li`: View question description/info.
  - `<leader>lR`: Pick a random question.
- 🔍 **Telescope Fuzzy Finder**:
  - Fast file search (`<leader>ff`), live grep (`<leader>fg`), buffer picker (`<leader>fb`), help tags (`<leader>fh`).
- 🧹 **Auto-Formatting on Save**:
  - Powered by `conform.nvim` (`clang-format`, `ruff_format` / `black`, `dart_format`, `stylua`).
- 🪵 **Interactive Floating Terminal**:
  - `<leader>tt` or `<C-\>` to toggle a floating terminal for stdin/stdout testing and shell tasks.

---

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua                      # Configuration entry point
├── lua/
│   ├── config/
│   │   ├── options.lua           # Global Neovim options & settings
│   │   ├── keymaps.lua           # Global key mappings & window management
│   │   ├── autocmds.lua          # Auto commands (yank highlight, formatting)
│   │   └── lazy.lua              # lazy.nvim package manager bootstrap
│   └── plugins/
│       ├── colorscheme.lua       # TokyoNight theme
│       ├── ui.lua                # Statusline, bufferline, explorer, notifications
│       ├── telescope.lua         # Fuzzy finder & search
│       ├── treesitter.lua        # Syntax highlighting for all languages
│       ├── lsp.lua               # Language servers & diagnostic configs
│       ├── completion.lua        # nvim-cmp completion & snippets
│       ├── formatting.lua        # conform.nvim formatters
│       ├── runner.lua            # Toggleterm & C++/Python/Dart execution
│       ├── flutter.lua           # flutter-tools.nvim suite
│       ├── leetcode.lua          # LeetCode with Telescope problem picker
│       └── git.lua               # Git signs & hunk actions
├── .gitignore
└── README.md
```

---

## ⌨️ Keybindings Cheat Sheet

### Leader Key: `<Space>`

#### 🧩 LeetCode
| Keymap | Command | Description |
|---|---|---|
| `<leader>ll` | `:Leet list` | **Searchable problem list (Telescope)** |
| `<leader>lm` | `:Leet` | Open LeetCode dashboard |
| `<leader>ld` | `:Leet daily` | Solve today's daily problem |
| `<leader>lr` | `:Leet run` | Run test cases |
| `<leader>ls` | `:Leet submit` | Submit solution |
| `<leader>lt` | `:Leet test` | Test with custom input |
| `<leader>li` | `:Leet info` | Toggle problem description split |
| `<leader>lR` | `:Leet random` | Pick a random problem |
| `<leader>lo` | `:Leet open` | Open current problem on website |
| `<leader>ly` | `:Leet yank` | Copy solution code |
| `<leader>lq` | `:Leet exit` | Exit LeetCode session |

#### 🏃 Code Execution & Runners
| Keymap | Action |
|---|---|
| `<leader>rr` | **Smart Run**: Auto-detects C++, Python, or Dart and executes in terminal |
| `<leader>rc` | **Compile & Run C++**: `clang++ -std=c++20 -O2 -Wall file.cpp -o file && ./file` |
| `<leader>rp` | **Run Python**: `python3 file.py` |
| `<leader>rd` | **Run Dart**: `dart file.dart` |
| `<leader>tt` / `<C-\>` | Toggle floating interactive terminal |

#### 📱 Flutter & Dart
| Keymap | Command | Action |
|---|---|---|
| `<leader>Fr` | `:FlutterRun` | Run Flutter application |
| `<leader>Fh` / `<F5>` | `:FlutterReload` | Hot reload |
| `<leader>FR` | `:FlutterRestart` | Hot restart |
| `<leader>Fq` | `:FlutterQuit` | Quit Flutter app |
| `<leader>Fd` | `:FlutterDevices` | Select target device |
| `<leader>Fe` | `:FlutterEmulators`| Launch emulator |
| `<leader>Fl` | `:FlutterLogToggle`| Toggle log split |
| `<leader>Fo` | `:FlutterOutlineToggle` | Toggle widget outline |

#### 🔍 Telescope Search
| Keymap | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (ripgrep) |
| `<leader>fb` | Find open buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>fd` | Workspace diagnostics |

#### 🧭 Navigation & Buffers
| Keymap | Action |
|---|---|
| `<leader>e` | Toggle Neo-tree file explorer |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Navigate between split windows |
| `<leader>sv` / `<leader>sh` | Vertical / Horizontal window split |
| `<S-l>` / `<S-h>` | Next / Previous buffer tab |
| `<leader>bd` | Close current buffer tab |
| `<leader>cf` | Format current document |

---

## 🍪 How to Connect Your LeetCode Account

To submit solutions and track problem completion:
1. Open Neovim: `nvim`
2. Run `:Leet` or `<leader>lm`
3. If signing in with cookie (recommended for LeetCode.com):
   - In your browser, log in to `https://leetcode.com`
   - Open DevTools (F12) -> Application -> Cookies -> `https://leetcode.com`
   - Copy the value of `LEETCODE_SESSION` and `csrftoken`
   - Run `:Leet cookie` in Neovim and paste your credentials when prompted.
4. Run `<leader>ll` to immediately open and search all problems!
