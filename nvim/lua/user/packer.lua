local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Plugin installer
    use 'kyazdani42/nvim-web-devicons' -- Devicons
    use 'kyazdani42/nvim-tree.lua' -- File tree
    use 'romgrk/barbar.nvim' -- Buffer tabs
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { 'windwp/nvim-autopairs', require 'nvim-autopairs'.setup() } -- Automatic bracket pairing
    use 'akinsho/toggleterm.nvim' -- Terminal in neovim
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
    use "williamboman/mason.nvim" -- LSP installer
    use "williamboman/mason-lspconfig.nvim" -- LSP config mason integration
    use "neovim/nvim-lspconfig" -- LSP config
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp-signature-help' -- Function signature
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'onsails/lspkind.nvim' -- Completion icons
    use "jose-elias-alvarez/null-ls.nvim"
    use "folke/neodev.nvim"
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { "catppuccin/nvim", as = "catppuccin" } -- Colorscheme
    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })
end)
