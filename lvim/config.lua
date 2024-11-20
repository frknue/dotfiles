--------------------- GENERAL ---------------------
vim.opt.relativenumber = true
lvim.transparent_window = true
lvim.format_on_save.enabled = true
lvim.builtin.bufferline.active = false
lvim.colorscheme = "gruvbox"
--------------------- GENERAL ---------------------

--------------------- KEYMAPS ---------------------
lvim.builtin.which_key.mappings["p"] = nil
vim.keymap.set("i", "jk", "<Esc>")
lvim.keys.normal_mode["<leader>pp"] = ":e#<cr>"

-- Toggle diagnostics
lvim.keys.normal_mode["<leader>tl"] = function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

-- Show line diagnostics
lvim.keys.normal_mode["<leader>d"] = function()
  vim.diagnostic.open_float(nil, { scope = "cursor" })
end

-- Split Windows
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
-- lvim.keys.normal_mode["-"] = ":split<CR>"

lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["gT"] = ":BufferLineCyclePrev<CR>"

-- jump 10 lines up/down with arrow keys
vim.keymap.set("n", "<up>", "10k", { desc = "Jump 10 lines up" })
vim.keymap.set("n", "<down>", "10j", { desc = "Jump 10 lines down" })
vim.keymap.set("v", "<up>", "10k", { desc = "Jump 10 lines up" })
vim.keymap.set("v", "<down>", "10j", { desc = "Jump 10 lines down" })

-- Remove no highlight default lvim keymap
lvim.keys.normal_mode["<leader>h"] = false
-- Window management
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])   -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

--------------------- KEYMAPS ---------------------

--------------------- PLUGINS ---------------------
lvim.plugins = {
  {
    "lunarvim/synthwave84.nvim"
  },
  { "catppuccin/nvim",         name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim" },
  {

    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Mark file with harpoon" },
      { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>",          desc = "Go to next harpoon mark" },
      { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",          desc = "Go to previous harpoon mark" },
      { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup({
        copy_sync = {
          -- enables copy sync. by default, all registers are synchronized.
          -- to control which registers are synced, see the `sync_*` options.
          enable = false,

          -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
          -- first buffer or named_buffer_name = true to ignore a named tmux
          -- buffer with name named_buffer_name :)
          ignore_buffers = { empty = false },

          -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
          -- clipboard by tmux
          redirect_to_clipboard = false,

          -- offset controls where register sync starts
          -- e.g. offset 2 lets registers 0 and 1 untouched
          register_offset = 0,

          -- overwrites vim.g.clipboard to redirect * and + to the system
          -- clipboard using tmux. If you sync your system clipboard without tmux,
          -- disable this option!
          sync_clipboard = false,

          -- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
          sync_registers = false,

          -- syncs deletes with tmux clipboard as well, it is adviced to
          -- do so. Nvim does not allow syncing registers 0 and 1 without
          -- overwriting the unnamed register. Thus, ddp would not be possible.
          sync_deletes = false,

          -- syncs the unnamed register with the first buffer entry from tmux.
          sync_unnamed = false,
        },
        navigation = {
          -- cycles to opposite pane while navigating into the border
          cycle_navigation = true,

          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,

          -- prevents unzoom tmux when navigating beyond vim border
          persist_zoom = false,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,

          -- sets resize steps for x axis
          resize_step_x = 1,

          -- sets resize steps for y axis
          resize_step_y = 1,
        }
      })
    end

  }
}
--------------------- PLUGINS ---------------------

--------------------- BUILTINS ---------------------
lvim.builtin.bigfile.config = {
  filesize = 2,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
  pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
  features = {       -- features to disable
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "syntax",
    "matchparen",
    "vimopts",
    "filetype",
  },
}

lvim.builtin.lualine.setup = {
  options = {
    theme = "catppuccin"
  }
}

-- lvim.builtin.nvimtree.setup.view = {
--   relativenumber = true,
--   float = {
--     enable = true,
--     open_win_config = function()
--       local screen_w = vim.opt.columns:get()
--       local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
--       local window_w = screen_w * 0.8
--       local window_h = screen_h * 0.8
--       local window_w_int = math.floor(window_w)
--       local window_h_int = math.floor(window_h)
--       local center_x = (screen_w - window_w) / 2
--       local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
--       return {
--         border = "rounded",
--         relative = "editor",
--         row = center_y,
--         col = center_x,
--         width = window_w_int,
--         height = window_h_int,
--       }
--     end,
--   },
--   width = function()
--     return math.floor(vim.opt.columns:get() * 0.5)
--   end,
-- }

local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings.i = {
  ["<C-k>"] = actions.move_selection_previous,                       -- move to prev result
  ["<C-j>"] = actions.move_selection_next,                           -- move to next result
  ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
}
--------------------- BUILTINS ---------------------

--------------------- LINTERS/FORMATTERS ---------------------
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { command = "eslint", filetypes = { "typescript", "typescriptreact" } },
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
})
--------------------- LINTERS/FORMATTERS ---------------------
