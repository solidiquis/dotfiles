local utils = require("plugin_confs.lsp.utils")
local configs = require("plugin_confs.lsp.servers").configs
local logging = require("utils.logging")

require("mason").setup()

require("mason-lspconfig").setup({
    automatically_enable = false,
    ensure_installed = utils.must_install_list(),
})

require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" },
    },
    completion = { documentation = { auto_show = true } },
})

local auto_cmd_group_lsp = vim.api.nvim_create_augroup("UserLspConfig", {})

for server, config in pairs(configs) do
    if config.filetypes ~= nil and #config.filetypes > 0 then
        vim.api.nvim_create_autocmd("FileType", {
            group = auto_cmd_group_lsp,
            pattern = config.filetypes,
            callback = function()
                utils.enable_lsp(server)
            end
        })
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = auto_cmd_group_lsp,
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "s", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts)
    end,
})

vim.api.nvim_create_autocmd("LspProgress", {
    callback = function(ev)
        local value = ev.data.params.value

        if not value then
            return
        end

        if value.kind == "begin" then
            local client = vim.lsp.get_client_by_id(ev.data.client_id)

            if client == nil then
                return
            end

            logging.info(string.format("Initializing %s...", client.name), "Lsp Initialization")

        elseif value.kind == "end" then
            local client = vim.lsp.get_client_by_id(ev.data.client_id)

            if client == nil then
                return
            end

            logging.info(string.format("%s initialization complete", client.name), "Lsp Initialization")
        end
    end,
})
