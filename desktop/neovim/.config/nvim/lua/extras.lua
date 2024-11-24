-- Set the host python3 path
vim.g.python3_host_prog = vim.fn.substitute(vim.fn.system('which python3'), '\n$', '', '\'\'')
