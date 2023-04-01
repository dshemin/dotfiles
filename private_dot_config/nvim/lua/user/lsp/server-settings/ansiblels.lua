local cwd = vim.fn.getcwd()

local venv_path = cwd .. "/venv/bin"

local function checkExecutable(required, fallback)
  if (os.execute("command -v " .. required) == 0)
  then
    return required
  end
  return fallback
end

local ansible_path = checkExecutable(venv_path .. "ansible", "ansible")
local ansible_lint_path = checkExecutable(venv_path .. "ansible-lint", "ansible-lint")

return {
  settings = {
    ansible = {
      ansible = {
        path = ansible_path,
      },
      executionEnvironment = {
        enabled = false,
      },
      python = {
        interpreterPath = "python"
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = ansible_lint_path
        }
      }
    }
  },
}
