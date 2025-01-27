---@type LazySpec
return {
  "HiPhish/rainbow-delimiters.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      opts = { integrations = { rainbow_delimiters = true } },
    },
  },
}
