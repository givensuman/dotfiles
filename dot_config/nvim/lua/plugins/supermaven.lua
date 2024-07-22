-- Supermaven is still in a buggy state,
-- use Codeium for time being
if true then
  return {}
end

return {
  {
    "nvim-cmp",
    dependencies = {
      "supermaven-inc/supermaven-nvim",
      build = ":SupermavenUseFree",
      config = function()
        require("supermaven-nvim").setup({
          keymaps = {
            accept_suggestion = "<C-g>",
            accept_word = "<C-f>",
          },
          log_level = "off",
          disable_inline_completion = false,
          disable_auto_import = false,
        })
      end,
    },
    opts = {
      preselect = "none",
      completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      },
    },
    config = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "supermaven",
        group_index = 1,
        priority = 100,
      })
    end,
  },
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   build = ":SupermavenUseFree",
  --   config = function()
  --     require("supermaven-nvim").setup({
  --       keymaps = {
  --         accept_suggestion = "<C-g>",
  --         accept_word = "<C-f>",
  --       },
  --       log_level = "off",
  --       disable_inline_completion = false,
  --       disable_auto_import = false,
  --     })
  --   end,
  -- },
  {
    "Exafunction/codeium.nvim",
    enabled = false,
  },
}
