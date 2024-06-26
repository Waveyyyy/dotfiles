-- Open ranger when vim opens a directory
local ranger_nvim = require("ranger-nvim")
ranger_nvim.setup({
    enable_cmds = false,
    replace_netrw = true,
    keybinds = {
        ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
        ["oh"] = ranger_nvim.OPEN_MODE.split,
        ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
        ["or"] = ranger_nvim.OPEN_MODE.rifle,
    },
    -- ui = {
    --     border = "none",
    --     height = 1,
    --     width  = 1,
    --     x      = 0.5,
    --     y      = 0.5,
    -- }
})

-- use leader key shift and f to open ranger in a new tab 'old' plugin
-- vim.api.nvim_set_keymap("n", "<leader><S-F>", ":RangerNewTab<CR>", { noremap = true })
