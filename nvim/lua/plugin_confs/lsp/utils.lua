local configs = require("plugin_confs.lsp.servers").configs
local logging = require("utils.logging")

local M = {}

function M.must_install_list()
    local servers = {}
    for name, _ in pairs(configs) do
        table.insert(servers, name)
    end
    return servers
end

function M.enable_lsp(name)
    local config = configs[name]

    if config == nil then
        logging.error(string.format("%s is not a registered server", name))
        return
    end

    vim.lsp.config[name] = config
    vim.lsp.enable(name)
end

return M
