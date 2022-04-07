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
        -- Hop
        use {
            'phaazon/hop.nvim',
            branch = 'v1', -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            end
        }
        use 'voldikss/vim-floaterm'
        use {
            'nvim-telescope/telescope.nvim',
            requires= {{ 'nvim-lua/plenary.nvim' }}
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use {
            'nvim-telescope/telescope-fzy-native.nvim'
        }
        -- configure telescope here.
        require('config.ui.nvim-telescope')
        use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
        require('config.ui.bufferline')

        --configure tmux
        use{'christoomey/vim-tmux-navigator'}
end
local function easy_move_plugins(use)
    use { 'tpope/vim-unimpaired'}
    use { 'machakann/vim-sandwich'}
    end
local function programming_plugins(use)
    use { 'neoclide/coc.nvim',branch='release'}
    use { 'preservim/tagbar'}
    use { 'windwp/nvim-autopairs'}
    require('nvim-autopairs').setup{}
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
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
        easy_move_plugins(use)
    end
  -- =====Configure Packer & Plugins=====
    packer_init()
    local packer = require "packer"
    packer.startup(plugins)
end


return M
