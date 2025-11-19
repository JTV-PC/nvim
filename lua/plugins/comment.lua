-- lua/plugins/comment.lua
return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            toggler = {
                line = "<leader>cc",  -- toggle line comment
                block = "<leader>cb", -- optional: toggle block comment
            },
            opleader = {
                line = "<leader>cc",  -- operator pending line comment
                block = "<leader>cb", -- optional: operator pending block comment
            },
        })
    end
}

