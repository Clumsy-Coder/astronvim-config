-- Obsidian in neovim
-- https://github.com/epwalsh/obsidian.nvim
--
-- obtained from
-- - https://github.com/epwalsh/obsidian.nvim?tab=readme-ov-file#using-lazynvim
--
---@type LazySpec
return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
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
        path = os.getenv("OBSIDIAN_DIR_PATH") .. "/mimir", -- env set in ~/dotfiles/tools/zsh/.zshenv
      },
      -- {
      --   name = "work",
      --   path = "~/vaults/work",
      -- },
    },

    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
  },
}
