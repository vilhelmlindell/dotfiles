-- LSP servers and clients communicate which features they support through "capabilities".
--  By default, Neovim supports a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in general for nvim-lspconfig:

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'saghen/blink.cmp',
  },

  -- example using `opts` for defining servers
  opts = {
    servers = {
      lua_ls = {},
      clangd = {},
      gopls = {},
      pyright = {},
      rust_analyzer = {},
      tinymist = {},
      cmake = {},
      ols = {},
      verible = {},
      -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
      --
      -- Some languages (like typescript) have entire language plugins that can be useful:
      --    https://github.com/pmizio/typescript-tools.nvim
      --
      -- But for many setups, the LSP (`ts_ls`) will work just fine
      -- ts_ls = {},
    },
  },
  config = function(_, opts)
    local lspconfig = require 'lspconfig'

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        local buffer = event.buf

        if client then
          client.server_capabilities.semanticTokensProvider = nil
        end

        -- Example: Set keybindings for LSP features
        local key_opts = { noremap = true, silent = true, buffer = buffer }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, key_opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, key_opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, key_opts)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })
        vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Action' })
        vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = 'Signature Help' })
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.type_definition, { desc = 'Type Definition' })

        -- Example: Print a message to confirm LSP is attached
        print('LSP attached to buffer ' .. buffer)
      end,
    })

    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end

    lspconfig['zls'].setup(require('blink.cmp').get_lsp_capabilities {})

    require('mason').setup()

    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(opts.servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
      'clang-format',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup()
  end,

  -- example calling setup directly for each LSP
  --config = function()
  --  local capabilities = require('blink.cmp').get_lsp_capabilities()
  --  local lspconfig = require('lspconfig')

  --  lspconfig['lua-ls'].setup({ capabilities = capabilities })
  --end
}
