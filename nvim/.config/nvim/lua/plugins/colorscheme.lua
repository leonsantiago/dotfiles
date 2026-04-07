return {
  -- Gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- Gruvbox-material
  { "sainnhe/gruvbox-material" },
  -- Koda
  { "oskarnurm/koda.nvim" },
  -- Evergarden
  { "everviolet/nvim" },
  -- gruber-darker.nvim
  { "blazkowolf/gruber-darker.nvim" },
  -- attron/bebop.nvim
  {
    "attron/bebop.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bebop").setup()
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        -- transparent = true, -- Makes your terminal background show through
      }
    end,
  },
  -- Everforest
  { "sainnhe/everforest" },
  -- Sobrio
  { "elvessousa/sobrio" },
  -- Kanagawa
  { "rebelot/kanagawa.nvim" },
  -- Xcode
  { "lunacookies/vim-colors-xcode" },
  -- Neovim Ayu
  { "shatur/neovim-ayu" },
  -- Alabaster
  { "p00f/alabaster.nvim" },
  -- Badwolf
  { "sjl/badwolf" },
  -- Default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- zenbones
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },
}
