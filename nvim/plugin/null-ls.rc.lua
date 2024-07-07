local function file_exists(file)
  local f = io.open(file, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local current_path = vim.fn.getcwd()

local function find_config_file(attempt_counter)
  local config_file_path = vim.fn.getcwd()
  local number_of_attempts_exceeded = attempt_counter == 0

  if (not number_of_attempts_exceeded) then
    if (file_exists(config_file_path .. '/eslint.config.js')) then
      vim.cmd('cd ' .. current_path)
      return {
        "--config",
        config_file_path .. '/eslint.config.js'
      }
    else
      vim.cmd('cd ' .. config_file_path .. '/../')
      return find_config_file(attempt_counter - 1)
    end
  else
    vim.cmd('cd ' .. current_path)
    return {}
  end
end

-- Takuya-san configuration
local status, null_ls = pcall(require, "null-ls")
if (not status) then
  print('null-ls is not installed')
  return
end

local sources = {
  null_ls.builtins.formatting.dart_format,

  -- Adding my touch
  null_ls.builtins.formatting.prettierd.with({
    env = {
      PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("/home/yarso/.config/nvim/utils/.prettierrc.json"),
    },
  }),
  require("none-ls.diagnostics.eslint_d").with({
    -- filetypes = { "javascript", "typescript" },
    extra_args = find_config_file(15),
    -- diagnostics_format = '[eslint] (#{c})',
    diagnostics_format = '[eslint] #{m}\n(#{c})',
    -- diagnostics_postprocess = function(diagnostic)
    --   diagnostic.severity = vim.diagnostic.severity.ERROR
    -- end,
    -- env = {
    --   ESLINT_USE_FLAT_CONFIG = true,
    -- }
  })
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
