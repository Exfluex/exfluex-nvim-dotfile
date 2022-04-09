local rainbow = { "#CC8888", "#CCCC88", "#88CC88", "#88CCCC", "#8888CC", "#CC88CC" }
require("nvim-treesitter.configs").setup {
  highlight ={
      enable= true
  },
  -- incremental_selection={
  --     enable=true,
  --     keymaps = {
  --       init_selection = "gnn",
  --       node_incremental = "grn",
  --       scope_incremental = "grc",
  --       node_decremental = "grm",
  --     }
  -- },
  -- indent={
  --     enable=true
  -- },
  -- rainbow = {
  --     enable =true,
  --     extended_mode =true
  -- }
  -- -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
       colors = {
          "#E06C75",
          "#E5C07B",
          "#98C379",
          "#56B6C2",
          "#61AFEF",
          "#C678DD",
          "#E06C75"
        },
  },
  
  -- rainbow = {
  --   enable = true,
  --   -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  --   extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  --   max_file_lines = nil, -- Do not enable for files with more than n lines, int
  --   -- colors = {}, -- table of hex strings
  --   -- termcolors = {} -- table of colour name strings
  -- }
}
-- for i, c in ipairs(rainbow) do -- p00f/rainbow#81
-- 	vim.cmd(("hi rainbowcol%d guifg=%s"):format(i, c))
-- end
