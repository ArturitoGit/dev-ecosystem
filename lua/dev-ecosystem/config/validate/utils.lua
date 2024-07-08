local is_array = require 'dev-ecosystem.utils.is_array'
local all_match = require 'dev-ecosystem.utils.all_match'

local M = {}

--- Test if given object is a string
--- @param value any
--- @return boolean
M.is_string = function(value)
  return type(value) == 'string'
end

--- Check that given target is an array
--- whose elements are all of given shape
--- @param shape fun(target: any): boolean
--- @param target any | any[]
--- @return boolean
M.is_array_of = function(shape, target)
  if not target then
    return false
  end

  if not is_array(target) then
    return false
  end

  return all_match(target, shape)
end

return M
