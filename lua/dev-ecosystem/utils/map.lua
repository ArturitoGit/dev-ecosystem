--- Returns a new array whose elements
--- are the elements of given array, 
--- transform by the given transform method
--- @generic T, U
--- @param array T[]
--- @param transform fun(in: T): U
--- @return U[]
local function map(array, transform)
  local result = {}
  for _, elem in ipairs(array) do
    table.insert(result, transform(elem))
  end
  return result
end

return map
