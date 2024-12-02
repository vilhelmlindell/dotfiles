return {
  {
    "ellisonleao/gruvbox.nvim"
  },
  {
    'catppuccin/nvim',
    init = function()
      require('catppuccin').setup {
        no_italic = true,
      }
      vim.cmd.colorscheme 'retrobox'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
