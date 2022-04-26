local isHit = false;

function onCreate()
    -- setProperty('hideHud',true);
    -- setPropertyFromClass('ClientPrefs','downScroll',true);
    setPropertyFromClass('ClientPrefs','middleScroll',true); 

    if difficulty == 0 then
        -- triggerEvent("Change Character", "dad", "flowey-pissed")
        -- triggerEvent("Change Character", "BF", "bf")
        -- doTweenX('cool', 'boyfriend', -200, 0, 'linear')

    end
end

function onSongStart()
    setProperty('camHUD.visible', true);
end

function onDestroy()
    -- setPropertyFromClass('ClientPrefs','downScroll',false);
    setPropertyFromClass('ClientPrefs','middleScroll',false);
end

function onEndSong()
    -- setPropertyFromClass('ClientPrefs','downScroll',false);
    setPropertyFromClass('ClientPrefs','middleScroll',false);
    unlockSong('fear');
end
