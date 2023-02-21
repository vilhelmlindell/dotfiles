require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "python", "c", "cpp", "c_sharp", "rust" },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
