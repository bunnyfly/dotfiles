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
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" }, -- default
        { key = "<C-e>",                          action = "edit_in_place" }, -- default
        { key = "O",                              action = "edit_no_picker" }, -- default
        { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" }, -- default
        { key = "<C-v>",                          action = "vsplit" }, -- default
        { key = "<C-x>",                          action = "split" }, -- default
        { key = "<C-t>",                          action = "tabnew" }, -- default
        { key = "<",                              action = "prev_sibling" }, -- default
        { key = ">",                              action = "next_sibling" }, -- default
        { key = "P",                              action = "parent_node" }, -- default
        { key = "<BS>",                           action = "close_node" }, -- default
        { key = "<Tab>",                          action = "preview" }, -- default
        { key = "K",                              action = "first_sibling" }, -- default
        { key = "J",                              action = "last_sibling" }, -- default
        { key = "C",                              action = "toggle_git_clean" }, -- default
        { key = "I",                              action = "toggle_git_ignored" }, -- default
        { key = "H",                              action = "toggle_dotfiles" }, -- default
        { key = "B",                              action = "toggle_no_buffer" }, -- default
        { key = "U",                              action = "toggle_custom" }, -- default
        { key = "R",                              action = "refresh" }, -- default
        { key = "a",                              action = "create" }, -- default
        { key = "d",                              action = "remove" }, -- default
        { key = "D",                              action = "trash" }, -- default
        { key = "r",                              action = "rename" }, -- default
        { key = "<C-r>",                          action = "full_rename" }, -- default
        { key = "e",                              action = "" }, -- default action: rename_basename
        { key = "x",                              action = "cut" }, -- default
        { key = "c",                              action = "copy" }, -- default
        { key = "p",                              action = "paste" }, -- default
        { key = "y",                              action = "copy_name" }, -- default
        { key = "Y",                              action = "copy_path" }, -- default
        { key = "gy",                             action = "copy_absolute_path" }, -- default
        { key = "[e",                             action = "prev_diag_item" }, -- default
        { key = "[c",                             action = "prev_git_item" }, -- default
        { key = "]e",                             action = "next_diag_item" }, -- default
        { key = "]c",                             action = "next_git_item" }, -- default
        { key = "-",                              action = "dir_up" }, -- default
        { key = "s",                              action = "system_open" }, -- default
        { key = "f",                              action = "live_filter" }, -- default
        { key = "F",                              action = "clear_live_filter" }, -- default
        { key = "q",                              action = "close" }, -- default
        { key = "W",                              action = "collapse_all" }, -- default
        { key = "E",                              action = "expand_all" }, -- default
        { key = "S",                              action = "search_node" }, -- default
        { key = ".",                              action = "run_file_command" }, -- default
        { key = "<C-k>",                          action = "toggle_file_info" }, -- default
        { key = "g?",                             action = "toggle_help" }, -- default
        { key = "m",                              action = "toggle_mark" }, -- default
        { key = "bmv",                            action = "bulk_move" }, -- default
      },
    },
  },
--  renderer = {
--    group_empty = true,
--  },
--  filters = {
--    dotfiles = true,
--  },
})

