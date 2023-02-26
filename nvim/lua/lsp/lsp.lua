local servers = {
    "clangd",
    "rust_analyzer",
    "pyright",
    "tsserver",
    "omnisharp",
    "lua_ls"
}

require("neodev").setup()

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
    autostart = true,
})

local lspconfig = require("lspconfig")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.rustfmt,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end
})

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
    --    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>c", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.api.nvim_set_keymap("n", "<space>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Default server configuration
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end


--lspconfig.rust_analyzer.setup {
--    on_attach = on_attach,
--    settings = {
--        ['rust-analyzer'] = {
--            checkOnSave = {
--                allFeatures = true,
--                overrideCommand = {
--                    'cargo', 'clippy', '--workspace', '--message-format=json',
--                    '--all-targets', '--all-features'
--                }
--            }
--        }
--    }
--}
--lspconfig.lua_ls.setup({
--    settings = {
--        Lua = {
--            -- See https://github.com/CppCXY/EmmyLuaCodeStyle/blob/master/lua.template.editorconfig for example
--            format = {
--                enable = true,
--                max_line_length = 200,
--                default_config = {
--                    indent_style = "space",
--                    indent_size = "2"
--                }
--            }
--        }
--    }
--})
