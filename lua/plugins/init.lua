return {
    { "folke/which-key.nvim", enabled = false },
    { "lewis6991/gitsigns.nvim", enabled = false },

    -- conform
    -- {
    --     "stevearc/conform.nvim",
    --     event = "BufWritePre",
    --     opts = require "configs.conform",
    -- },

    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function()
            return require "configs.nvimtree"
        end,
    },

    -- LuaSnip
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        -- opts = function ()
        --     return require "configs.luasnip"
        -- end
    },

    -- lspconfig
    -- {
    --     "neovim/nvim-lspconfig",
    --     event = { "BufReadPre", "BufNewFile" },
    --     config = function()
    --         require("nvchad.configs.lspconfig").defaults()
    --         require("configs.lspconfig")
    --     end,
    -- },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
