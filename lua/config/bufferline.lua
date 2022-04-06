vim.opt.termguicolors = true
require("bufferline").setup{
    options={
        custom_filter= function(buf_number,buf_numbers)
            if vim.bo[buf_number].filetype == "" then
                return false
            end
            return true
        end,
        
        offsets = {{filetype="neo-tree",text="File Explorer",text_align="left"}}
    },
}
