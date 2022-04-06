
vim.cmd [[
    :nnoremap <space> <Nop>
    let mapleader=" "
]]

vim.cmd [[
    inoremap jk <ESC>
]]

--- telescope mapping
vim.cmd [[
    " Find files using Telescope command-line sugar.
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

]]


--- floating terminal mapping
vim.cmd [[
    nnoremap   <leader>tt         :FloatermToggle<CR>
    tnoremap   <silent> <leader>tt   <C-\><C-n>:FloatermToggle<CR> 
]]

--- quick nvim-neo-tree mapping
vim.cmd [[
    nnoremap <leader>tr    :Neotree toggle<CR>
]]

-- window toggle
vim.cmd [[
    nnoremap <leader>th   <C-W>h
    nnoremap <leader>tl   <C-W>l

]]

-- hop
vim.cmd [[
    nnoremap <leader>hw :HopWord<CR>
    nnoremap <leader>hl :HopLine<CR>
]]
