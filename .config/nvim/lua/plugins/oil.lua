return {
  'stevearc/oil.nvim',
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    {
      '-',
      '<CMD>Oil<CR>',
      mode = '',
      desc = 'Open oil',
    },
  },
}
