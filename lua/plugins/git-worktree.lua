-- A simple wrapper around git worktree operations
-- https://github.com/Clumsy-Coder/git-worktree.nvim

-- to use this, the cloned repo needs to be converted into a bare repo
-- obtained from
-- - https://stackoverflow.com/a/2200662/3053548
--
-- steps:
-- cd repo
-- mv .git ../repo.git # renaming just for clarity
-- cd ..
-- rm -fr repo
-- cd repo.git
-- git config --bool core.bare true

local prefix = "<Leader>g"

---@type LazySpec
return {
  {
    "Clumsy-Coder/git-worktree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              [prefix] = {
                w = {
                  name = "worktrees",
                  a = { function() require("telescope").extensions.git_worktree.create_git_worktree() end, "Add worktree", silent = true, },
                  s = { function() require("telescope").extensions.git_worktree.git_worktrees() end, "Switch worktree" },
                  -- r = { function() require("git-worktree").delete_worktree() end, "Remove worktree"},
                },
              },
            },
          },
        },
      },
    },
    event = "User Astrofile",
    config = function()
      require("git-worktree").setup()

      local Worktree = require("git-worktree")
      local Job = require("plenary.job")

      local function is_nrdp() return not not (string.find(vim.loop.cwd(), vim.env.NRDP, 1, true)) end

      Worktree.on_tree_change(function(op, path, upstream)
        if op == Worktree.Operations.Create then
          Job:new({
            "git",
            "submodule",
            "update",
          }):start()
        end
      end)

      -- load git-worktree in telescope
      require("telescope").load_extension("git_worktree")
    end,
    -- pinning this extension because git worktree throws an error when switching worktrees
    -- a temp fix was applied on PR 106
    -- https://github.com/ThePrimeagen/git-worktree.nvim/pull/106/files
    pin = true,
  },
}

