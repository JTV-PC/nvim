-- Tree like file system representation 

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotre.Config?
  opts = {
    -- fill any relevant options here
    filesystem = {
    filtered_items = {
      visible = true,          -- Show filtered (hidden) files by default
      show_hidden_count = true,
      hide_dotfiles = false,   -- Don't hide dotfiles (e.g. .git, .env)
      hide_gitignored = false, -- Don't hide files listed in .gitignore
    },
  },
},
  vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>', {})
}
