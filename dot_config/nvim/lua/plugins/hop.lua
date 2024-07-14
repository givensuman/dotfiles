return {
  "phaazon/hop.nvim",
  config = function()
    require("hop").setup({
      keys = "etovxqpdygfblzhckisuran",
    })
  end,
  keys = {
    { "<leader>hw", "<CMD>HopWord<CR>", desc = "Hop To Word" },
    { "<leader>hl", "<CMD>HopLine<CR>", desc = "Hop To Line" },
    { "<leader>ha", "<CMD>HopAnywhere<CR>", desc = "Hop Anywhere" },
  },
}
