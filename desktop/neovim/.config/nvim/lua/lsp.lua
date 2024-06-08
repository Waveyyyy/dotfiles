-- Native LSP Setup
-- https://microsoft.github.io/language-server-protocol/implementors/servers/

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- get lua-language-server -> path
-- tell neovim to use lua-language-server
require 'lspconfig'.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    },
    on_attach = function()
        -- K again goes into the hover, <C-o> goes back out (the jump stack, movements)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        -- <C-t> to jump back (the tag stack, jumping by definitions)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = 0 })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
    end,
    capabilities = capabilities,
}

require('lspconfig').clangd.setup({
    on_attach = function()
        -- K again goes into the hover, <C-o> goes back out (the jump stack, movements)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        -- <C-t> to jump back (the tag stack, jumping by definitions)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
        vim.keymap.set("n", "gR", vim.lsp.buf.references, { buffer = 0 })
        --vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = 0 })
        vim.keymap.set("n", "dh", vim.diagnostic.goto_prev, { buffer = 0 })
        vim.keymap.set("n", "dl", vim.diagnostic.goto_next, { buffer = 0 })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })
    end,
    capabilities = capabilities
})

require('lspconfig').bashls.setup({
    on_attach = function()
        -- K again goes into the hover, <C-o> goes back out (the jump stack, movements)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        -- <C-t> to jump back (the tag stack, jumping by definitions)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
        vim.keymap.set("n", "gR", vim.lsp.buf.references, { buffer = 0 })
        --vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = 0 })
        vim.keymap.set("n", "dh", vim.diagnostic.goto_prev, { buffer = 0 })
        vim.keymap.set("n", "dl", vim.diagnostic.goto_next, { buffer = 0 })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })
    end,
    capabilities = capabilities
})
