local start_client = require 'dev-ecosystem.client.start'

--- Use single LSP configuration to register LSP client
---@param config ServerConfig
---@param context Context
local function register_one(config, context)
  vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = config.files,
    callback = function()
      start_client(config, context)
    end
  })
end

--- Use LSP configurations to register LSP clients
---@param configs ServerConfigs
---@param context Context
local function register_all(configs, context)
  for _, config in ipairs(configs) do
    register_one(config, context)
  end
end

return register_all
