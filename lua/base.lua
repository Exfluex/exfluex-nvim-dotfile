


local M ={}

function M.configure()


    -- set line number & tab
    vim.cmd [[
        set number
	    set relativenumber	
	    set smarttab
	    set tabstop=4
	    set shiftwidth=4
	    set expandtab
    ]]

    vim.cmd [[
        syntax on
    ]]
    --- set timeoutlen for which key
    vim.cmd [[
        set timeoutlen=400
    ]]
end


return M
