local api = vim.api

local function execute(args)
  args = args or {}

  local row = api.nvim_win_get_cursor(0)[1]
  assert(row >= 1)
  local curline = api.nvim_buf_get_lines(0, row - 1, row, true)[1]

  local p = io.popen(curline)
  local stdout = p:read("*a")

  if args.process_stdout then
    stdout = args.process_stdout(stdout)
  end

  local lines, count = {}, 0
  for line in stdout:gmatch("[^\r\n]+") do
    table.insert(lines, line)
    count = count + 1
  end

  api.nvim_buf_set_lines(0, row, row, true, lines)

  if args.prepare_for_next_command then
    local new_row = row + count
    api.nvim_buf_set_lines(0, new_row, new_row, true, { "" })
    api.nvim_win_set_cursor(0, { new_row + 1, 0 })
  end
end

return {
  execute = execute,
}
