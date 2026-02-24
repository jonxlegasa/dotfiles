return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/home/archimedes/Documents/archimedesvault"
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },

    -- Use the title as-is for the filename.
    ---@param title string|nil
    ---@return string
    note_id_func = function(title)
      if title ~= nil then
        return title
      end
      return tostring(os.time())
    end,

    -- Set aliases to the human-readable title and add a summary field.
    ---@param note table an obsidian.Note object
    ---@return table frontmatter
    note_frontmatter_func = function(note)
      local out = { id = note.id, aliases = {}, tags = note.tags or {}, summary = "" }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      -- Always include the note title as an alias so links display the name.
      if note.aliases then
        out.aliases = note.aliases
      end
      if note.title and note.title ~= "" then
        if not vim.tbl_contains(out.aliases, note.title) then
          table.insert(out.aliases, note.title)
        end
      end
      return out
    end,
  },
}
