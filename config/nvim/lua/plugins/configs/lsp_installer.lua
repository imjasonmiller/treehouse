function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local lsp_installer = require('nvim-lsp-installer')

-- Include the servers you want to have installed by default below
local servers = {
  "rust_analyzer",
  "vuels",
}

for _, name in pairs(servers) do
  local server_available, requested_server = lsp_installer.get_server(name)

  if server_available then
    requested_server:on_ready(function(server)
        local opts = {}

        if server.name == "rust_analyzer" then
          -- opts = {
          --   rust-analyzer.server.path
          -- }
          print("server:", dump(server:get_default_options()))
        end

        requested_server:setup(opts)
    end)

    if not requested_server:is_installed() then
      -- Queue the server to be installed
      print("Installing " .. name)
      requested_server:install()
    end
  end
end

-- local lsp_installer_servers = require'nvim-lsp-installer.servers'
--
-- local server_available, requested_server = lsp_installer_servers.get_server("rust_analyzer")
--
-- if server_available then
--     requested_server:on_ready(function ()
--         local opts = {}
--         requested_server:setup(opts)
--     end)
--     if not requested_server:is_installed() then
--         -- Queue the server to be installed
--         requested_server:install()
--     end
-- end
