local is_array = require 'dev-ecosystem.utils.is_array'
local map = require 'dev-ecosystem.utils.map'

--- Takes an object that might be an array,
--- and turn it into a single element array if not
--- @param object any | any[]
--- @return any[]
local function turn_to_array(object)
  if is_array(object) then
    return object
  end
  return { object }
end

--- Fix files configuration field
--- @param config ServerConfig
local function fix_files(config)
  config.files = turn_to_array(config.files)
end

--- Compute image name for dockerfile configuration
--- @param config ServerConfig
local function fix_image_name(config)
  config.image = config.image or config.name
end

--- Turn raw config to valid Config object
--- @param config any
--- @return ServerConfig
local function fix_single(config)
  fix_files(config)
  fix_image_name(config)
  return config
end

--- Turn raw config to valid Config[] array,
--- @param raw_config any
--- @return ServerConfigs
local function fix(raw_config)
  local config_array = turn_to_array(raw_config)
  return map(config_array, fix_single)
end

return fix
