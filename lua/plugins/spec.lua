return {
  -- Catppuccin colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- load before other plugins
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false, -- keep background, transparent.nvim will handle this
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Telescope
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
      
      config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      end,
    },

-- Treesitter 
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")

      config.setup({
        ensure_installed = {"c", "lua", "python", "html", "css", "javascript", "typescript"},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Nvim tree
  {
	"nvim-tree/nvim-tree.lua",
  	version = "*",
  	lazy = false,
  	dependencies = {
    		"nvim-tree/nvim-web-devicons",
  	},
  	config = function()
    		require("nvim-tree").setup {}
  		end,
  },
  
  -- Transparent.nvim
  {
    "xiyaowong/transparent.nvim",
    config = function()
      -- enable transparency right away
      require("transparent").clear()
      require("transparent").toggle(false)
    end,
  },
}
