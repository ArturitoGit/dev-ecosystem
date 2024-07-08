local log = require 'vim.lsp.log'

--- Split a single string into an iterator of lines
--- @param expr string
--- @return fun():string, ...unknown
local function lines(expr)
  return string.gmatch(expr, "[^\n]+")
end

--- Log given string to LSP log file
--- @param content string
local function print_to_lsp_log(content)
  for line in lines(content) do
    log.error(line)
  end
end

local function lsp_log_std(err, data)
  if err then
    print_to_lsp_log(err)
  elseif data then
    print_to_lsp_log(data)
  end
end

return lsp_log_std
