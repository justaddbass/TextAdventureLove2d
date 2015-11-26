Room = {enter_text = "", items = {}, actions = {}}
room_arr = {{{}}}

function Room:new(o, x, y, z, items, actions)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.items = items
    self.actions = actions
    room_arr[x][y][z] = self
    return o
end

function world.getRoom(x, y, z)

end
