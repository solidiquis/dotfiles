local notify = require("notify")

local M = {}

---@param msg string
---@param title? string
function M.info(msg, title)
	local opts = title and { title = title } or nil
	--[[@diagnostic disable-next-line: redundant-parameter]]
	notify(msg, vim.log.levels.INFO, opts)
end

---@param msg string
---@param title? string
function M.debug(msg, title)
	local opts = title and { title = title } or nil
	--[[@diagnostic disable-next-line: redundant-parameter]]
	notify(msg, vim.log.levels.DEBUG, opts)
end

---@param msg string
---@param title? string
function M.warn(msg, title)
	local opts = title and { title = title } or nil
	--[[@diagnostic disable-next-line: redundant-parameter]]
	notify(msg, vim.log.levels.WARN, opts)
end

---@param msg string
---@param title? string
function M.error(msg, title)
	local opts = title and { title = title } or nil
	--[[@diagnostic disable-next-line: redundant-parameter]]
	notify(msg, vim.log.levels.ERROR, opts)
end

---@param msg string
---@param title? string
function M.trace(msg, title)
	local opts = title and { title = title } or nil
	--[[@diagnostic disable-next-line: redundant-parameter]]
	notify(msg, vim.log.levels.TRACE, opts)
end

return M
