return {
    "RaafatTurki/hex.nvim",
    config = function()
        local hex = require("hex")
        hex.setup()
        vim.keymap.set("n", "<leader>mh", function()
            hex.toggle()
        end, { desc = "Toggle hex editor" })
    end
}
