--- Return true if every elements of given array
--- respect the given predicate, false otherwise
--- @generic T
--- @param array T[]
--- @param predicate fun(elem: T): boolean
--- @return boolean
local function all_match(array, predicate)

  for _, elem in ipairs(array) do
    if not predicate(elem) then
      return false
    end
  end

  return true
end

return all_match
