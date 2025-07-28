-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Plugin setup
require("lazy").setup({
  -- fzf integration
  {
    "junegunn/fzf",
    build = ":call fzf#install()"
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" }
  },
  -- colorscheme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      -- Custom colors for your preferences
      require("tokyonight").setup({
        style = "night",
                on_highlights = function(hl, colors)
          -- Most code: white-purple
          hl.Normal = { fg = "#E6D6FF" }  -- Light purple-white
          hl.Function = { fg = "#E6D6FF" }
          hl.Identifier = { fg = "#E6D6FF" }
          hl.Keyword = { fg = "#D6C6FF" }  -- def, if, import, etc - more purple
          hl.Conditional = { fg = "#D6C6FF" }  -- if, else, elif
          hl.Repeat = { fg = "#D6C6FF" }  -- for, while
          hl.Include = { fg = "#D6C6FF" }  -- import, from
          hl.Statement = { fg = "#D6C6FF" }  -- return, pass, break
          hl.StorageClass = { fg = "#D6C6FF" }  -- class, def
          hl.Structure = { fg = "#D6C6FF" }  -- def, class
          hl.Exception = { fg = "#D6C6FF" }  -- try, except, raise
          hl.Operator = { fg = "#E6D6FF" }
          hl.Number = { fg = "#E6D6FF" }
          hl.Boolean = { fg = "#D6C6FF" }  -- True, False
          hl.Constant = { fg = "#D6C6FF" }  -- None, True, False
          
          -- Comments: gray
          hl.Comment = { fg = "#6B7280", italic = true }
          
          -- Strings: gray-purple
          hl.String = { fg = "#B8A9C9" }  -- Gray-purple
        end,
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
})

-- Key mappings
vim.keymap.set('n', '<leader>f', ':Files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>r', ':Rg<CR>', { desc = 'Ripgrep search' })
vim.keymap.set('n', '<leader>b', ':Buffers<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>c', ':e $MYVIMRC<CR>', { desc = 'Edit config' })

-- Basic settings
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- fzf configuration for Windows
vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
vim.g.fzf_preview_window = {'right:50%', 'ctrl-/'}
