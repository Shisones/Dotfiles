local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  "html",
  "cssls",
  "css_variables",
  "cssmodules_ls",
  "rust_analyzer",
  "clangd",
  "pyright",
  "lua_ls",
}

for _, server_name in ipairs(servers) do
  vim.lsp.config(server_name, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,

    -- You can add server-specific settings here, for example:
    -- if server_name == "rust_analyzer" then
    --   settings = {
    --     ["rust-analyzer"] = {
    --       checkOnSave = { command = "clippy" },
    --     },
    --   }
    -- end
  })
  vim.lsp.enable(server_name)
end
