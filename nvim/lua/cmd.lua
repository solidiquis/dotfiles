local alias = require("utils.cmd").alias
local window = require("utils.window")

-- Moves cursor to selected file's position in file tree.
function nt_find()
  vim.api.nvim_command("NvimTreeFindFile")
end
alias("nt_find", "F")

-- Takes the current line and moves it to the end of the line immediately above it.
function line_up()
  local seq = vim.api.nvim_replace_termcodes(
    "^dg_k$A <Esc>pjdd",
    true,
    false,
    true
  )
  vim.api.nvim_feedkeys(seq, "n", false)
end
alias("line_up", "LU")

-- Transforms current word under cursor to snake case
function to_snake()
  textcase.current_word('to_snake_case')
end
alias("to_snake", "ToSnake")

-- Transforms current word under cursor to camel case
function to_camel()
  textcase.current_word('to_camel_case')
end
alias("to_camel", "ToCamel")

-- Transforms current word under cursor to pascal case
function to_pascal()
  textcase.current_word('to_pascal_case')
end
alias("to_pascal", "ToPascal")

-- Collapses visually selected lines into one line with optional seperator.
function collapse(sep)
  local data = window.visual_get_lines()
  local lines = data.lines
  local start_ln = data.start_ln
  local end_ln = data.end_ln

  local result = ""

  lines[1] = string.gsub(lines[1], "[ \t]+%f[\r\n%z]", "")

  for i=2, #lines do
    lines[i], _ = string.gsub(lines[i], "^%s*(.-)%s*$", "%1")
  end

  if sep then
    for i=1,#lines-1 do
      result = result .. lines[i]
      result = result .. sep
    end

    result = result .. lines[#lines]
  else
    for i=1,#lines do
      result = result .. lines[i]
    end
  end
  vim.api.nvim_buf_set_lines(0, start_ln, end_ln, true, { result })

  local curr_row = vim.api.nvim_win_get_cursor(0)[1]
  local curr_ln_len = #vim.api.nvim_get_current_line()
  vim.api.nvim_win_set_cursor(0, { curr_row, curr_ln_len })
end

-- Updates buffer width
function update_buf_width(amnt)
  local current_width = vim.api.nvim_win_get_width(0)
  vim.api.nvim_win_set_width(0, current_width + amnt)
end

-- Updates buffer height
function update_buf_height(amnt)
  local current_height = vim.api.nvim_win_get_height(0)
  vim.api.nvim_win_set_height(0, current_height + amnt)
end

-- Alphabetizes visual selection lines
function alphabetize_lines()
  local data = window.visual_get_lines()

  local lower_byte = function(s)
    return string.byte(string.lower(s))
  end

  local prev_lhs = nil
  local prev_rhs = nil

  local function comparator(a, b)
    local lhs = string.match(a, "%w") or "~"
    local rhs = string.match(b, "%w") or "~"

    if lhs ~= "~" and rhs ~= "~" and lhs == rhs then
      prev_lhs = lhs
      prev_rhs = rhs

      return comparator(
        string.sub(a, 2, #a),
        string.sub(b, 2, #b)
      )

    elseif prev_lhs ~= nil and prev_rhs ~= nil and prev_lhs == prev_rhs then
      prev_lhs = nil
      prev_rhs = nil

      if lhs == "~" and rhs ~= "~" then
        return true
      elseif lhs ~= "~" and rhs == "~" then
        return false
      end
    else
      prev_lhs = nil
      prev_rhs = nil
    end

    return lower_byte(lhs) < lower_byte(rhs)
  end

  table.sort(data.lines, comparator)

  vim.api.nvim_buf_set_lines(0, data.start_ln, data.end_ln, true, data.lines)
end
