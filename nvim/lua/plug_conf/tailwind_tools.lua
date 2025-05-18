require("tailwind-tools").setup({
  server = {
    settings = {
      experimental = {
        classRegex = { "class\\s*:\\s*\"([^\"]*)" }
      }
    }
  },
})
