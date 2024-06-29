local default_config = require 'dev-ecosystem.config.default_config'

--- Deep clone a table
--- @generic T
--- @param object T
--- @return T
local function clone(object)
  if type(object) ~= 'table' then
    return object
  end

  local result = {}
  for key, value in pairs(object) do
    result[key] = value
  end

  return result
end

--- Deep merge a table with a table of default attributes 
--- @param object any
--- @param default any
--- @return any
local function merge(object, default)
  if not object then
    return default
  elseif not default then
    return object
  elseif type(object) ~= 'table' then
    return object
  end

  local result = clone(default)
  for key, value in pairs(object) do
    result[key] = merge(value, default[key])
  end

  return result
end

--- Merge LSP server configuration
--- with default configuration
--- @param single_config any
--- @return Config
local function merge_with_default(single_config)
  return merge(single_config, default_config)
end

return merge_with_default
