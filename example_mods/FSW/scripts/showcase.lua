showcase = false -- Hides some UI elements. Best used with Botplay

function onCreate()
    if showcase then
        setProperty('healthBar.alpha', 0)
        setProperty('healthBarBG.alpha', 0)
        
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
        
        setProperty('grpNoteSplashes.visible', false)
    else
        return
    end
end

function onUpdate(elapsed)
    if showcase then
        setProperty('scoreTxt.text', '')
    else
        return
    end
end

function onSpawnNote(id, direction, noteType, isSustainNote)
    if showcase then
        setPropertyFromGroup('notes', id, 'noteSplashDisabled', true)
    else
        return
    end
end