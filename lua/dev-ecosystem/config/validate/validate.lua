local is_one_or_more = require 'dev-ecosystem.config.validate.utils'.is_one_or_more
local valid_server_config = require 'dev-ecosystem.config.validate.validate_one'

--- Validate workspace configuration
--- Return true if it is valid, false otherwise
--- @param config any
--- @return boolean
local function is_valid(config)
  return is_one_or_more(valid_server_config, config)
end

return is_valid
