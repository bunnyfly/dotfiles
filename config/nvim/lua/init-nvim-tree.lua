-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function custom_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Skip default mappings:
  -- api.config.mappings.default_on_attach(bufnr)

  -- Navigating
  vim.keymap.set('n', 'u',     api.node.navigate.parent,              opts('Parent Directory'))
  vim.keymap.set('n', 'U',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'C',     api.tree.change_root_to_node,          opts('CD'))
  vim.keymap.set('n', '+',     api.tree.expand_all,                   opts('Expand All'))
  vim.keymap.set('n', '-',     api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', 'gn',    api.node.navigate.sibling.last,        opts('Last Sibling'))
  vim.keymap.set('n', 'ge',    api.node.navigate.sibling.first,       opts('First Sibling'))
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Filter: Dotfiles'))
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
  vim.keymap.set('n', '<C-g>', api.node.show_info_popup,              opts('Info'))

  -- Opening
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit,            opts('Open'))
  vim.keymap.set('n', 'v',     api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', 's',     api.node.open.horizontal,              opts('Open: Horizontal Split'))
  vim.keymap.set('n', 't',     api.node.open.tab,                     opts('Open: New Tab'))

  -- Editing
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename: Basename'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
  vim.keymap.set('n', 'Y',     api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
  vim.keymap.set('n', 'yy',    api.fs.copy.filename,                  opts('Copy Name'))

  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
  vim.keymap.set('n', 'dd',    api.fs.trash,                          opts('Trash'))
  vim.keymap.set('n', 'D',     api.fs.remove,                         opts('Delete'))
end

require("nvim-tree").setup {
  on_attach = custom_on_attach,
  view = {
    adaptive_size = true,
  },
  git = {
    enable = false,
  },
}
