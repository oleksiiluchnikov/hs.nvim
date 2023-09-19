local M = {}

function M.setup()
    vim.notify("Hammerspoon is loading")
end

function M.cmd(cmd)
    local hs_cmd = "hs -c '" .. cmd .. "'"
    local system_obj = vim.fn.systemlist(hs_cmd)
    return system_obj[1]
end

function M.console()
    M.cmd("hs.openConsole()")
end

local function configdir()
    local output = M.cmd("hs.configdir()")
    return output and string.gsub(output, "\n", "")
end

function M.config()
    local config_dir = configdir()
    if config_dir then
        vim.cmd = "edit " .. config_dir .. "/init.lua"
    end
end

function M.inspect(args)
    local query = args.args
    local cmd = "hs.inspect.inspect(" .. query .. ")"
    local output = M.cmd(cmd)

    if output == nil then
        return
    end

    if string.len(output) > 1000 then
        output = string.sub(output, 1, 1000) .. "..."
    end

    vim.notify(output)
end

function M.reload()
    M.cmd("hs.reload()")
end

function M.notify(options)
    local title = options.title or "Neovim"
    local message = options.message or ""
    local timeout = options.timeout or 5
    local hs_cmd = "hs.notify.new({title='" .. title .. "', informativeText='" .. message .. "'}):send()"
    M.cmd(hs_cmd)
end

function M.source(file)
    local cmd = "dofile('" .. file .. "')"
    M.cmd(cmd)
end

return M
