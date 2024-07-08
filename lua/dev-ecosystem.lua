local parse_config = require 'dev-ecosystem.config.parse'
local build_context = require 'dev-ecosystem.context.build'
local register_clients = require 'dev-ecosystem.client.register'

local M = {}

--- @class SetupOptions
--- @field capabilities? lsp.ClientCapabilities
--- @field on_attach? fun(client: vim.lsp.Client)

--- Setup extension with given context
--- @param options SetupOptions
M.setup = function(options)

  local context = build_context(options)
  local config = parse_config()

  if not config then
    return
  end

  register_clients(config, context)
end

return M
