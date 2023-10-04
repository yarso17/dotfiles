local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word b & w
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
-- keymap.set('n', 'te', ':tabedit<CR>:F<CR>', { silent = true })
keymap.set('n', 'te', ':tabedit<CR>:F<CR>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Go to normal mode
keymap.set('i', 'kk', '<Esc>')
keymap.set('i', 'jj', '<Esc>')
keymap.set('i', 'kj', '<Esc>')
keymap.set('i', 'jk', '<Esc>')

-- Better way to move a line
keymap.set('x', 'K', ":move '<-2<CR>gv-gv")
keymap.set('x', 'J', ":move '>+1<CR>gv-gv")

-- Better tabbing
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Replace a word
keymap.set('n', 'M', ':%s/')

-- Save and close current tab
-- keymap.set('n', '<C-b>', ':w<CR>:bd<CR>')
keymap.set('n', '<C-b>', ':wq<CR>')

-- Save current tab
keymap.set('n', '<C-s>', ':w<CR>')
