-- background

function onCreate()
    precacheImage("slap")
    makeLuaSprite('bg', 'slap', 0, 0)
    addLuaSprite('bg', false)
    scaleObject('bg', 1, 1)
end