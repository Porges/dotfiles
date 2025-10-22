-- cSpell: enableCompoundWords

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
    "wellle/targets.vim"
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").create_default_mappings()
    end
  },
  {
    "ggandor/flit.nvim",
    config = function()
      require("flit").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = {
      ensure_installed = {
        "c_sharp",
        "json",
        "jsonc",
        "rust",
        "python",
        "yaml",
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
          },
        }
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = function()
      local ai = require("mini.ai")
      return {
        custom_textobjects = {
          a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },
  {
    "echasnovski/mini.operators",
    config = function(_, opts)
      require("mini.operators").setup(opts)
    end,
  },
  {
    "echasnovski/mini.splitjoin",
    config = function(_, opts)
      require("mini.splitjoin").setup(opts)
    end,
  },
  {
    "echasnovski/mini.align",
    config = function(_, opts)
      require("mini.align").setup(opts)
    end,
  }
})

local opt = vim.opt
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.background = 'light'

local km = vim.keymap
-- let jk work when word wrapping is enabled
km.set('n', 'j', 'gj', {remap=true})
km.set('n', 'k', 'gk', {remap=true})

-- when indenting in visual mode, stay in visual mode
km.set("v", "<", "<gv")
km.set("v", ">", ">gv")

local has_vscode,vscode = pcall(require, 'vscode')
if has_vscode then
  local function vscode_action(cmd)
    return function() vscode.action(cmd) end
  end

  -- go to diagnostics
  km.set('n', ']d', vscode_action('editor.action.marker.next'))
  km.set('n', '[d', vscode_action('editor.action.marker.prev'))
  km.set('n', ']D', vscode_action('editor.action.marker.nextInFiles'))
  km.set('n', '[D', vscode_action('editor.action.marker.prevInFiles'))

  -- go to errors
  km.set('n', ']e', vscode_action('go-to-next-error.next.error'))
  km.set('n', '[e', vscode_action('go-to-next-error.prev.error'))
  km.set('n', ']E', vscode_action('go-to-next-error.nextInFiles.error'))
  km.set('n', '[E', vscode_action('go-to-next-error.prevInFiles.error'))

  km.set('n', 'gr', vscode_action('editor.action.goToReferences'))
  km.set('n', 'gf', vscode_action('editor.action.openLink'))
  -- gd is 'goto definition'
  km.set('n', 'gp', vscode_action('editor.action.peekDefinition'))

  -- go to changes (hunks)
  km.set('n', ']h', vscode_action('workbench.action.editor.nextChange'))
  km.set('n', '[h', vscode_action('workbench.action.editor.previousChange'))

  -- bookmarks
  km.set('n', '<Leader>bb', vscode_action('bookmarks.toggle'))
  km.set('n', ']b', vscode_action('bookmarks.jumpToNext'))
  km.set('n', '[b', vscode_action('bookmarks.jumpToPrevious'))
  km.set('n', 'gb', vscode_action('bookmarks.listFromAllFiles'))
  km.set('n', 'gB', vscode_action('bookmarks.list'))

  -- hunk stage
  km.set('n', '<Leader>hs', vscode_action('git.stageSelectedRanges'))
end
