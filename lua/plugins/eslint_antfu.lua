return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["vue"] = { "eslint" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          init_options = {
            provideFormatter = false,
          },
        },
        eslint = {
          settings = {
            ruleCustomizations = {
              { rule = "style/*", severity = "off", fixable = true },
              { rule = "format/*", severity = "off", fixable = true },
              { rule = "*-indent", severity = "off", fixable = true },
              { rule = "*-spacing", severity = "off", fixable = true },
              { rule = "*-spaces", severity = "off", fixable = true },
              { rule = "*-order", severity = "off", fixable = true },
              { rule = "*-dangle", severity = "off", fixable = true },
              { rule = "*-newline", severity = "off", fixable = true },
              { rule = "*quotes", severity = "off", fixable = true },
              { rule = "*semi", severity = "off", fixable = true },
            },
          },
        },
      },
      setup = {
        volar = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "ts_ls" or client.name == "volar" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
