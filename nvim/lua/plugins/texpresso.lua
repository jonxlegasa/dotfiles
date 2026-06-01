return {
  "let-def/texpresso.vim",
  lazy = true,
  cmd = "TeXpresso",
  ft = "tex",
  config = function()
    local texpresso = require("texpresso")
    texpresso.texpresso_path = vim.fn.expand(vim.env.TEXPRESSO_PATH or "texpresso")

    if texpresso._dotfiles_launch_guard then
      return
    end

    local launch = texpresso.launch
    texpresso.launch = function(args)
      if vim.fn.executable(texpresso.texpresso_path) ~= 1 then
        vim.notify(
          "TeXpresso executable not found: "
            .. texpresso.texpresso_path
            .. "\nInstall let-def/texpresso, or set TEXPRESSO_PATH to the built binary.",
          vim.log.levels.ERROR,
          { title = "TeXpresso" }
        )
        return
      end

      return launch(args)
    end

    texpresso._dotfiles_launch_guard = true
  end,
}
