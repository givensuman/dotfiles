return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    tag = "v1.10.0",
    opts = function(_, opts)
      opts.transparent_background = true

      local module = require("catppuccin.groups.integrations.bufferline")
      if module then
        module.get = module.get_theme
      end
      return opts
    end,
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
