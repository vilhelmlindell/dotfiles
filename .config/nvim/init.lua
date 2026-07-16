vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",                     -- package manager
  "https://github.com/mason-org/mason-lspconfig.nvim",           -- lspconfig bridge
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", -- auto installer

  "https://github.com/nvim-lua/plenary.nvim",        -- library dependency
  "https://github.com/nvim-tree/nvim-web-devicons",  -- icons (nerd font)

  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/vilhelmlindell/no-clown-fiesta.nvim",
  --"https://github.com/no-clown-fiesta/no-clown-fiesta.nvim",
}, { confirm = false })

vim.cmd.packadd('cfilter')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nvim.difftool')

-- vim.pack.update()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.breakindent = true
vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 80

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  virtual_text = true, -- show inline diagnostics
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

--vim.cmd('syntax off')

require('no-clown-fiesta').setup {
  transparent = true, -- Enable this to disable the bg color
  styles = {
    -- You can set any of the style values specified for `:h nvim_set_hl`
    comments = {},
    functions = {},
    keywords = {},
    lsp = {},
    match_paren = {},
    type = {}, -- Sets type color to green
    variables = {},
  },
}
vim.cmd.colorscheme("no-clown-fiesta")

require('mini.icons').setup()
require('mini.pick').setup()

require("blink.cmp").setup({
  completion = {
    documentation = {
      auto_show = true,
    },
  },

  -- default blink keymaps
  keymap = {
    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

    ['<C-y>'] = { 'select_and_accept', 'fallback' },
    ['<C-e>'] = { 'cancel', 'fallback' },
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },

    ['<Tab>'] = { 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
  },

  fuzzy = {
    implementation = "lua",
  },
})

-- INFO: lsp server installation and configuration
local lsp_servers = {
  lua_ls = {
    -- https://luals.github.io/wiki/settings/ | `:h nvim_get_runtime_file`
    Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) }, },
  },
  clangd = {},
  rust_analyzer = {},
}

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
  ensure_installed = vim.tbl_keys(lsp_servers),
})

-- configure each lsp server on the table
-- to check what clients are attached to the current buffer, use
-- `:checkhealth vim.lsp`. to view default lsp keybindings, use `:h lsp-defaults`.
for server, config in pairs(lsp_servers) do
  vim.lsp.config(server, {
    settings = config,

    -- only create the keymaps if the server attaches successfully
    on_attach = function(client, bufnr)
      client.server_capabilities.semanticTokensProvider = nil

      vim.keymap.set("n", "grd", vim.lsp.buf.definition,
        { buffer = bufnr, desc = "vim.lsp.buf.definition()", })

      vim.keymap.set("n", "grf", vim.lsp.buf.format,
        { buffer = bufnr, desc = "vim.lsp.buf.format()", })
    end,
  })
end

require("which-key").setup({
  spec = {
    { "<leader>s", group = "Pick", icon = { icon = "", color = "green", }, },
  }
})

require("oil").setup()

vim.keymap.set("n", "<leader>f", "<CMD>Pick files<CR>", { desc = "Pick files", })
vim.keymap.set("n", "<leader>g", "<CMD>Pick grep_live<CR>", { desc = "Pick grep_live", })
vim.keymap.set("n", "<leader><leader>", "<CMD>Pick buffers<CR>", { desc = "Pick buffers", })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.api.nvim_create_autocmd('FileType', {
    callback = function() pcall(vim.treesitter.start) end,
})

require('vim._core.ui2').enable({})
