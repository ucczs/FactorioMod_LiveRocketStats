
-- returns time string between two ticks
local function getTimeString(firstTick, secondTick)
    local ticksRemaining = secondTick - firstTick

    local hours = math.floor(ticksRemaining / 216000)
    local hoursStr = string.format("%02d", hours)
    ticksRemaining = ticksRemaining % 216000

    local minutes = math.floor(ticksRemaining / 3600)
    local minutesStr = string.format("%02d", minutes)
    ticksRemaining = ticksRemaining % 3600

    local seconds = math.floor(ticksRemaining / 60)
    local secondsStr = string.format("%02d", seconds)

    local resultStr = hoursStr .. ":" .. minutesStr .. ":" .. secondsStr
    return resultStr
end


function rocket_launched(event)

    if not global.lastRocketLaunchTick then global.lastRocketLaunchTick = 0 end

    game.play_sound({path="utility/achievement_unlocked"})

    local totalNumberOfRockets = game.forces.player.rockets_launched
    game.print("Total number of launched rockets: " .. tostring(totalNumberOfRockets))

    local timeStr = getTimeString(global.lastRocketLaunchTick, game.ticks_played)
    game.print("Time since last rocket launch: " .. timeStr)

    global.lastRocketLaunchTick = game.ticks_played

end


local events = {defines.events.on_rocket_launched}
-- local events = {defines.events.on_built_entity}
script.on_event(events, rocket_launched)
