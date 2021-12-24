local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

require('lualine').setup{
  options = {
    theme = 'gruvbox',
    component_separators = "|",
    section_separators = {},
  },
  sections = {
    lualine_b = {
      {
        'b:gitsigns_head',
        icon = ''
      },
    },
    lualine_c = {
      {
        "filename",
	      file_status = true, -- displays file status (readonly status, modified status)
	      path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
      {
        'diff',
        color_added = colors.green,
        color_modified = colors.yellow,
        color_removed = colors.red,
      },
	    {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        colored = true,
        symbols = { error = 'E ', warn = 'W ', info = 'I ', hint = 'H ' },
        diagnostics_color = {
          error = 'DiagnosticError',
          warn = 'DiagnosticWarn',
          info = 'DiagnosticInfo',
          hint = 'DiagnosticHint',
        },
      },
    },
    lualine_x = {'encoding', { 'fileformat', icons_enabled = false }, 'filetype'},
  },
  inactive_sections = {
    lualine_c = {
      {
        "filename",
	      file_status = true, -- displays file status (readonly status, modified status)
	      path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    },
  }
}
