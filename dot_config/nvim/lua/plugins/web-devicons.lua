return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  enabled = vim.g.icons_enabled ~= false,
  opts = function()
    return {
      override = {
        lock = { icon = "󰌾", name = "Lock" },
        out = { icon = "", name = "Out" },
        xz = { icon = "", name = "Xz" },
        zip = { icon = "", name = "Zip" },
      },
    }
  end,
}
