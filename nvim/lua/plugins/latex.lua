return {
  {
    "lervag/vimtex",
    init = function()
      -- Live preview with zathura (auto-reloads on PDF change)
      vim.g.vimtex_view_method = "zathura"

      -- Forward search: <localleader>lv (already set by vimtex)
      -- Inverse search: Ctrl+click in zathura jumps back to source

      -- Continuous compilation is enabled by default (latexmk -pvc).
      -- Override if custom options are needed:
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = ".build",
        out_dir = ".",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      -- Suppress some noisy warnings
      vim.g.vimtex_quickfix_enabled = 1
      vim.g.vimtex_quickfix_open_on_warning = 0
    end,
  },
}
