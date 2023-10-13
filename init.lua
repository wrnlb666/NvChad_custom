local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})


-- insert behavior
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.clipboard = "unnamedplus"

-- default shell
vim.opt.shell = 'zsh'

-- git branches
vim.api.nvim_set_keymap('n', '<leader>co', '<cmd>Telescope git_branches<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'D', '"_d', {noremap = true})


-- nvim tree automatic behavior
vim.api.nvim_exec([[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'cd '.argv()[0] | execute 'NvimTreeToggle' argv()[0] | endif
]], false)

vim.api.nvim_exec([[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | execute 'NvimTreeToggle' | endif
]], false)

vim.api.nvim_exec([[
  autocmd BufEnter * if (winnr('$') == 1 && &filetype == 'NvimTree') | q | endif
]], false)



-- add `.templ` file extension
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})




local treesitter = require("lazy").load { plugins = {"nvim-treesitter"} }
parser_config = treesitter.parsers.get_parser_configs()
vim.treesitter.language.register('templ', 'templ')
