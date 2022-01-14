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

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local get_color = require'lualine.utils.utils'.extract_highlight_colors

require('lualine').setup{
  options = {
    theme = "github-primer-dark",
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
        source = diff_source,
        color_added = colors.green,
        color_modified = colors.yellow,
        color_removed = colors.red,
      },
	    {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = 'E ', warn = 'W ', info = 'I ', hint = 'H ' },
        diagnostics_color = {
          error = { fg = get_color("DiagnosticError", "fg") },
	        warn = { fg = get_color("DiagnosticWarn", "fg") },
	        info = { fg = get_color("DiagnosticInfo", "fg") },
	        hint = { fg = get_color("DiagnosticHint", "fg") },
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
