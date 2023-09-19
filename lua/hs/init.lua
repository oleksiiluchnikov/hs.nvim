local M = {}

local ipc = require("hs.ipc")

function M.setup()
    vim.notify("Hammerspoon is loading")
    ipc.setup()
end

return M
