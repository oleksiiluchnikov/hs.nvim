local function some_function()
    print("Hello World!")
end

local function setup()
    print("Setup")
end

return {
    some_function = some_function,
    setup = setup
}
