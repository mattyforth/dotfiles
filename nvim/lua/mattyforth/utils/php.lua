local M = {}

function M.get_php_path()
  -- Check for .valetphprc
  local file = io.open(".valetphprc", "r")
  if file then
    local version = file:read("*l")
    file:close()
    local path = "/opt/homebrew/opt/php@" .. version .. "/bin/php"
    if vim.fn.executable(path) == 1 then
      return path
    end
  end

  local valet_php = vim.fn.trim(vim.fn.system("valet which-php"))
  
  if valet_php then
    return valet_php
  end

  return vim.fn.trim(vim.fn.system("which php"))
end

return M
