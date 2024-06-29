local parse_config = require 'dev-ecosystem.config.parse'
local register_clients = require 'dev-ecosystem.client.register'

--- @class Context
--- @field capabilities? lsp.ClientCapabilities
--- @field on_attach? fun(client: vim.lsp.Client)

local M = {}

--- Setup extension with given context
--- @param context Context
M.setup = function(context)

  local config = parse_config()

  if not config then
    return
  end

  register_clients(config, context)
end

return M
