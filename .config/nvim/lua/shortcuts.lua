----------------------
-- Defualt shortcuts --
-----------------------
vim.keymap.set("i", "<C-n>", "<C-x><C-n>", { desc = "Autocomplete in insert mode" })

------------------------------
-- Copy current's file info --
------------------------------
vim.keymap.set("n", "<leader>cfp", ":let @+ = expand(\"%\")<CR>", { desc = "Copy current file's fullpath to clipboard" })
vim.keymap.set("n", "<leader>cfn", ":let @+ = expand(\"%:t\")<CR>", { desc = "Copy current file's name to clipboard" })
vim.keymap.set("n", "<leader>cfN", ":let @+ = expand(\"%:t:r\")<CR>", { desc = "Copy current file's name (without extension) to clipboard" })
vim.keymap.set("n", "<leader>cfe", ":let @+ = expand(\"%:e\")<CR>", { desc = "Copy current file's extension to clipboard" })

-- Insert string --
-------------------
vim.keymap.set('n', '<Leader>id', function() vim.api.nvim_put({os.date('%Y-%m-%d')}, 'c', true, true) end, { desc = "Insert current date in the ISO 8601 format" })

-----------------
-- Note taking --
-----------------
vim.keymap.set("n", "<leader>ni", ":e /home/isma/Personal/MyNotes/index.md<CR>", { desc = "Open my note's index" })
vim.keymap.set("n", "<leader>nv", ":let outputfile='/tmp/a.pdf' | execute ':! pandoc % -o ' . outputfile . ' && firefox ' . outputfile<CR>", { desc = "View current .md file as PDF (using pandoc)" })
vim.keymap.set('n', '<leader>nn', function()
  local title = vim.fn.input('Enter new note\'s filename: ')
  if filename == '' then
    print('Aborted: No file name provided.')
    return
  end
  local filename = title:gsub(' ', '_')
  local timestamp = os.date('%Y%m%d%H%M')
  local fullpath = string.format('%s/Personal/MyNotes/%s-%s.md', vim.fn.expand('~'), timestamp, filename)
  vim.fn.writefile({"# " .. title}, fullpath)
  vim.cmd('edit ' .. fullpath)
end, {  desc = "Create a new note in my ZK (format: YYYYMMDDhhmm-<title>)" })

--------------
-- Neo-tree --
--------------
vim.keymap.set("n", "<C-f>", ":Neotree toggle right<CR>", { desc = "Open the file browser" })

----------------
-- Lsp-config --
----------------
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Know more about what is hovered" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Jump to code definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Jump to code references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Act on code under cursor" })

-------------
-- None-ls --
-------------
vim.keymap.set("n", "<Leader>fc", vim.lsp.buf.format, { desc = "Format code" })

----------
-- Tmux --
----------
vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>", { desc = "Move focus to LEFT window" })
vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>", { desc = "Move focus to DOWN window" })
vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>", { desc = "Move focus to UP window" })
vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>", { desc = "Move focus to RIGHT window" })

---------------
-- Telescope --
---------------
--- Find file
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find file" })
vim.keymap.set("n", "<leader>fd", ":cd %:p:h<CR>:Telescope find_files<CR>", { desc = "Find file (based on the current's file working directory)" })
--- grep
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Find grep" })
vim.keymap.set("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "'grep' in the current file" })

---------
-- Oil --
---------
vim.keymap.set("n", "<Leader>o", ":Oil --float %:p:h<CR>", { desc = "Open oil" })

---------------------
-- Makdown related --
---------------------
vim.keymap.set('n', '<bs>', ':edit #<cr>', { silent = true }) -- Use return to get back from following a link

-------------------------
-- Dedicated shortcuts --
-------------------------
-- Tree sitter                  => Check the "lua/plugins/treesitter.lua" file
-- Completions                  => Check the "lua/plugins/completions.lua" file
-- Treesitter (code selection)  => Check the "lua/plugins/treesitter.lua" file
