return {
  "phaazon/hop.nvim",
  config = function()
    require("hop").setup({
      keys = "ghfjtyvbrudkcn",
    })
  end,
  keys = {
    { mode = { "n", "v" }, "<LEADER>hw", "<CMD>HopWord<CR>", desc = "Hop To Word" },
    { mode = { "n", "v" }, "<LEADER>hl", "<CMD>HopLine<CR>", desc = "Hop To Line" },
    { mode = { "n", "v" }, "<LEADER>ha", "<CMD>HopAnywhere<CR>", desc = "Hop Anywhere" },
  },
}
