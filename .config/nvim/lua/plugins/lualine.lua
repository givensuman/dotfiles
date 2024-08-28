local function get_formatter()
  -- Check if 'conform' is available
  local status, conform = pcall(require, "conform")
  if not status then
    return {}
  end

  local lsp_format = require("conform.lsp_format")

  -- Get formatters for the current buffer
  local formatters = conform.list_formatters_for_buffer()
  if formatters and #formatters > 0 then
    local formatterNames = {}

    for _, formatter in ipairs(formatters) do
      table.insert(formatterNames, formatter)
    end

    return "󰷈 " .. table.concat(formatterNames, " ")
  end

  -- Check if there's an LSP formatter
  local bufnr = vim.api.nvim_get_current_buf()
  local lsp_clients = lsp_format.get_format_clients({ bufnr = bufnr })

  if not vim.tbl_isempty(lsp_clients) then
    return "󰷈 LSP Formatter"
  end

  return ""
end

-- local background = string.format("#%06x", vim.api.nvim_get_hl_by_name("BufferLineBackground", true).background

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
      lualine_b = {
        {
          "branch",
          -- hard-coded for now
          color = { bg = "#161622" },
        },
      },
      lualine_c = { "filetype" },
      lualine_x = { get_formatter },
      lualine_y = {
        {
          "location",
          -- hard-coded for now
          color = { bg = "#161622", gui = "bold" },
        },
      },
      lualine_z = {
        {
          "progress",
          left_padding = 2,
          right_padding = 2,
        },
      },
    },
    tabline = {},
    extensions = {},
  },
}
