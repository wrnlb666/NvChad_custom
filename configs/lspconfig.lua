local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "gopls", "pyright", "rust_analyzer", "jdtls", "bufls" }

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
        "/usr/bin/clangd",
        "--offset-encoding=utf-16",
    },
}

-- go/templ
lspconfig.templ.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "/home/wrnlb/go/bin/templ",
        "lsp",
    },
}

-- omnisharp
lspconfig.omnisharp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "/usr/bin/omnisharp",
    },
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
}
