local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup({
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "tsx",
    "typescript",
    'javascript',
    "fish",
    "php",
    "json",
    "css",
    "html",
    "lua",
    'python',
    'java',
    'astro'
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable         = true,
    enable_autocmd = false,
  }
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
