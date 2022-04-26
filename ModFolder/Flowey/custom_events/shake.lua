function onEvent(name, value1, value2)
    if name == "shake" then
    cameraShake("game",value1,value2);
    cameraShake("hud",value1,value2);
    end
end