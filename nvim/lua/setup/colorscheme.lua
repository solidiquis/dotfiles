		--bold
		--underline
		--underlineline	double underline
		--undercurl	curly underline
		--underdot	dotted underline
		--underdash	dashed underline
		--strikethrough
		--reverse
		--inverse		same as reverse
		--italic
		--standout
		--nocombine	override attributes instead of combining them
		--NONE		no attributes used (used to reset it)

require("nightfox").setup({
  options = {
    styles = {
      comments = "NONE",
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    }
  }
})

vim.cmd [[ colorscheme duskfox ]]
