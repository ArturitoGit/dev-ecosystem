local is_string = require 'dev-ecosystem.config.validate.utils'.is_string

--- Validate local image docker configuration
--- in single server configuration object
--- @param config any
--- @return boolean
local function is_valid_local_image_config(config)
  if not is_string(config.image) then
    print "Config 'image' field should be a string"
    return false
  end
  return true
end

--- Validate dockerfile image docker configuration
--- in single server configuration object
--- @param config any
--- @return boolean
local function is_valid_dockerfile_config(config)
  if not is_string(config.dockerfile) then
    print "Config 'dockerfile' field should be a string"
    return false
  end
  return true
end

--- Validate docker image configuration
--- in single server configuration object
--- @param config any
--- @return boolean
local function is_valid_image_config(config)

  if config.image then
    return is_valid_local_image_config(config)

  elseif config.dockerfile then
    return is_valid_dockerfile_config(config)

  else
    print "Config should contain one of 'image' or 'dockerfile' attribute"
    return false
  end
end

return is_valid_image_config
