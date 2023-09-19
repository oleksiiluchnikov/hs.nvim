local M = {}

function M.check(opts)
    opts = opts or {}
    local checkhealth = opts.checkhealth == nil and true or opts.checkhealth

    if not vim.fn.executable("hs") then
        if checkhealth then
            vim.notify("Hammerspoon or hs.ipc.cli not installed", vim.log.levels.ERROR)
        end
        return false
    end
end

return M
