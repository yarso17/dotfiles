local status, flutter_tools = pcall(require, "flutter-tools")
if (not status) then
  print('flutter tools plugin is not installed')
  return
end

flutter_tools.setup {
  widget_guides = {
    enabled = true,
  },
}
