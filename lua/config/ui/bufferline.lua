vim.opt.termguicolors = true
local function contains(table, val)
   for i=1,#table do
      if table[i] == val then 
         return true
      end
   end
   return false
end

require("bufferline").setup{
    options={
        custom_filter= function(buf_number,buf_numbers)
            local except = {'','checkhealth','tagbar'}
            if contains(except,vim.bo[buf_number].filetype)  then
                return false
            end
            return true
        end,
        offsets = {{filetype="neo-tree",text="File Explorer",text_align="left"}}
    },
}
