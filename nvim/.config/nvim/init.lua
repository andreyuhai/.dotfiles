require("user")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

PreWriteGroup = augroup('PreWriteGroup', {})

autocmd({"BufWritePre"}, {
    group = PreWriteGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
