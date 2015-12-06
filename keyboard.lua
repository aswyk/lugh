keyboard = {}

keys = {}
old_keys = {}

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
    if keys[key] ~= nil and old_keys[key] ~= nil then
        return true
    end
    return false
end
