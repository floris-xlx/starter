require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- telescope (fuzzy finder)
vim.api.nvim_set_keymap('n', '<A-q>', ':Telescope find_files<CR>', {noremap = true, silent = true})


-- rust 
vim.api.nvim_set_keymap('n', '<A-r>', ':!cargo run<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-t>', ':!cargo test<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-d>', ':!cargo doc<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<A-s>', ':write<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Right>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Left>', ':bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Up>', ':bp<bar>sp<bar>bn<bar>bd<CR>', {noremap = true, silent = true})

-- splitting windows (first 2 seem broken)
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-h>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-l>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-p>', ':vsplit<CR>', {noremap = true, silent = true})


-- deleting a line
vim.api.nvim_set_keymap('i', '<M-Del>', '<C-o>dd', {noremap = true, silent = true})

-- go to end or start of line
vim.api.nvim_set_keymap('n', '<S-Left>', '0', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-Right>', '$', {noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<S-Left>', '<C-o>0', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<S-Right>', '<C-o>$', {noremap = true, silent = true})


-- rust custom doc templates
-- lua/configs/templates/rust_fn_doc.txt
-- Define the function and setup the keybinding in a single Lua block
vim.api.nvim_exec([[
function! ReadRustFnDoc()
    let content = readfile(expand("/home/floris/rust_fn_doc.txt"))
    call append(line('.'), content)
endfunction

nnoremap <M-]> :call ReadRustFnDoc()<CR>
]], false)


