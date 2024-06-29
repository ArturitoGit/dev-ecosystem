--- Check if a given path exists on filesystem
--- @param path string
--- @return boolean
local function exists(path)
  local file = io.open(path, "rb")
  if file then
    file:close()
    return true
  end
  return false
end

--- Join given strings into one string result
--- @param lines Iterator<string>
--- @return string
local function join(lines)
  local result = ''
  for line in lines do
    result = result..line
  end
  return result
end

--- Read content of file whose path is given
--- Return nil if path is not readable
--- @param path string
--- @return string?
local function read(path)

  if not exists(path) then
    return nil
  end

  return join(io.lines(path))
end

return read
