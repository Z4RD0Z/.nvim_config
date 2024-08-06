return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    config = function()
      require("configs.conform")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "lua-language-server", "stylua", "html-lsp", "css-lsp", "prettier" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "vim", "lua", "vimdoc", "html", "css" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("configs.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "mfussenegger/nvim-lint",
    lazy=false,
    event = { "BufReadPre", "BufNewFile", "SessionLoadPost" },
    config = function()
      require("configs.nvim-lint")
    end,
  },
}
