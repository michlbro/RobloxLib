local Serialise = {}

function Serialise.CFrame(cframe:CFrame)
    return {cframe:GetComponents()}
end

function Serialise.Vector3(vector3: Vector3)
    return {vector3.X, vector3.Y, vector3.Z}
end

-----------------------------------------------------------

local Deserialise = {}

function Deserialise.CFrame(cframeTable)
    return CFrame.new(table.unpack(cframeTable))
end

function Deserialise.Vector3(vector3Table)
    return Vector3.new(table.unpack(vector3Table))
end

-----------------------------------------------------------

local BasicDataTypes = {}

function BasicDataTypes.number(number)
    return number
end

function BasicDataTypes.string(str)
    return str
end

function BasicDataTypes.boolean(boolean)
    return boolean
end

-----------------------------------------------------------

for dataType, func in BasicDataTypes do
    Serialise[dataType] = func
    Deserialise[dataType] = func
end

return table.freeze({
    Serialise = Serialise,
    Deserialise = Deserialise
})