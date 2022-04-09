require('telescope').setup {
    filter='1',
    defaults = {
        filter={
            m={
                map="node_modules",
                excludeFrom = {"general"}
            },
            d={
                map="doc",
                excludeFrom = {"general"}
            },
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        color_devicons=true,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        file_ignore_patterns={
            "node_modules"
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }  
}
require('telescope').load_extension('fzy_native')
