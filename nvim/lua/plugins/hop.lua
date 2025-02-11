---@type LazySpec
return {
  "phaazon/hop.nvim",
  config = function()
    require("hop").setup({
      keys = "ghfjtyvbrudkcn",
    })
  end,
  keys = {
    { "<LEADER>hw", "<CMD>HopWord<CR>", mode = { "n", "v" }, desc = "Hop To Word" },
    { "<LEADER>hl", "<CMD>HopLine<CR>", mode = { "n", "v" }, desc = "Hop To Line" },
    { "<LEADER>ha", "<CMD>HopAnywhere<CR>", mode = { "n", "v" }, desc = "Hop Anywhere" },
  },
}
