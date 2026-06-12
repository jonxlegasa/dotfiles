# Neovim config

Based on [LazyVim](https://github.com/LazyVim/LazyVim) with the `lang.tex` extra.

## Structure

```
nvim/
├── init.lua              # Entry point → config.lazy
├── lazy-lock.json         # Pinned plugin versions
├── lazyvim.json           # LazyVim extras / news
├── stylua.toml            # Lua formatter config
└── lua/
    ├── config/
    │   ├── lazy.lua       # Plugin manager + imports
    │   ├── keymaps.lua    # Custom keymaps (incl. LaTeX)
    │   ├── options.lua    # Editor settings (tab=2, etc.)
    │   └── autocmds.lua   # Filetype autocommands
    └── plugins/
        ├── latex.lua      # vimtex: zathura viewer, continuous compilation
        ├── texpresso.lua  # Alternative incremental preview (needs cargo)
        ├── conform.lua    # Formatting (stylua, black, prettier)
        ├── mason.lua      # LSP servers (pyright, julia-lsp)
        ├── nvim-treesitter.lua
        ├── obsidian.lua   # Note-taking
        ├── vim-dadbod-ui.lua
        ├── onedark.lua    # Colorscheme
        ├── twilight.lua
        ├── zen-mode.lua
        └── dotenv.lua
```

## LaTeX live preview

Requires system packages: `texlive-basic texlive-latex texlive-latexrecommended texlive-binextra zathura zathura-pdf-poppler`.

| Keystroke        | Action                            |
|------------------|-----------------------------------|
| `<leader>tc`     | Start continuous compilation      |
| `<leader>tv`     | Open zathura (auto-refreshes PDF) |
| `<leader>te`     | Show errors/warnings              |
| `<leader>tC`     | Clean auxiliary files             |
| `<localleader>lv`| Forward-search to zathura         |
| `Ctrl+click`     | Inverse-search back to source     |

Leader is Space, localleader is `\`.
