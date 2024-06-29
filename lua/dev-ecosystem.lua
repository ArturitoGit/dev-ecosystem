local parse_config = require 'dev-ecosystem.config.parse'
local register_clients = require 'dev-ecosystem.client.register'

local function main()
  local config = parse_config()

  if not config then
    return
  end

  register_clients(config)
end

main()
