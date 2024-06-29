--- Return true if given object is an array,
--- false otherwise
--- @param object any | any[]
--- @return boolean
local function is_array(object)
  local i = 0
  for _ in pairs(object) do
    i = i + 1
    if not object[i] then
      return false
    end
  end
  return true
end

return is_array
