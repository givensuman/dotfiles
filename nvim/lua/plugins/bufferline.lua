return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<LEADER>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<LEADER>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Close Unpinned Buffers" },
    { "<LEADER>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close Other Buffers" },
    { "<LEADER>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Close Buffers To The Right" },
    { "<LEADER>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close Buffers To The Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Next" },
  },
}
