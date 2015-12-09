keyboard = {}

keys = {}
old_keys = {}
heldKeys = {}

function keyboard.update(k)
    old_keys = keys
    keys = k
end

function keyboard.isPressed(key)
    if keys[key] ~= nil and old_keys[key] == nil then
        return true
    end
    return false
end

function keyboard.isHeld(key)

    if love.keyboard.isDown(key) then
        return true
    end

    --if keys[key] ~= nil and old_keys[key] ~= nil then
    --    return true
    --end
    return false
end

function keyboard.isAnyPressed(...)
    for i,v in ipairs({...}) do
        if keys[v] ~= nil and old_keys[v] == nil then
            return true
        end
    end
    return false
end

function keyboard.isAnyHeld(...)
    for i,v in ipairs({...}) do
        if keys[v] ~= nil and old_keys[v] ~= nil then
            return true
        end
    end

    return false
end
