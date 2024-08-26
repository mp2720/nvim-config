vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.c", "*.h", "*.cxx", "*.hpp", "*.cpp", "*.go", "*.rust"},
  callback = function()
      vim.bo.commentstring = "// %s"
  end
})
