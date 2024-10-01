local dbg = true -- Instead of score, useful information for developers. Default value = false
local foreverRating = 'N/A' -- Initialize the forever engine rating string

function round(x, n) -- https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

function onCreate()
    makeLuaText('foreverEngine', 'FOREVER ENGINE v0.3.1', 0, 0, 0)
    setTextSize('foreverEngine', 16)
    setTextAlignment('foreverEngine', 'right')

    setTextAlignment('buildText', 'right')

    makeLuaText('songTxt', '- ' .. songName .. ' (' .. difficultyName .. ') -')
    setTextSize('songTxt', 26)
    screenCenter('songTxt', 'x')
    
    if not downscroll then
        setProperty('songTxt.y', 20)
    else    
        setProperty('songTxt.y', 680)  
    end
    
    setProperty('foreverEngine.x', screenWidth - getProperty('foreverEngine.width') - 10)
    setProperty('foreverEngine.y', 10)

    setProperty('foreverEngine.alpha', 0.5)

    addLuaText('foreverEngine')
    addLuaText('songTxt')
end

function onUpdate(elapsed)
    doTweenAlpha('timeBarTween1', 'timeBarBG', 0, 0.001)
    doTweenAlpha('timeBarTween2', 'timeBar', 0, 0.001)
    doTweenAlpha('timeBarTween3', 'timeTxt', 0, 0.001)
    
    if dbg then
        dbgTreatment()
    else
        normalTreatment()
    end

    if rating == 1 and misses == 0 then
        foreverRating = 'Bloxxed!!'
    elseif rating < 1 and rating > 0.95 then
        foreverRating = 'Slap!'
    elseif rating <= 0.95 and rating > 0.9 then
        foreverRating = 'A'
    elseif rating <= 0.9 and rating > 0.8 then
        foreverRating = 'B'
    elseif rating <= 0.8 and rating > 0.75 then
        foreverRating = 'C'
    elseif rating <= 0.75 and rating > 0.69 then
        foreverRating = 'D'
    elseif rating == 0.69 then
        foreverRating = 'Nice'
    elseif rating < 0.69 and rating > 0.68 then
        foreverRating = 'F'
    end
end

-- Rating values and their corresponding ratings
-- Bloxxed!, Slap!, A, B, C, D, Nice, F
-- 1, 0.99, 0.95, 0.90, 0.80, 0.75, 0.69, 0.68

function normalTreatment()
    if not botPlay then
        setProperty('scoreTxt.text', 'Score: ' .. score .. ' - Accuracy: ' .. round((getProperty('ratingPercent') * 100), 3) .. '% - Combo Breaks: ' .. misses .. ' - Rank: ' .. foreverRating)
    else
        setProperty('botplayTxt.visible', true)
        setTextString('botplayTxt', 'AUTOPLAYER')
        setProperty('scoreTxt.text', '')
        setProperty('botplayTxt.y', 150)
    end
end

function dbgTreatment()
    if botPlay then
        setProperty('scoreTxt.text', 'Section: ' .. curSection .. ' | Beat: ' .. curBeat .. ' | Step: ' .. curStep .. ' | BPM: ' .. curBpm .. ' | Botplay: true')
        setProperty('botplayTxt.visible', false)
    else
        setProperty('scoreTxt.text', 'Section: ' .. curSection .. ' | Beat: ' .. curBeat .. ' | Step: ' .. curStep .. ' | BPM: ' .. curBpm .. ' | Botplay: false\nScore: ' .. score .. ' - Accuracy: ' .. round((getProperty('ratingPercent') * 100), 3) .. '% - Combo Breaks: ' .. misses .. ' - Rank: ' .. foreverRating)
    end
end