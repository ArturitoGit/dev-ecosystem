--- Get LSP minimal VIM client config from defined server config
--- @param config ServerConfig
--- @param context Context
--- @return vim.lsp.ClientConfig
local function minimal_client_config(config, context)
  local cwd = context.pwd

  return {
    name = config.name,
    cmd = {
      "docker", "run", "--rm", "--interactive",
      "-v", cwd..":"..cwd,
      "-w", cwd,
      config.image_name,
      config.cmd
    }
  }
end

--- Start or attach to a client for a given config
--- @param server_config ServerConfig
--- @param context Context
local function start_server(server_config, context)

  local options = context.setup_options
  local lsp_config = minimal_client_config(server_config, context)

  if options.capabilities then
    lsp_config.capabilities = options.capabilities
  end

  if options.on_attach then
    lsp_config.on_attach = options.on_attach
  end

  vim.schedule(function()
    vim.lsp.start(lsp_config)
  end)
end

return start_server
