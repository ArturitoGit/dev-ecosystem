--- Start or attach to a client for a given config
--- @param config Config
local function start(config)
  local cwd = vim.fn.getcwd()

  vim.lsp.start({
    name = config.name,
    cmd = {
      "docker", "run", "--rm", "--interactive",
      "-v", cwd..":"..cwd,
      "-w", cwd,
      config.image,
      config.cmd
    }
  })
end

return start
