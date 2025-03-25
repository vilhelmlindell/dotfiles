function VlimeHyperspecLookup()
  local word = vim.fn.expand '<cword>'
  vim.fn['nvlime#plugin#SendToREPL']("(clhs-open-zellij '" .. word .. ')')
end

return {
  {
    'monkoose/nvlime',
    dependencies = {
      'monkoose/parsley',
      --'kovisoft/paredit'
      --'gpanders/nvim-parinfer',
    },
    config = function()
      -- Use vim.g.nvlime_config instead of nvlime_nvlime
      vim.g.nvlime_config = {
        leader = ',', -- Set the leader key for Nvlime
        cmp = {
          enabled = true, -- Enable nvim-cmp for autocompletion
        },
        floating_window = {
          scroll_step = 3, -- Configure scroll step for floating windows
        },
      }
      vim.keymap.set('n', ',h', VlimeHyperspecLookup, { desc = 'Open word in hyperspec' })

      -- Set up nvim-cmp for autocompletion with Nvlime
      local cmp = require 'cmp'
      cmp.setup.filetype('lisp', {
        sources = {
          { name = 'nvlime' },
          -- Add more sources as needed
        },
      })
    end,
  },
  --{
  --  'kovisoft/slimv',

  --  ft = 'lisp',

  --  --vim.g.slimv_swank_cmd = "!wezterm -e sbcl '(ql:quickload :swank) (swank:create-server)' wait &"
  --  --vim.g.slimv_swank_cmd = "!wezterm -e sbcl '(ql:quickload :swank) (swank:create-server)' wait &"
  --  --vim.g.slimv_swank_cmd = '!tmux new-window -d -n REPL-SBCL "sbcl --load ~/.local/share/nvim/lazy/slimv/slime/start-swank.lisp"'
  --  config = function()
  --    --vim.g.slimv_swank_cmd = '!tmux new-window -d -n REPL-SBCL "sbcl --load ~/.local/share/nvim/lazy/slimv/slime/start-swank.lisp"'
  --    vim.g.slimv_swank_cmd = '!zellij run -- sbcl --load ~/.local/share/nvim/lazy/slimv/slime/start-swank.lisp'
  --    vim.g.slimv_browser_cmd_ex = '!firefox'
  --    vim.g.slimv_repl_split = 4
  --    vim.g.slimv_leader = ','
  --    --echo expand("<cword>")

  --    --vim.keymap.set('n', '<leader>f', builtin.help_tags, { desc = '[S]earch [H]elp' })
  --  end,
  --},
}
