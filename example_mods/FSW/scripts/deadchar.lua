-- Changes the dead character from bf-dead to boogieboy-dead

function onCreate()
    if songName == "Start Trouble" or songName == "Slapmaster" or songName == "Suprise" then
        setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'boogieboy-oofed');
    elseif songName == "Week 2 Song 1" or songName == "Week 2 Song 2" or songName == "Week 2 Song 3" then
        -- placeholder
    end
end