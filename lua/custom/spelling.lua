local M = {}

function M.setup()
  local group = vim.api.nvim_create_augroup('edit_text', { clear = true })

  vim.api.nvim_create_autocmd({ 'FileType' }, {
    group = group,
    pattern = { 'gitcommit', 'markdown', 'txt' },
    desc = 'Enable spell checking and text wrapping for certain filetypes',
    callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.spell = true
    end,
  })

  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile', 'BufEnter' }, {
    group = group,
    pattern = { '*' },
    desc = 'Enable spell checking and text wrapping for new or no filetype files and new buffers',
    callback = function()
      if vim.bo.filetype == '' or (vim.fn.line '$' == 1 and vim.fn.getline(1) == '') then
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
      end
    end,
  })
end

return M
