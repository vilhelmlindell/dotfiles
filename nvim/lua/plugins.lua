return {
    {'kyazdani42/nvim-tree.lua', config = true }, -- File tree
    {'romgrk/barbar.nvim', dependencies = 'kyazdani42/nvim-web-devicons', config = function()
        require('core.barbar')
    end
    },-- Buffer tabs
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('core.lualine')
        end
    },
    {'windwp/nvim-autopairs', config = true},-- Automatic bracket pairing
    {'akinsho/toggleterm.nvim', config = function() -- Terminal in neovim
        require('core.toggleterm')
    end
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' , config = function()
        require('core.treesitter')
    end
    },
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    'williamboman/mason.nvim', -- LSP installer
    'williamboman/mason-lspconfig.nvim', -- LSP config mason integration
    'neovim/nvim-lspconfig', -- LSP config
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp-signature-help', -- Function signature
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip', -- Snippets plugin
    'onsails/lspkind.nvim', -- Completion icons
    "jose-elias-alvarez/null-ls.nvim",
    {"folke/neodev.nvim", config = true },
     { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
     { "catppuccin/nvim", as = "catppuccin" }, -- Colorscheme
    ({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require('core.lsp_lines')
        end,
    })
}
