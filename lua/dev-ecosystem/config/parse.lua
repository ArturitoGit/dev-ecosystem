local config_path = require 'dev-ecosystem.config.path'
local read = require 'dev-ecosystem.config.read'
local deserialize = require 'dev-ecosystem.config.deserialize'
local fix = require 'dev-ecosystem.config.fix'
local valid = require 'dev-ecosystem.config.validate.validate'
local map = require 'dev-ecosystem.utils.map'
local merge_with_default = require 'dev-ecosystem.config.merge'

--- This class describes the structure of the configuration
--- once it has been fixed.
--- It does not describe the configuration as it must be written
--- by the user.
--- @class (exact) ServerConfig
--- @field name string
--- @field image_name string
--- @field image? string
--- @field dockerfile? string
--- @field cmd string
--- @field files string[]

--- @alias ServerConfigs ServerConfig[]

--- Parse config for current root directory
--- @return ServerConfigs?
local function parse()

  local content = read(config_path())
  if not content then
    return nil
  end

  local raw_config = deserialize(content)
  if not raw_config then
    return nil
  end

  local configs = fix(raw_config)
  if not configs then
    return nil
  end

  if not valid(configs) then
    return nil
  end

  return map(configs, merge_with_default)
end

return parse
