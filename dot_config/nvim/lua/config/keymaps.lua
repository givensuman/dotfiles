local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then
      opts.desc = "keymaps.lua: " .. opts.desc
    end
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- AstroNvim-like buffer selection
map("n", "<LEADER>bb", function()
  require("bufferline").pick()
end, { desc = "Select Buffer" })

-- AstroNvim-like explorer toggle
map("n", "<LEADER>o", function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd("p")
  else
    vim.cmd.Neotree("focus")
  end
end, { desc = "Toggle Explorer Focus" })

-- Block indentation via tab and shift/tab
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")
