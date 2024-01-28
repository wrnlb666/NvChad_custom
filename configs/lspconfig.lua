local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "gopls", "pyright", "rust_analyzer", "jdtls", "bufls", "zls" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- 
-- lspconfig.pyright.setup { blabla}

-- clangd
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}

-- go/templ
lspconfig.templ.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "templ",
        "lsp",
    },
}

lspconfig.htmx.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        "html", "templ"
    },
}

-- omnisharp
lspconfig.omnisharp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "omnisharp",
    },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
}
