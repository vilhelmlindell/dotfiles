return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  requires = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  --requires = { "echasnovski/mini.icons" },
  config = function()
    require('fzf-lua').setup {
      { 'telescope', 'default' },
      winopts = {
        fullscreen = false,
        preview = {
          layout = "horizontal"
        }
      },
    }
    vim.keymap.set('n', '<leader><leader>', require('fzf-lua').buffers, { desc = 'Fzf buffers' })
    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = 'Fzf files' })
    vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, { desc = 'Fzf buffers' })
    vim.keymap.set('n', '<leader>fg', require('fzf-lua').live_grep, { desc = 'Fzf live_grep' })
  end,
}
--return {
--  'ibhagwan/fzf-lua',
--  -- optional for icon support
--  requires = { 'nvim-tree/nvim-web-devicons' },
--  opts = { 'fzf-native' },
--  config = function()
--    vim.keymap.set('n', '<leader><leader>', require('fzf-lua').buffers, { desc = 'Fzf buffers' })
--    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = 'Fzf files' })
--    vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, { desc = 'Fzf buffers' })
--    vim.keymap.set('n', '<leader>fg', require('fzf-lua').live_grep, { desc = 'Fzf live_grep' })
--  end,
--}
