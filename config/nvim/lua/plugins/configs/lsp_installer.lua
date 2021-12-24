local lsp_installer = require('nvim-lsp-installer')

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
          opts = server:get_default_options()

          -- See: https://github.com/simrat39/rust-tools.nvim#initial-setup
          -- See: https://github.com/williamboman/nvim-lsp-installer/wiki/Rust
          -- Initialize the LSP via rust-tools instead
          -- require('rust-tools').setup {
              -- The "server" property provided in rust-tools setup function are the
              -- settings rust-tools will provide to lspconfig during init.            --
              -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
              -- with the user's own settings (opts).
              -- server = vim.tbl_deep_extend('force', server:get_default_options(), opts),
          -- }
          -- server:attach_buffers()
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
