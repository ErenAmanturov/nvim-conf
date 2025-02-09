local function create_config_file()
  local config_content = [[
  {
    "typeCheckingMode": "off",
    "reportMissingImports": "none",
    "reportUnusedVariable": "none",
    "reportGeneralTypeIssues": "none"
  }
  ]]
  local cwd = vim.fn.getcwd()

  local file_path  = cwd .. "/pyrightconfig.json"

  local file = io.open(file_path, "w")
  if file then
    file:write(config_content)
    file:close()
    print("Pyright config file has been created at " .. file_path)
  else
    print("Failed to create a file")
  end
end

return create_config_file
