local start_client = require 'dev-ecosystem.client.start'

--- Use single LSP configuration to register LSP client
---@param config Config
local function register_one(config)
  vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = config.files,
    callback = function()
      start_client(config)
    end
  })
end

--- Use LSP configurations to register LSP clients
---@param configs Configs
local function register_all(configs)
  for _, config in ipairs(configs) do
    register_one(config)
  end
end

return register_all
