function onEvent(eventName, value1)
    if eventName == "Set Camera Zoom" then
        runHaxeCode([[
            var newZoom:Float = ]]..value1..[[;
            if (Math.isNaN(newZoom))
                newZoom = game.defaultCamZoom;
            game.defaultCamZoom = newZoom;
        ]])
    end
end