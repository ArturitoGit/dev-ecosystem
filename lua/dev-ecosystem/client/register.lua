local start_client = require 'dev-ecosystem.client.start'
local build_image = require 'dev-ecosystem.client.build'

--- Prepare image before starting it
--- @param config ServerConfig
--- @param callback function
local function prepare_image(config, callback)

  if not config.dockerfile then
    callback()
    return
  end

  build_image(config, callback)
end

--- Use single LSP configuration to register LSP client
--- @param config ServerConfig
--- @param context Context
local function register_one(config, context)
  vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = config.files,
    callback = function()
      prepare_image(config, function()
        -- And then
        start_client(config, context)
      end)
    end
  })
end

--- Use LSP configurations to register LSP clients
--- @param configs ServerConfigs
--- @param context Context
local function register_all(configs, context)
  for _, config in ipairs(configs) do
    register_one(config, context)
  end
end

return register_all
