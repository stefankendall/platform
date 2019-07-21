Player = {}
Player.__index = Player
local platypus = require "platypus.platypus"

local ACTION_LEFT = hash("left")
local ACTION_RIGHT = hash("right")
local ACTION_JUMP = hash("jump")
local kWalkSpeed = 600
local kJumpTakeoffPower = 4000;
local kGravity = -6000

function Player:create()
    local this = {}
    setmetatable(this, Player)
    this.platypus = platypus.create({
        collisions = {
            separation = platypus.SEPARATION_SHAPES,
            groups = {
                [hash("ground")] = platypus.DIR_ALL,
            },
            left = 7, right = 7, top = 10, bottom = 10,
        },
        max_velocity = 2000,
        gravity = kGravity,
        allow_double_jump = false,
        allow_wall_jump = false
    })
    return this;
end

function Player:update(go, dt)
    self.platypus.update(dt)
end

function Player:on_message(go, message_id, message)
    self.platypus.on_message(message_id, message)
end

function Player:on_input(go, action_id, action)
    if action_id == ACTION_LEFT then
        self.platypus.left(kWalkSpeed)
    elseif action_id == ACTION_RIGHT then
        self.platypus.right(kWalkSpeed)
    elseif action_id == ACTION_JUMP then
        self.platypus.jump(kJumpTakeoffPower)
    end
end

return Player