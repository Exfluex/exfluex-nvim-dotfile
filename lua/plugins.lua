local M = {}

local function ui_plugins(use)

        -- Colorscheme
        use {
            "sainnhe/everforest",
            config = function()
            vim.cmd "colorscheme everforest"
            end,
            }
        use {
            'glepnir/galaxyline.nvim',
            branch = 'main',
            -- your statusline
            config = function() require'config.ui.statusline' end,
            -- some optional icons
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim"
            },
            config=require('config.ui.neo-tree').configure
        }
        -- Which Key Plugin: For Keybinding hint
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup { }
            end
        }
        -- Hop Quick Jump
        use {
            'phaazon/hop.nvim',
            branch = 'v1', -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            end }

        -- float terminal 
        use 'voldikss/vim-floaterm'

        -- telescope finder
        use { 'nvim-telescope/telescope.nvim', requires= {{ 'nvim-lua/plenary.nvim' }} }
        use { 'nvim-telescope/telescope-fzy-native.nvim' }
        require('config.ui.nvim-telescope')

        -- treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use {'p00f/nvim-ts-rainbow'}
        require('config.ui.treesitter')


        ---tabline
        use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
        require('config.ui.bufferline')

        --configure tmux
        use {'christoomey/vim-tmux-navigator'}

        -- better command line intellisense popup/bar
        use {
            'gelguy/wilder.nvim',
            config = function()
            -- config goes here
            end,
        }
        require('config.productive.wilder')
        use 'lewis6991/impatient.nvim'
        require('impatient')
        use { 'ap/vim-css-color'}
        -- Highlight URLs inside vim
        use({"itchyny/vim-highlighturl", event = "VimEnter"})
    end
local function productive_plugin(use)
    -- msic
    use { 'tpope/vim-unimpaired'}

    --- better surrounding Add Mod Del plugin
    use { 'machakann/vim-sandwich'}

    -- smooth scroll
    use {'karb94/neoscroll.nvim'}
    require('config.productive.neoscroll')

    -- no lag jk 
    use {'jdhao/better-escape.vim', event = 'InsertEnter'}
    
     -- Show match number and index for searching
    use {
      'kevinhwang91/nvim-hlslens',
      branch = 'main',
      keys = {{'n', '*'}, {'n', '#'}, {'n', 'n'}, {'n', 'N'}},
      config = [[require('config.productive.hlslens')]]
    }
    end
local function programming_plugins(use)
    use { 'neoclide/coc.nvim',branch='release'}
    -- use { 'preservim/tagbar'}
    
    -- tagbar
    use {'liuchengxu/vista.vim'}

    -- auto pair tag
     use { 'windwp/nvim-autopairs'}
     require('nvim-autopairs').setup{}
    

    --code runner
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}


    -- Comment Enhancement
    use {'tpope/vim-commentary'}

    -- vim mark enhancement
    use {'chentau/marks.nvim'}
    require('config.productive.marks')

    -- Snippet engine and snippet template
    -- use({"SirVer/ultisnips", event = 'InsertEnter'})
    -- use({ "honza/vim-snippets", after = 'ultisnips'})

    -- web development
    use {'pangloss/vim-javascript'}
    use {'leafgarland/typescript-vim'}
    use {'peitalin/vim-jsx-typescript'}
    use {'styled-components/vim-styled-components', branch = 'main' }
    use {'jparise/vim-graphql'}
    use {'alvan/vim-closetag'}
    
end

function M.setup()
  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
         }
        vim.cmd [[packadd packer.nvim]]
        end
        vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    end

    local function plugins(use)
        use { "wbthomason/packer.nvim" }
        -- ui plugins setup
        ui_plugins(use)
        -- programming plugins setup
        programming_plugins(use)
        productive_plugin(use)
    end
  -- =====Configure Packer & Plugins=====
    packer_init()
    local packer = require "packer"
    packer.startup(plugins)
end


return M
