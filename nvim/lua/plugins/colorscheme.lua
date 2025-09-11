return {
  -- Gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Everforest
  { "sainnhe/everforest" },

  -- Sobrio
  { "elvessousa/sobrio" },

  -- Kanagawa
  { "rebelot/kanagawa.nvim" },
  -- Xcode
  { "lunacookies/vim-colors-xcode" },

  -- Default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "xcode",
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
