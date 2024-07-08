local is_array_of = require 'dev-ecosystem.config.validate.utils'.is_array_of
local valid_server_config = require 'dev-ecosystem.config.validate.validate_one'

--- Validate workspace configuration
--- Return true if it is valid, false otherwise
--- @param config any
--- @return boolean
local function is_valid(config)
  return is_array_of(valid_server_config, config)
end

return is_valid
