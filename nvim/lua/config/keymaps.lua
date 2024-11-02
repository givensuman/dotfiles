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

-- Block indentation via tab and shift/tab
vim.cmd("vnoremap <TAB> >gv")
vim.cmd("vnoremap <S-TAB> <gv")

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
