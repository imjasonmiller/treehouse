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
