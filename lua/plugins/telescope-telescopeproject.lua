-- Telescope + UI-Select + Project integration

return {
  ---------------------------------------------------------------------------
  -- TELESCOPE CORE
  ---------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-project.nvim",
    },

    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        extensions = {

          -- UI-Select dropdown menu
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          },

          -- Project management
          project = {
            base_dirs = {
              -- Add your common project folders here if you want:
              -- { "~/Projects", max_depth = 3 },
            },
            hidden_files = true, -- show .git, etc
            theme = "dropdown",
            order_by = "recent",
            sync_with_nvim_tree = true,
          },
        },
      })

      -- Load extensions
      telescope.load_extension("ui-select")
      telescope.load_extension("project")

      -----------------------------------------------------------------------
      -- KEYMAPS
      -----------------------------------------------------------------------
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

      -- Project picker
      vim.keymap.set("n", "<leader>fp", telescope.extensions.project.project, {
        desc = "Switch project",
      })
    end,
  },
}
