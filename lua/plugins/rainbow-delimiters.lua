-- Rainbow delimiters for Neovim with Tree-sitter 
-- https://github.com/HiPhish/rainbow-delimiters.nvim
--
-- obtained from
--    https://code.mehalter.com/AstroNvim_user/~files/76443b5/lua/plugins/rainbow-delimiters.lua
--
---@type LazySpec
return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    -- dependencies = {
    --   {
    --     "AstroNvim/astrocore",
    --     opts = {
    --       mappings = {
    --         n = {
    --           ["<Leader>u("] = {
    --             function()
    --               local bufnr = vim.api.nvim_get_current_buf()
    --               require("rainbow-delimiters").toggle(bufnr)
    --               require("astrocore").notify(
    --                 string.format(
    --                   "Buffer rainbow delimeters %s",
    --                   require("rainbow-delimiters").is_enabled(bufnr) and "on" or "off"
    --                 )
    --               )
    --             end,
    --             desc = "Toggle rainbow delimeters (buffer)",
    --           },
    --         },
    --       },
    --     },
    --   },
    -- },
    event = "User AstroFile",
    main = "rainbow-delimiters.setup",
    -- opts = {},
  },
  {
    "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { rainbow_delimiters = true } },
  },
}

