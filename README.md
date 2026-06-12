# jon's dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/) (target: `~/.config`).

## Quick start

```bash
git clone https://github.com/jonlegasa/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash setup.sh
```

## What's included

### Fish shell (`fish/`)

- Custom prompt, aliases, and 18 helper functions (mostly GitHub CLI wrappers)
- bun completions, Go path, Homebrew integration, atuin history
- Project-specific env vars for Demeter and Blaise

### Neovim (`nvim/`)

[LazyVim](https://github.com/LazyVim/LazyVim)-based config with custom plugins:

| Plugin | Purpose |
|--------|---------|
| vimtex + texlab | LaTeX editing, LSP, and live preview |
| conform.nvim | Auto-formatting (stylua, black, prettier) |
| obsidian.nvim | Second-brain note-taking |
| vim-dadbod + dadbod-ui | Database client |
| zen-mode + twilight | Distraction-free writing |
| onedark.nvim | Colorscheme |
| mason.nvim | LSP server management (pyright, julia-lsp) |

### LaTeX live preview

Open a `.tex` file and use these keymaps (leader = Space):

| Keystroke | Action |
|-----------|--------|
| `<leader>tc` | Start continuous compilation |
| `<leader>tv` | Open zathura PDF viewer (auto-refreshes on save) |
| `<leader>te` | Show errors/warnings |
| `<leader>tC` | Clean auxiliary files |

This requires system packages: `texlive-basic texlive-latex texlive-latexrecommended texlive-binextra zathura zathura-pdf-poppler`.

### tmux (`tmux/`)

- Prefix: `Ctrl-a`, vi-style pane navigation, TPM-managed plugins
- Plugins: tmux-sensible, tmux-fzf, tmux-resurrect, tmux-continuum

### Homebrew (`homebrew/`)

`leaves.txt` tracks top-level brew packages. Installed automatically by `setup.sh`.

## TeXpresso (alternative live preview)

An optional incremental LaTeX preview engine. Requires Rust/cargo to build.

```bash
bash scripts/setup_texpresso.sh
```

Once built, open a `.tex` file and run `:TeXpresso %`.
