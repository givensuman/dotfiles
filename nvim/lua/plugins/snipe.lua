return {
  "leath-dub/snipe.nvim",
  config = function()
    require("snipe").setup({
      ui = {
        position = "center",
      },
    })
  end,
  keys = {
    {
      "<LEADER>bb",
      function()
        require("snipe").open_buffer_menu()
      end,
      desc = "Open Buffer Menu",
    },
  },
}
