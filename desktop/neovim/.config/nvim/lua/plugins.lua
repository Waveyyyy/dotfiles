local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Packer is not installed")
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

packer.startup(function(use)
    -- packer can manage itself!
    use "wbthomason/packer.nvim"

    -- ranger file explorer
    use {
        "francoiscabrol/ranger.vim",
        requires = { "rbgrouleff/bclose.vim" }
    }

    -- lsp config
    use { "neovim/nvim-lspconfig", tag = "v0.1.3" }
    use "junnplus/lsp-setup.nvim"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "folke/neodev.nvim"

    -- git
    use "tpope/vim-fugitive"
    use "airblade/vim-gitgutter"

    -- colorscheme
    use { "navarasu/onedark.nvim" }
    use "norcalli/nvim-colorizer.lua"

    -- autocompletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"

    -- QOL
    use "scrooloose/nerdcommenter"
    --    use "jiangmiao/auto-pairs"

    -- snippet
    use "L3MON4D3/LuaSnip"

    -- symbol
    use "simrat39/symbols-outline.nvim"
    use "ryanoasis/vim-devicons"
    use "tiagofumo/vim-nerdtree-syntax-highlight"

    -- statusbar
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- bufferline
    use { "akinsho/nvim-bufferline.lua", tag = "v2.7.0" }
    use "vim-scripts/BufOnly.vim"

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    }
    use "sheerun/vim-polyglot"

    -- indentation guides
    use "lukas-reineke/indent-blankline.nvim"


    -- Automatically run packer.clean() followed by packer.update() after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
