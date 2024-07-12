local status, onedark = pcall(require, "onedark")
if (not status) then
  print('onedark is not installed')
  return
end

onedark.setup {
  style = 'darker',
  transparent = true
}

onedark.load()

-- Load the colorscheme
-- vim.cmd(<theme>)

-- Themes
-- onedark
-- solarized-osaka
-- onedark_vivid
