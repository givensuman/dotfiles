local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if not opts.desc then
      opts.desc = "from keymaps.lua"
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
vim.cmd("vnoremap <TAB> >gv")
vim.cmd("vnoremap <S-TAB> <gv")
-- map("v", "<TAB>", ">gv")
-- map("v", "<S-TAB>", "<gv")
-- :help mode()
-- map("V", "<TAB>", ">gv")
-- map("V", "<S-TAB>", "<gv")
-- map("CTRL-V", "<TAB>", ">gv")
-- map("CTRL-V", "<S-TAB>", "<gv")

-- AstroNvim-like Telescope bindings
map("n", "<LEADER>f/", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Find words in current buffer" })

if vim.fn.executable("git") == 1 then
  map("n", "<LEADER>gb", function()
    require("telescope.builtin").git_branches({ use_file_path = true })
  end, { desc = "Git branches" })

  map("n", "<LEADER>gc", function()
    require("telescope.builtin").git_commits({ use_file_path = true })
  end, { desc = "Git commits (repository)" })

  map("n", "<LEADER>gC", function()
    require("telescope.builtin").git_bcommits({ use_file_path = true })
  end, { desc = "Git commits (current file)" })

  map("n", "<LEADER>gt", function()
    require("telescope.builtin").git_status({ use_file_path = true })
  end, { desc = "Git status" })
end

map("n", "<LEADER>f<CR>", function()
  require("telescope.builtin").resume()
end, { desc = "Resume previous search" })

map("n", "<LEADER>f'", function()
  require("telescope.builtin").marks()
end, { desc = "Find marks" })

map("n", "<LEADER>f/", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Find words in current buffer" })

map("n", "<LEADER>fa", function()
  require("telescope.builtin").find_files({
    prompt_title = "Config Files",
    cwd = vim.fn.stdpath("config"),
    follow = true,
  })
end, { desc = "Find AstroNvim config files" })

map("n", "<LEADER>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "Find buffers" })

map("n", "<LEADER>fc", function()
  require("telescope.builtin").grep_string()
end, { desc = "Find word under cursor" })

map("n", "<LEADER>fC", function()
  require("telescope.builtin").commands()
end, { desc = "Find commands" })

map("n", "<LEADER>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })

map("n", "<LEADER>fF", function()
  require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end, { desc = "Find all files" })

map("n", "<LEADER>fh", function()
  require("telescope.builtin").help_tags()
end, { desc = "Find help" })

map("n", "<LEADER>fk", function()
  require("telescope.builtin").keymaps()
end, { desc = "Find keymaps" })

map("n", "<LEADER>fm", function()
  require("telescope.builtin").man_pages()
end, { desc = "Find man" })

-- if is_available("nvim-notify") then
--   map("n", "<LEADER>fn",
--     function()
--       require("telescope").extensions.notify.notify()
--     end,
--     { desc = "Find notifications" })
-- end

map("n", "<LEADER>fo", function()
  require("telescope.builtin").oldfiles()
end, { desc = "Find history" })

map("n", "<LEADER>fr", function()
  require("telescope.builtin").registers()
end, { desc = "Find registers" })
map("n", "<LEADER>ft", function()
  require("telescope.builtin").colorscheme({ enable_preview = true, ignore_builtins = true })
end, { desc = "Find themes" })

if vim.fn.executable("rg") == 1 then
  map("n", "<LEADER>fw", function()
    require("telescope.builtin").live_grep()
  end, { desc = "Find words" })

  map("n", "<LEADER>fW", function()
    require("telescope.builtin").live_grep({
      additional_args = function(args)
        return vim.list_extend(args, { "--hidden", "--no-ignore" })
      end,
    })
  end, { desc = "Find words in all files" })
end

map("n", "<LEADER>fD", function()
  require("telescope.builtin").diagnostics()
end, { desc = "Search diagnostics" })

-- map("n", "<LEADER>ls",
--   function()
--     if is_available("aerial.nvim") then
--       require("telescope").extensions.aerial.aerial()
--     else
--       require("telescope.builtin").lsp_document_symbols()
--     end
--   end,
--   { desc = "Search symbols" })
