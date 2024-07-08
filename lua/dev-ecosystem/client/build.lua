local lsp_log_std = require 'dev-ecosystem.utils.lsp_log'

--- Execute given command, write its logs in LSP logs file,
--- and call on_success or on_failure callback depending
--- on the result code
--- @param options { cmd: string[], on_success?: function, on_failure?: function }
local function execute_as_lsp_command(options)
  local cmd = options.cmd
  local on_success = options.on_success or function() end
  local on_failure = options.on_failure or function() end
  vim.system(cmd, {
      text = true,
      stdout = lsp_log_std,
      stderr = lsp_log_std,
    },
    function(out)
      local success = out.code == 0
      local callback = success and on_success or on_failure
      callback()
    end
  )
end

--- Build docker image for server configuration
--- run given callback on build image success
--- @param config ServerConfig
--- @param callback function
local function build_image(config, callback)
  print('Building docker image...')
  execute_as_lsp_command({
    cmd = {
      'docker', 'build',
      '-t', config.image_name,
      '-f', config.dockerfile,
      '.'
    },
    on_failure = function()
      print('Docker image build failed for image : '..config.name)
    end,
    on_success = function()
      print('Docker image ready, starting LSP server...')
      callback()
    end
  })
end

return build_image
