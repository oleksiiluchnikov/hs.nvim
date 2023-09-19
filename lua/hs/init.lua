local M = {}

function M.setup()
    print("Hammerspoon is installed")
end

return setmetatable({}, {
    __index = function(_, k)
        if M[k] then
            return M[k]
        else
            return require("hs." .. k)
        end
    end,
})
