local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "bufls", "pyright", "zls", "rust_analyzer", "jdtls", "kotlin_language_server" }

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

-- gopls
lspconfig.gopls.setup {
    on_attach = function(_, bufnr)
        _ = bufnr
        vim.api.nvim_command("au BufWritePost <buffer> lua vim.lsp.buf.format({async=true})")
    end,
    capabilities = capabilities,
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

-- htmx
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
}
