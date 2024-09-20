local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities
local util = require "lspconfig/util"
local lspconfig = require ("lspconfig")



lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"css", "scss", "less"},
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
    validate = true
    }
  }
})

lspconfig.ts_ls.setup ({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
})

lspconfig.clangd.setup{
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.html.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"html"},
  init_options = {
  configurationSection = { "html", "css", "javascript" },
  embeddedLanguages = {
    css = true,
    javascript = true
  },
  provideFormatter = true
  },
  opts = {
    settings = {
      html = {
        format = {
          templating = true,
          wrapLineLength = 120,
          wrapAttributes = 'auto',
        },
        hover = {
          documentation = true,
          references = true,
        },
      },
    },
  }
}

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})
