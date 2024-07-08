--- @class Context
--- @field setup_options SetupOptions
--- @field pwd string

--- Build context for the plugin
--- @param setup_options SetupOptions
--- @return Context
local function build_context(setup_options)
  return {
    setup_options = setup_options,
    pwd = vim.fn.getcwd()
  }
end

return build_context
