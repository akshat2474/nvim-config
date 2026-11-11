# nvim-config

Neovim setup configured for C++, Python, Dart, Flutter, and LeetCode.

## Requirements

- Neovim >= 0.10
- C/C++ toolchain (`clang`, `clang++`, `clangd`, `clang-format`)
- Python 3 (`python3`, `pynvim`, `black` or `ruff`)
- Flutter & Dart SDK
- Node.js, `git`, `ripgrep`, `fd`

## Installation

```bash
git clone https://github.com/akshat2474/nvim-config.git ~/.config/nvim
nvim
```

Plugins will install automatically on first launch via `lazy.nvim`.

## Keybindings

Leader key is `Space`.

### LeetCode

- `<leader>ll` — Search problem list (Telescope)
- `<leader>lm` — Dashboard
- `<leader>ld` — Daily problem
- `<leader>lr` — Run test cases
- `<leader>ls` — Submit solution
- `<leader>lt` — Test custom input
- `<leader>li` — Toggle problem description

Authenticate inside Neovim via `:Leet cookie`.

### Code Runner

- `<leader>rr` — Run current file (auto-detects C++, Python, or Dart)
- `<leader>rc` — Compile & run C++ (`clang++ -std=c++20 -O2 -Wall`)
- `<leader>rp` — Run Python (`python3`)
- `<leader>rd` — Run Dart (`dart`)
- `<leader>tt` or `<C-\>` — Toggle terminal

### Flutter

- `<leader>Fr` — Run
- `<leader>Fh` or `<F5>` — Hot reload
- `<leader>FR` — Hot restart
- `<leader>Fd` — Device selector
- `<leader>Fe` — Emulator selector
- `<leader>Fl` — Toggle logs
- `<leader>Fq` — Quit

### Navigation & Tools

- `<leader>ff` — Find files
- `<leader>fg` — Live grep
- `<leader>fb` — Open buffers
- `<leader>e` — Toggle file explorer
- `<leader>cf` — Format buffer
- `<C-h/j/k/l>` — Split navigation

For step-by-step language workflows and detailed usage instructions, see [USAGE.md](USAGE.md).

