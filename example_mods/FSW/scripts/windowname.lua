-- This script changes the window name to:
-- Friday Slappin' Showdown: Song Name (Difficulty)
-- for example
-- Friday Slappin' Showdown: Start Trouble (Hard)

--- @param elapsed float   

function onUpdate(elapsed)
    setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Slappin' Showdown: ".. songName .." (".. difficultyName ..")")
end
