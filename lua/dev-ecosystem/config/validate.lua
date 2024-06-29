local is_array = require 'dev-ecosystem.utils.is_array'
local all_match = require 'dev-ecosystem.utils.all_match'

--- Test if given object is a string
--- @param value any
--- @return boolean
local function is_string(value)
  return type(value) == 'string'
end

--- Test if given object is an array of strings
--- @param value any
--- @return boolean
local function is_array_of_string(value)
  return is_array(value) and all_match(value, is_string)
end

--- Validate single configuration object
--- Return true if configuration is valid
--- Return false otherwise
--- @param config Config
--- @return boolean
local function is_valid(config)

  if not config.image then
    print("Config should contain an 'image' attribute")
    return false
  end

  if not is_string(config.image) then
    print("'image' attribute should be a string")
    return false
  end

  if not config.files then
    print("Config should contain a 'files' attribute")
    return false
  end

  if not (is_string(config.files) or is_array_of_string(config.files)) then
    print("'files' attribute should either be a single string, or an array of strings")
    return false
  end

  return true
end

--- Validate configurations object
--- Return true if configurations are all valid
--- Return false otherwise
--- @param configs Configs
--- @return boolean
local function are_valid(configs)
  if is_array(configs) then
    return all_match(configs, is_valid)
  end
  return is_valid(configs)
end

return are_valid
