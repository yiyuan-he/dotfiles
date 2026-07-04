-- Stop the built-in C ftplugin from auto-continuing comments
--   r = continue comment after <Enter> in insert mode
--   o = continue comment after o/O
vim.opt_local.formatoptions:remove({ "r", "o" })
