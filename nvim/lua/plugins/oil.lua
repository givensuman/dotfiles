return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ["?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-p>"] = "actions.preview",
      ["q"] = "actions.close",
      ["<BS>"] = "actions.parent",
      ["`"] = "actions.cd",
      ["H"] = "actions.toggle_hidden",
    },
    use_default_keymaps = false,
    default_keymaps = false,
  },
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
    },
  },
  keys = {
    {
      "<LEADER>o",
      function()
        require("oil").open_float()
      end,
      desc = "Open Buffer-Like Explorer",
    },
  },
}
