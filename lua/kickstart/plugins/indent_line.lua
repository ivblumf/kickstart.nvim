-- return {
--   { -- Add indentation guides even on blank lines
--     'lukas-reineke/indent-blankline.nvim',
--     -- Enable `lukas-reineke/indent-blankline.nvim`
--     -- See `:help ibl`
--     main = 'ibl',
--     opts = {},
--   },
-- }

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  -- branch = 'v3',
  event = 'BufReadPre',
  config = function()
    local hl_name_list = {
      'RainbowDelimiterRed',
      'RainbowDelimiterYellow',
      'RainbowDelimiterOrange',
      'RainbowDelimiterGreen',
      'RainbowDelimiterBlue',
      'RainbowDelimiterCyan',
      'RainbowDelimiterViolet',
    }
    require('ibl').setup {
      scope = {
        enabled = true,
        show_start = false,
        highlight = hl_name_list,
      },
    }
    -- local hooks = require 'ibl.hooks'
    -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    -- local highlight = {
    --   'CursorColumn',
    --   'Whitespace',
    -- }
    -- require('ibl').setup {
    --   indent = { highlight = highlight, char = '' },
    --   whitespace = {
    --     highlight = highlight,
    --     remove_blankline_trail = false,
    --   },
    --   scope = { enabled = false },
    -- }
  end,
}, {
  'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
  config = function()
    local colors = {
      Red = '#EF6D6D',
      Orange = '#FFA645',
      Yellow = '#EDEF56',
      Green = '#6AEF6F',
      Cyan = '#78E6EF',
      Blue = '#70A4FF',
      Violet = '#BDB2EF',
    }
    require('pynappo.theme').set_rainbow_colors('RainbowDelimiter', colors) -- just a helper function that sets the highlights with the given prefix
    local rainbow_delimiters = require 'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterBlue',
        'RainbowDelimiterCyan',
        'RainbowDelimiterViolet',
      },
    }
  end,
}
