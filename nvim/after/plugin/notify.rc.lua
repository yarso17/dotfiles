local status, notify = pcall(require, "notify")
if (not status) then
  print('notify is not installed')
  return
end

notify.setup({
  timeout = 5000,
  render = "compact",
  stages = "fade",
  background_colour = "#1e222a",
  text_colour = "#abb2bf",
  icons = {
    ERROR = "  ",
    WARN = "  ",
    INFO = "  ",
    DEBUG = "  ",
    TRACE = " ✎ ",
  },
})

vim.notify = notify

-- vim.notify("Notify is ready")
