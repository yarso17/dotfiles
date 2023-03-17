local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icons = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#171717',
      bg = '#171717'
    },
    separator_selected = {
      fg = '#171717'
    },
    background = {
      fg = '#808080',
      bg = '#171717'
    },
    buffer_selected = {
      fg = '#ffffff',
      underline = false,
      undercurl = false,
      italic = true
    },
    fill = {
      bg = '#171717'
    }
  }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
