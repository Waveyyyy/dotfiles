vim.lsp.protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

require('neodev').setup({
    override = function (root_dir, library)
        if require('neodev.util').has_file(root_dir, "/home/callum/dotfiles/desktop/neovim/.config/nvim/after/plugin") then
            library.enabled = true
            library.plugins = true
        end
    end,
})

local status, lsp = pcall(require, "lspconfig")
if (not status) then return end

-- Add the below lines to `on_attach`
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<Leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<Leader>td', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<Leader>fl', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set("n", "<Leader>do", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "gl", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<Leader>dl", vim.diagnostic.setloclist, bufopts)

    -- format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end

    -- code lens
    if client.server_capabilities.code_lens then
        local codelens = vim.api.nvim_create_augroup(
            'LSPCodeLens',
            { clear = true }
        )
        vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
            group = codelens,
            callback = function()
                vim.lsp.codelens.refresh()
            end,
            buffer = bufnr,
        })
    end
end


local c = vim.lsp.protocol.make_client_capabilities()
c.textDocument.completion.completionItem.snippetSupport = true
c.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    },
}
local capabilities = require("cmp_nvim_lsp").default_capabilities(c)

-- language server configs
lsp.ocamllsp.setup({
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    on_attach = on_attach,
    capabilities = capabilities
})

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lsp.sumneko_lua.setup({
    settings = {
        Lua = {
            callSnippet = "Replace"
        }
    }
})

require('lsp-setup').setup({
    default_mappings = true,
    on_attach = function(client, bufnr)
        require('lsp-setup.utils').format_on_save(client)
    end,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Diagnostic symbols in the sign column (gutter)
local signs = {
    Error = " ",
    Warn = " ",
    Info = " ",
    Hint = " "
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = "●"
    },
    signs = true,
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
)

vim.cmd [[ 
" make hover window"s background transparent
highlight! link FloatBorder Normal 
highlight! link NormalFloat Normal 
]]
