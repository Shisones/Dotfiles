return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = function()
      require "configs.autosave"
    end,
  },

  {
    'stevearc/dressing.nvim',
    opts = {},
    event='VeryLazy'
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
      },

      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "configs.cmp"
    end,
  },

  {
    "andweeb/presence.nvim",
    lazy = false,
    opts = require "configs.presence",
  },

  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
  },

  {
    "mason-org/mason-lspconfig.nvim",
    cmd = "LspInstall",
    opts = {},
    dependencies = {
    { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

  {
    'anurag3301/nvim-platformio.lua',
    cmd = { 'Pioinit', 'Piorun', 'Piocmdh', 'Piocmdf', 'Piolib', 'Piomon', 'Piodebug', 'Piodb' },

    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      { 'akinsho/toggleterm.nvim' },
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-lua/plenary.nvim' },
      {
        -- WhichKey helps you remember your Neovim keymaps,
        -- by showing available keybindings in a popup as you type.
        'folke/which-key.nvim',
        opts = {
          preset = 'helix', --'modern', --"classic", --
          sort = { 'order', 'group', 'manual', 'mod' },
        },
      },
    },
  },

  { import = "nvchad.blink.lazyspec" },
}
