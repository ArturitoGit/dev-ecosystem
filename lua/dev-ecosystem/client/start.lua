--- Get LSP minimal VIM client config from defined server config
--- @param config ServerConfig
--- @return vim.lsp.ClientConfig
local function minimal_client_config(config)
  local cwd = vim.fn.getcwd()

  return {
    name = config.name,
    cmd = {
      "docker", "run", "--rm", "--interactive",
      "-v", cwd..":"..cwd,
      "-w", cwd,
      config.image,
      config.cmd
    }
  }
end

--- Start or attach to a client for a given config
--- @param server_config ServerConfig
--- @param context Context
local function start_server(server_config, context)

  local lsp_config = minimal_client_config(server_config)

  if context.capabilities then
    lsp_config.capabilities = context.capabilities
  end

  if context.on_attach then
    lsp_config.on_attach = context.on_attach
  end

  vim.lsp.start(lsp_config)
end

return start_server
