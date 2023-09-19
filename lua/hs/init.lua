local M = {}

function M.setup()
    vim.notify("Hammerspoon is loading")
end

function M.configdir()
    local hs_configdir = vim.fn.system("hs -c 'hs.configdir'")
    local cmd = "edit " .. hs_configdir
    vim.cmd(cmd)
end

return M
