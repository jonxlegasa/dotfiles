# jon's dotfiles

Simply clone the repo and run

```bash
bash setup.sh
```

## TeXpresso setup

TeXpresso has two pieces in this dotfiles setup:

- `texpresso.vim` is installed by Lazy.nvim from `nvim/lua/plugins/texpresso.lua`. The upstream manual `~/.config/nvim/start/texpresso.vim` clone is not needed for this config.
- The external `texpresso` executable is built by `scripts/setup_texpresso.sh` and launched from `~/.local/bin/texpresso`.

Run the TeXpresso setup on its own with:

```bash
bash scripts/setup_texpresso.sh
```

After it finishes, open a `.tex` file in Neovim and run:

```vim
:TeXpresso %
```


## Showing my roommate the power of git
> hey!
