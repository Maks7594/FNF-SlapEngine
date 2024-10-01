function onCreate()
    lightsOff()
end

function onStepHit()
    if curStep == 128 then
        flash()
        lightsOn()
    elseif curStep == 1280 then
        flash()
        blackOut()
    end
end

function onBeatHit()
    if curBeat >= 32 and curBeat < 96 then
        addCamZoom(0.05)
    end
end

function flash()
    makeLuaSprite('flash', '', 0, 0)
    makeGraphic('flash', 3840, 2160, 'ffffff')
    screenCenter('flash')
    setObjectCamera('flash', 'other')
    setProperty("flash.alpha", 1)
    setObjectOrder('flash', 3)
    addLuaSprite('flash', true)
    doTweenAlpha('flashFade', 'flash', 0, 0.5, 'linear')
end

function lightsOff()
    setProperty('dad.color', getColorFromHex('000000'))
    setProperty('boyfriend.color', getColorFromHex('000000'))
    setProperty('gf.color', getColorFromHex('000000'))
    setProperty('bg.color', getColorFromHex('202020'))
    setProperty('iconP1.color', getColorFromHex('000000'))
    setProperty('iconP2.color', getColorFromHex('000000'))
end

function lightsOn()
    setProperty('dad.color', getColorFromHex('ffffff'))
    setProperty('boyfriend.color', getColorFromHex('ffffff'))
    setProperty('gf.color', getColorFromHex('ffffff'))
    setProperty('bg.color', getColorFromHex('ffffff'))
    setProperty('iconP1.color', getColorFromHex('ffffff'))
    setProperty('iconP2.color', getColorFromHex('ffffff'))
end

function blackOut() -- used at the very end
    makeLuaSprite('black', nil, 0, 0)
    makeGraphic('black', screenWidth * 2, screenHeight * 2, '000000')
    setObjectCamera('black', 'other')
    setProperty('black.alpha', 1)
    setObjectOrder('black', 2)
    addLuaSprite('black', true)
    screenCenter('black')
end

function addCamZoom(value) -- zooms the camera temporarily
    setProperty("camGame.zoom", getProperty("camGame.zoom") + value)
end

function setCamZoom(value1) -- zooms the camera forever ()
    triggerEvent('Set Camera Zoom', value1, 0)
end

-- Made by yours truly, Maximized