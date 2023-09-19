local M = {}

function M.setup()
    print("Hammerspoon is installed")
end

-- Metatable to handle dynamic function delegation
return setmetatable({}, {
    __index = function(_, k)
        -- Check if method exists in M table
        if M[k] then
            return M[k]
        else
            -- Safely try to require from 'hs' namespace
            local success, module = pcall(require, "hs." .. k)
            if success then
                return module
            else
                -- Handle error (e.g., log it, or return a default function)
                return nil
            end
        end
    end,
})
