return {
  "phaazon/hop.nvim",
  config = function()
    require("hop").setup({
      keys = "etovxqpdygfblzhckisuran",
    })
  end,
  keys = {
    { "<LEADER>hw", "<CMD>HopWord<CR>", desc = "Hop To Word" },
    { "<LEADER>hl", "<CMD>HopLine<CR>", desc = "Hop To Line" },
    { "<LEADER>ha", "<CMD>HopAnywhere<CR>", desc = "Hop Anywhere" },
  },
}
