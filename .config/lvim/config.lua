-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

require("user.options")

--{{{ Look and feel
-- Theme
lvim.colorscheme = "gruvbox"
-- Word wrap
vim.opt.wrap = true
--}}}

--{{{ Key mappings
lvim.keys.normal_mode["<C-t>"] = ":1ToggleTerm<cr>"

-- Treesitter
lvim.builtin.which_key.mappings["t"] = {
  name = "Tools",
  g = {
    name = "ChatGPT",
    a = { "<cmd>ChatGPTActAs<cr>", "ChatGPT act as" },
    c = { "<cmd>ChatGPT<cr>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstructions<cr>", "ChatGPT edit with instructions" },
  },
  l = {
    name = "Logs",
    p = { '<cmd>1TermExec cmd="lnav ./logs/php/error.log" size=50 direction=horizontal<cr>', "PHP error log" },
  }
}
--}}}

--{{{ Plugins
lvim.plugins = {

	--{{{ Github Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  --}}}

  --{{{ Chat GPT
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  --}}}

	--{{{ Gruvbox theme
	{
		"ellisonleao/gruvbox.nvim"
	},
  --}}}

  --{{{ Marks
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup()
    end,
  },
  --}}}

  --{{{ Trouble
  {
  "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  --}}}
  
  --{{{ Table mode
  -- {
  -- "dhruvasagar/vim-table-mode",
  -- },
  --}}}

  --{{{ TODO Comments
  {
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function()
    require("todo-comments").setup {
        keywords = {
          FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" },
          },
          TODO = { icon = "󱖫 ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          DOING = { icon = "󱁤 ", color = "process" },
          DONE = { icon = " ", color = "success", alt = { "OK" } },
          QUESTION = { icon = " ", color = "question", alt = { "QSTN" } },
          RESUME = { icon = " ", color = "process", alt = { "RES" } },
        },
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#C53931" },
          warning = { "DiagnosticWarn", "WarningMsg", "#CF662D" },
          process = { "Process", "#AE6A82" },
          success = { "Success", "#999831" },
          question = { "Question", "#CF9A38" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#709D6B" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" }
        },
      }
  end,
  },
  -- }}}

  --{{{ Swenv
  -- {
  -- "ChristianChiarulli/swenv.nvim",
  -- },
  --}}}

  --{{{ Dressing
  {
  "stevearc/dressing.nvim",
  },
  --}}}

  --{{{ Nvim dap python
  -- {
  -- "mfussenegger/nvim-dap-python",
  -- },
  --}}}

  --{{{ Nvim neotest
  -- {
  -- "nvim-neotest/neotest",
  -- },
  --}}}

  --{{{ Nvim neotest python
  -- {
  -- "nvim-neotest/neotest-python",
  -- },
  --}}}
}
--}}}

--{{{ Copilot setup 
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
--}}}

--{{{ Python environment setup

-- automatically install python syntax highlighting
-- lvim.builtin.treesitter.ensure_installed = {
--   "python",
-- }

-- -- setup formatting
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup { { name = "black" }, }
-- lvim.format_on_save.enabled = true
-- lvim.format_on_save.pattern = { "*.py" }

-- -- setup linting
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { command = "flake8", filetypes = { "python" } } }

-- -- setup debug adapter
-- lvim.builtin.dap.active = true
-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- pcall(function()
--   require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
-- end)

-- -- setup testing
-- require("neotest").setup({
--   adapters = {
--     require("neotest-python")({
--       -- Extra arguments for nvim-dap configuration
--       -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
--       dap = {
--         justMyCode = false,
--         console = "integratedTerminal",
--       },
--       args = { "--log-level", "DEBUG", "--quiet" },
--       runner = "pytest",
--     })
--   }
-- })

-- lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
--   "Test Method" }
-- lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
--   "Test Method DAP" }
-- lvim.builtin.which_key.mappings["df"] = {
--   "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
-- lvim.builtin.which_key.mappings["dF"] = {
--   "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
-- lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }


-- -- binding for switching
-- lvim.builtin.which_key.mappings["C"] = {
--   name = "Python",
--   c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
-- }



--}}}

--{{{ Folding
vim.opt.foldenable = true
vim.opt.foldlevel = 0
vim.opt.foldnestmax = 10
vim.opt.foldmethod = "marker"
vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.modelines = 1

function _G.custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    line = string.gsub(line, '#{{{', '')
    line = string.gsub(line, '//{{{', '')
    line = string.gsub(line, '/*{{{', '')
    line = string.gsub(line, '--{{{', '')
    return " " .. line
end
--}}}
