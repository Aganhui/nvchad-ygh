local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { 
  "html", 
  "cssls", 
  "tsserver", 
  "clangd", 
  "gopls", 
}

local util = require "lspconfig/util"
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = { -- 可查阅gopls文档，更多配置
      -- completeUnimported = true, --默认即true
      usePlaceholders = true,
    }
  }
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


-- 
-- lspconfig.pyright.setup { blabla}
