vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"haskell"},
  callback = function()
      vim.bo.commentstring = "// %s"
  end
})
