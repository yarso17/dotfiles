local status, prettier = pcall(require, 'prettier')
if (not status) then return end

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  cli_options = {
    arrow_parens = "avoid",
    single_quote = true,
    bracket_spacing = true,
    end_of_line = "lf",
    semi = false,
    tab_width = 2,
    trailing_comma = "none",
    -- single_attribute_per_line = false,
    -- jsx_single_quote = false,
    -- embedded_language_formatting = "auto",
  },
})
