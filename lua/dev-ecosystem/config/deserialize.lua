--- Try to decode given json
--- Return trial result and decoded object
--- @param content string
--- @return boolean, any
local function safe_json_decode(content)
  return pcall(function()
    return vim.fn.json_decode(content)
  end)
end

--- Turn given json string to a lua object
--- @param content string
--- @return any | nil
local function deserialize(content)
  local parsable, parsed = safe_json_decode(content)

  if not parsable then
    print("Config does not seem to be valid json : "..content)
    return nil
  end

  return parsed
end

return deserialize
