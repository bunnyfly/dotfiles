-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  -- sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        -- Passthrough keys for existing mappings
        { key = ".",                              action = "" },
        { key = "<C-e>",                          action = "" },
        { key = "<C-i>",                          action = "" },
        { key = "B",                              action = "" },
        { key = "I",                              action = "" },
        { key = "P",                              action = "" },
        { key = "d",                              action = "remove" },
        { key = "e",                              action = "" },
        { key = "y",                              action = "" },
        -- Mappings
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = "O",                              action = "edit_no_picker" },
        { key = "v",                              action = "vsplit" },
        { key = "s",                              action = "split" },
        { key = "t",                              action = "tabnew" },
        { key = "ge",                             action = "prev_sibling" },
        { key = "gn",                             action = "next_sibling" },
        { key = "gE",                             action = "first_sibling" },
        { key = "gN",                             action = "last_sibling" },
        { key = "U",                              action = "dir_up" },
        { key = "u",                              action = "parent_node" },
        { key = "C",                              action = "cd" },
        { key = "-",                              action = "close_node" },
        { key = " ",                              action = "preview" },
        { key = "H",                              action = "toggle_dotfiles" },
        { key = "R",                              action = "refresh" },
        { key = "a",                              action = "create" },
        { key = "dd",                             action = "remove" },
        -- TODO: Config trash to work!
        { key = "D",                              action = "trash" },
        { key = "r",                              action = "rename" },
        { key = "<C-r>",                          action = "full_rename" },
        { key = "x",                              action = "cut" },
        { key = "c",                              action = "copy" },
        { key = "p",                              action = "paste" },
        { key = "yy",                             action = "copy_name" },
        { key = "yu",                             action = "copy_path" },
        { key = "yU",                             action = "copy_absolute_path" },
        { key = "[e",                             action = "prev_diag_item" },
        { key = "[c",                             action = "prev_git_item" },
        { key = "]e",                             action = "next_diag_item" },
        { key = "]c",                             action = "next_git_item" },
        { key = "f",                              action = "live_filter" },
        { key = "F",                              action = "clear_live_filter" },
        { key = "q",                              action = "close" },
        { key = "W",                              action = "collapse_all" },
        { key = "+",                              action = "expand_all" },
        { key = "S",                              action = "search_node" },
        { key = "<C-k>",                          action = "toggle_file_info" },
        { key = "g?",                             action = "toggle_help" },
        { key = "m",                              action = "toggle_mark" },
        { key = "bmv",                            action = "bulk_move" },
      },
    },
  },
--  renderer = {
--    group_empty = true,
--  },
--  filters = {
--    dotfiles = true,
--  },
  git = {
    enable = false,
  },
})

