return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      direction = "float",
    })

    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

    -- Alt+t then t  → floating terminal
    vim.keymap.set("n", "<A-t>t", "<cmd>ToggleTerm<CR>")

    -- Alt+t then h → horizontal terminal
    vim.keymap.set("n", "<A-t>h", "<cmd>ToggleTerm direction=horizontal<CR>")

    -- Alt+t then v → vertical terminal
    vim.keymap.set("n", "<A-t>v", "<cmd>ToggleTerm direction=vertical<CR>")

    -- Alt+g then g → lazygit
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<A-g>g", _lazygit_toggle)
  end,
}

