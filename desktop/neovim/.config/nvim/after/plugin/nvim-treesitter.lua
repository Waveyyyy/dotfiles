local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "python",
        "toml",
        "json",
        "yaml",
        "markdown",
        "lua",
        "vim",
        "c",
        "cpp",
        "bash",
        "cmake",
        "ocaml",
    },
    sync_install = true,
    autotag = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    autopairs = {
        enable = true,
    }
}
