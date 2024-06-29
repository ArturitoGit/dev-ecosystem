local config_file_name = ".dev.json"

--- Compute configuration file path for current workspace
--- @alias Path string
--- @return Path
local function path()
  return vim.fn.getcwd() .."/"..config_file_name
end

return path
