# User Guide & Keybindings

This guide explains how to use this Neovim configuration for daily development, competitive programming, and LeetCode problem solving.

---

## 1. Core Basics & Navigation

The **Leader key** is set to `Space`. All custom leader commands begin by pressing `Space` followed by the key sequence.

### File & Project Navigation
- `<leader>e` — Open or close the file tree explorer (Neo-tree).
  - Inside the tree: `a` to create a file/folder, `d` to delete, `r` to rename, `Enter` to open.
- `<leader>ff` — Search for files across the project (Telescope fuzzy finder).
- `<leader>fg` — Search for text inside files (`ripgrep` live grep).
- `<leader>fb` — List open buffers/tabs.
- `<leader>fr` — Recently opened files.

### Buffers & Splits
- `<S-l>` / `<S-h>` — Next / previous buffer tab.
- `<leader>bd` — Close current buffer.
- `<leader>sv` — Split window vertically.
- `<leader>sh` — Split window horizontally.
- `<leader>sx` — Close the current split window.
- `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` — Move cursor to left, lower, upper, or right split.

### Saving & Quitting
- `<C-s>` or `<leader>w` — Save file.
- `<leader>q` — Quit window.
- `<leader>cf` — Manually format the current file.

---

## 2. C++ Workflow

### Opening & Writing C++
Open any `.cpp` file (`nvim solution.cpp`). Neovim will automatically activate `clangd` and syntax highlighting.

- **Auto-Completion**: Type code and `nvim-cmp` will suggest completions. Use `<Tab>` / `<S-Tab>` or `<C-j>` / `<C-k>` to navigate, and `<CR>` (Enter) to confirm.
- **Hover Docs**: Press `K` on any function, type, or variable to view documentation and signatures.
- **Go to Definition**: Press `gd` to jump to definition, `gr` to find all references with Telescope.
- **Diagnostics**: Errors and warnings appear inline. Jump between them using `[d` (previous) and `]d` (next). Press `<leader>cd` to view the floating diagnostic message.
- **Auto-Formatting**: Code is automatically formatted on save using `clang-format`.

### Compiling & Running C++
- `<leader>rc` — Compiles using `clang++ -std=c++20 -O2 -Wall` and runs the binary in an interactive floating terminal.
- `<leader>rr` — Smart run (automatically detects C++ and triggers compile + run).
- `<leader>tt` or `<C-\>` — Toggle the interactive floating terminal at any time.

When the floating terminal opens:
1. It supports standard interactive input (`std::cin`).
2. Press `i` to enter input mode if needed.
3. Press `<Esc><Esc>` or `<C-\>` to close or hide the terminal and return to your code buffer.

---

## 3. Python Workflow

### Opening & Writing Python
Open any `.py` file (`nvim script.py`). Neovim activates `pyright` for type checking and analysis.

- **Formatting**: Auto-formats on save using `black` or `ruff`.
- **Code Actions & Rename**: Press `<leader>ca` for quick fixes or `<leader>rn` to rename a symbol across the file.

### Running Python
- `<leader>rp` — Executes the current file using `python3` in the interactive terminal.
- `<leader>rr` — Smart run (detects Python and runs).
- Interactive input (`input()`) works directly inside the terminal window.

---

## 4. Dart & Flutter Workflow

### Standalone Dart
Open any `.dart` file (`nvim main.dart`).
- `<leader>rd` — Executes the script with `dart <filename>` in the interactive terminal.
- `<leader>rr` — Smart run.

### Flutter Applications
Open any Flutter project root in Neovim (`nvim .` or `nvim lib/main.dart`).

1. **Pick Device / Emulator**:
   - `<leader>Fd` — Lists connected physical devices, web, or simulators.
   - `<leader>Fe` — Lists and launches configured emulators.
2. **Launch Application**:
   - `<leader>Fr` — Runs `:FlutterRun`. Neovim compiles and launches the app on your selected target.
3. **Hot Reload & Hot Restart**:
   - `<leader>Fh` or `<F5>` — Hot reload changes instantly without restarting the app.
   - `<leader>FR` — Hot restart application state.
4. **Logs & Debugging**:
   - `<leader>Fl` — Toggles the Flutter debug logs split at the bottom of the screen.
   - `<leader>Fo` — Toggles the widget tree outline.
   - `<leader>Fc` — Copies the Dart DevTools profiler URL to your clipboard.
5. **Quit Flutter Session**:
   - `<leader>Fq` — Stops the running Flutter debug process.

---

## 5. LeetCode Workflow

Solve problems directly inside Neovim with full test runner and submission support.

### One-Time Authentication
To submit solutions and track completed problems, link your LeetCode account:
1. Log in to [leetcode.com](https://leetcode.com) in your browser.
2. Open DevTools (`Cmd + Option + I` or `F12`) -> **Application** -> **Cookies** -> `https://leetcode.com`.
3. Copy the values of `LEETCODE_SESSION` and `csrftoken`.
4. Inside Neovim, run:
   ```vim
   :Leet cookie
   ```
5. Paste your `LEETCODE_SESSION` and `csrftoken` when prompted.

### Finding & Solving Problems
- `<leader>ll` — **Searchable problem list**.
  - Opens Telescope with all LeetCode questions.
  - Type to filter by problem title, number, or topic tags.
  - Press `<CR>` to open the question.
- `<leader>lm` — Opens the LeetCode dashboard/menu.
- `<leader>ld` — Opens today's daily challenge.
- `<leader>lR` — Opens a random question.

### Writing, Testing, & Submitting
Once a problem is open:
- `<leader>li` — Toggles the problem description, constraints, and examples in a side split.
- `<leader>lr` — **Run Code**: Executes your solution against the default example test cases.
- `<leader>lt` — **Custom Testcase**: Enter custom inputs to test edge cases.
- `<leader>ls` — **Submit**: Submits your solution to LeetCode and displays runtime/memory stats.
- `<leader>lo` — Opens the problem on leetcode.com in your default browser.
- `<leader>ly` — Yanks (copies) your solution code to the system clipboard.
- `<leader>lq` — Exits the LeetCode session and restores your normal layout.

### Switching LeetCode Language
C++ is set as the default language. To switch to Python 3 or another language:
```vim
:Leet lang python3
```

---

## 6. Complete Keybindings Reference

| Category | Keymap | Command / Action |
|---|---|---|
| **LeetCode** | `<leader>ll` | Search problems in Telescope picker |
| | `<leader>lm` | LeetCode dashboard / menu |
| | `<leader>ld` | Open today's daily challenge |
| | `<leader>lr` | Run default testcases |
| | `<leader>ls` | Submit solution |
| | `<leader>lt` | Test with custom input |
| | `<leader>li` | Toggle question description |
| | `<leader>lR` | Pick random problem |
| | `<leader>lo` | Open problem in browser |
| | `<leader>ly` | Copy solution code |
| | `<leader>lq` | Exit LeetCode session |
| **Runners** | `<leader>rr` | Auto-detect filetype and run |
| | `<leader>rc` | Compile & run C++ (`clang++ -std=c++20`) |
| | `<leader>rp` | Run Python (`python3`) |
| | `<leader>rd` | Run Dart (`dart`) |
| | `<leader>tt` or `<C-\>` | Toggle interactive floating terminal |
| **Flutter** | `<leader>Fr` | Start Flutter app (`:FlutterRun`) |
| | `<leader>Fh` or `<F5>` | Hot reload |
| | `<leader>FR` | Hot restart |
| | `<leader>Fd` | Select device |
| | `<leader>Fe` | Launch emulator |
| | `<leader>Fl` | Toggle Flutter logs |
| | `<leader>Fo` | Toggle widget outline |
| | `<leader>Fq` | Quit Flutter app |
| **Files & Search** | `<leader>e` | Toggle Neo-tree file explorer |
| | `<leader>ff` | Fuzzy find files |
| | `<leader>fg` | Live grep (search across files) |
| | `<leader>fb` | Open buffers list |
| | `<leader>fr` | Recent files |
| **LSP & Code** | `K` | Hover documentation |
| | `gd` | Go to definition |
| | `gr` | Find references |
| | `<leader>ca` | Code action / quick fixes |
| | `<leader>rn` | Rename symbol |
| | `<leader>cd` | Open diagnostic float |
| | `[d` / `]d` | Previous / next diagnostic |
| | `<leader>cf` | Format current document |
| **Navigation** | `<C-h/j/k/l>` | Navigate between split windows |
| | `<S-h>` / `<S-l>` | Switch to previous / next buffer tab |
| | `<leader>sv` / `<leader>sh` | Vertical / horizontal split |
| | `<leader>bd` | Close buffer |
| | `<leader>w` or `<C-s>` | Save file |
| | `<leader>q` | Quit |
