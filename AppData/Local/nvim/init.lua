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

local has_vscode,vscode = pcall(require, 'vscode')
if has_vscode then
  local function vscode_action(cmd)
    return function() vscode.action(cmd) end
  end

  vim.keymap.set('n', ']d', vscode_action('editor.action.marker.next'))
  vim.keymap.set('n', '[d', vscode_action('editor.action.marker.prev'))

  vim.keymap.set('n', 'gr', vscode_action('editor.action.goToReferences'))
  vim.keymap.set('n', 'gf', vscode_action('editor.action.openLink'))

  vim.keymap.set('n', ']h', vscode_action('workbench.action.editor.nextChange'))
  vim.keymap.set('n', '[h', vscode_action('workbench.action.editor.previousChange'))

  vim.keymap.set('n', '<Leader>bb', vscode_action('bookmarks.toggle'))
  vim.keymap.set('n', ']b', vscode_action('bookmarks.jumpToNext'))
  vim.keymap.set('n', '[b', vscode_action('bookmarks.jumpToPrevious'))
  vim.keymap.set('n', 'gb', vscode_action('bookmarks.list'))
end
