-- Lualine + Noice + Notify complete setup

return {

  ---------------------------------------------------------------------------
  -- LUALINE (statusline)
  ---------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "folke/noice.nvim",
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },

        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },

          lualine_c = {
            -- Noice mode (recording, search, etc.) in statusline
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
              color = { fg = "#ff9e64" },
            },
            "filename",
          },

          lualine_x = {
            -- Noice command info in statusline
            {
              require("noice").api.status.command.get,
              cond = require("noice").api.status.command.has,
            },
            -- Noice search info (like /something)
            {
              require("noice").api.status.search.get,
              cond = require("noice").api.status.search.has,
            },
            "encoding",
            "filetype",
          },

          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- NOICE (notifications, LSP UI, popup cmdline)
  ---------------------------------------------------------------------------
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },

    config = function()
      ---------------------------------------------------------------------
      -- Notify (nice-looking notifications)
      ---------------------------------------------------------------------
      require("notify").setup({
        stages = "fade",
        timeout = 3000,
        background_colour = "#000000",
      })
      vim.notify = require("notify")

      ---------------------------------------------------------------------
      -- Noice
      ---------------------------------------------------------------------
      require("noice").setup({

        -- Improve LSP markdown + docs rendering
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },

        presets = {
          bottom_search = false,   -- disable bottom search
          command_palette = false, -- keep command centered
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },

        -------------------------------------------------------------------
        -- CENTERED COMMAND LINE POPUP
        -------------------------------------------------------------------
        cmdline = {
          view = "cmdline_popup",
        },

        views = {
          cmdline_popup = {
            position = {
              row = "50%",   -- vertical center
              col = "50%",   -- horizontal center
            },
            size = {
              width = 60,
              height = "auto",
            },
            border = {
              style = "rounded",
              padding = { 1, 2 },
            },
            win_options = {
              winhighlight = "Normal:NoiceCmdlinePopup,FloatBorder:NoiceCmdlinePopupBorder",
            },
          },
        },

      })
    end,
  },
}
