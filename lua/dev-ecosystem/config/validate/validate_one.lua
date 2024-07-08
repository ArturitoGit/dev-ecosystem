local is_valid_docker_config = require 'dev-ecosystem.config.validate.validate_docker'
local is_array_of = require 'dev-ecosystem.config.validate.utils'.is_array_of
local is_string = require 'dev-ecosystem.config.validate.utils'.is_string

--- Validate workspace server configuration
--- Return true if it is valid, false otherwise
--- @param config any
--- @return boolean
local function is_valid_server_config(config)

  if not is_valid_docker_config(config) then
    return false
  end

  if not config.files then
    print "Config should contain a 'files' field"
    return false
  end

  if not is_array_of(is_string, config.files) then
    print "Config 'files' field should contain one or more strings"
    return false
  end

  return true
end

return is_valid_server_config
