local utils = require("utils")
local alias = utils.alias

-- Toggles NERDTree.
function nt_find()
  vim.api.nvim_command("NvimTreeFindFile")
end
alias("nt_find", "F")

-- Sources init.lua.
function source()
  vim.api.nvim_command("source $MYVIMRC")
end
alias("source", "Source")

-- Cuts current line and appends text without leading whitespace to the line above.
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

-- Copies relative file path of current buffer into clipboard.
function cc_rfp()
  local full_path = vim.api.nvim_buf_get_name(0)
  local cwd = vim.fn.getcwd()
  local rfp = vim.split(full_path, string.format("%s/", cwd))[2]
  local cmd = string.format("printf %s | pbcopy", rfp)
  os.execute(cmd)
  print(rfp)
end
alias("cc_rfp", "CCP")

function inspect(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

function collapse(sep)
  local data = utils.visual_get_lines()
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

function update_buf_width(amnt)
  local current_width = vim.api.nvim_win_get_width(0)
  vim.api.nvim_win_set_width(0, current_width + amnt)
end

function update_buf_height(amnt)
  local current_height = vim.api.nvim_win_get_height(0)
  vim.api.nvim_win_set_height(0, current_height + amnt)
end

-- Alphabetizes visual selection lines
function alphabetize_lines()
  local data = utils.visual_get_lines()

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

function ts()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cursor_row = cursor[1]
  local cursor_col = cursor[2]
  vim.api.nvim_buf_set_text(0, cursor_row - 1, cursor_col, cursor_row - 1, cursor_col, { utils.my_time() })
end
