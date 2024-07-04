local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "tpope/vim-repeat"
  },
  {
    "tpope/vim-surround"
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").create_default_mappings()
    end
  },
  { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = {
      ensure_installed = {
        "c_sharp",
        "rust",
        "python",
        "yaml",
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
})

vim.keymap.set('n', 'j', 'gj', {remap=true})
vim.keymap.set('n', 'k', 'gk', {remap=true})

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.background = 'light'
