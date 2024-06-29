--- Start or attach to a client for a given config
--- @param config ServerConfig
--- @param context Context
local function start(config, context)
  local cwd = vim.fn.getcwd()

  local lsp_config = {
    name = config.name,
    cmd = {
      "docker", "run", "--rm", "--interactive",
      "-v", cwd..":"..cwd,
      "-w", cwd,
      config.image,
      config.cmd
    }
  }

  if context.capabilities then
    lsp_config.capabilities = context.capabilities
  end

  vim.lsp.start(lsp_config)
end

return start
