-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
-- Theme
lvim.colorscheme = "gruvbox"

-- Word wrap
vim.opt.wrap = true

-- Plugins
lvim.plugins = {

	-- Github Copilot
	{
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_no_tab_map = true
		end,
	},
	{
		"hrsh7th/cmp-copilot",
		config = function()
			lvim.builtin.cmp.formatting.source_names["copilot"] = "( )"
			table.insert(lvim.builtin.cmp.sources, 2, { name = "copilot" })
		end,
	},

	-- Gruvbox theme
	{
		"ellisonleao/gruvbox.nvim"
	},

  -- Marks
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup()
    end,
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },

  -- Trouble
  {
  "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  -- TODO Comments
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

}


-- Folding
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
