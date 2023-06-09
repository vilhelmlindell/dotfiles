require("mason").setup()
require("mason-lspconfig").setup()

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
  "rust_analyzer",
  "lua_ls",
  "omnisharp",
  "jedi_language_server",
  "clangd",
  "pyright"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--lspconfig.omnisharp.setup({
--  cmd = { "dotnet", "/home/vilhelm/.local/share/nvim/mason/bin/omnisharp" },
--  on_attach = on_attach,
--  capabilities = capabilities,
--})
