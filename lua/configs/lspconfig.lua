-- Use new vim.lsp.config API for Neovim 0.11+
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local util = require "lspconfig/util"

local servers = { 
  "html", 
  "cssls", 
  "rust_analyzer",
  "ts_ls",
  "lua_ls"
}

-- Configure servers using new API
vim.lsp.config("html", { 
  capabilities = capabilities, 
  on_attach = on_attach, 
  on_init = on_init 
})
vim.lsp.config("cssls", { 
  capabilities = capabilities, 
  on_attach = on_attach, 
  on_init = on_init 
})




vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
})



vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})


vim.lsp.config("rust_analyzer", {
  cmd = { "rustup", "run", "nightly", "rust-analyzer" },
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init,
  filetypes = { "rust" },
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      check = {
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

-- Enable servers
for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end
