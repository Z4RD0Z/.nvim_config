-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path() ..
                                     "/node_modules/@vue/language-server"
local lspconfig = require "lspconfig"
local servers = {"html", "cssls", "intelephense"}
local util = require("lspconfig.util")

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_init = on_init,
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- typescript
lspconfig.tsserver.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    init_options = {
        plugins = {{
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = {"vue"}
        }}
    },
    single_file_support = true,
    completions = {
        completeFunctionCalls = true
    },
    settings = {
        javascript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = false
            }
        },

        typescript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = false
            }
        }
    },

    filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact", "jsx", "tsx", "vue"}
}
-- eslint
lspconfig.eslint.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    root_dir = util.root_pattern(".eslintrc.js", "node_modules", ".git"),
    filetypes = {"vue", "javascript", "typescript", "jsx", "tsx", "vue"}
}
-- rust
lspconfig.rust_analyzer.setup{
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importPrefix = "self",
          },
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
          checkOnSave = {
            command = "clippy",
          },
        },
    },
}



