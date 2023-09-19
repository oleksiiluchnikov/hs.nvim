local M = {}

local Health = require("hs.health")

function M.setup()
    if not Health.check({ checkhealth = false, loaded = false }) then
        return
    end

    print("Hammerspoon is installed")
end

return M
