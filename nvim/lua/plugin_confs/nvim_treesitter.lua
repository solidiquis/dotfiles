local auto_cmd_group_ts = vim.api.nvim_create_augroup("UserTreeSitterConfig", {})

require("nvim-treesitter").install({
    "bash",
    "css",
    "csv",
    "dockerfile",
    "glsl",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "ruby",
    "rust",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "yaml",
    "zsh",
})

vim.api.nvim_create_autocmd("FileType", {
    group = auto_cmd_group_ts,
    pattern = {
        "bash",
        "css",
        "go",
        "javascript",
        "json",
        "lua",
        "python",
        "html",
        "rust",
        "sql",
        "toml",
        "typescript",
        "yaml",
        "zig",
    },
    callback = function()
        vim.treesitter.start()
        --vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        --vim.wo.foldmethod = "expr"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

