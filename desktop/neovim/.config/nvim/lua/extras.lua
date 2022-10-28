-- Set the host python3 path
vim.g.python3_host_prog = vim.fn.substitute(vim.fn.system('which python3'), '\n$', '', '\'\'')


-- Ocaml support
vim.g.opamshare = vim.fn.substitute(vim.fn.system('opam var share'), '\n$', '', '\'\'')
vim.opt.rtp:append(vim.inspect(vim.g.opamshare) .. '/merlin/vim')
vim.opt.rtp:prepend('/home/callum/.opam/default/share/ocp-indent/vim')
