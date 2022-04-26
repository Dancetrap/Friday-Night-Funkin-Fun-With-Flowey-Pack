local i = 0;
local j = 1;
local loop = false;

function onCreate()

    -- makeAnimatedLuaSprite('background','bg/fearOpening',-0.5,0)
    -- -- addAnimationByPrefix('background', 'start', 'start', 5, false)
    -- addAnimationByPrefix('background', 'begin', 'fearOpening idle', 5, false)
    -- setObjectCamera('background','hud');
    -- setScrollFactor('background', 0, 0);
    -- addLuaSprite('background',true);
    
    -- setProperty('camHUD.alpha',j);

    makeAnimatedLuaSprite('static','bg/vcr',0,0)
    addAnimationByPrefix('static', 'glitch', 'vcr', 24, false)
    setGraphicSize('static', 1.1, 1.1)
    setScrollFactor('static', 0, 0);
    setObjectCamera('static','hud');
    addLuaSprite('static',true);
    addVCREffect('HUD');
    
    setProperty('skipCountdown', true);
end

function onBeatHit()
	-- triggered 4 times per section
if curStep < 335 then
    if curBeat % 2 == 0 then
        doTweenZoom('zoom', 'camGame', 1.5, 3, 'linearInOut');
    end
end
end

function onUpdate(elasped)
    addLuaSprite('static',true);

    if curStep == 533 then
        doTweenZoom('zoom', 'camGame', 2, 0.25, 'expoInOut');
        -- runTimer('zoom');
    elseif curStep == 536 then
        doTweenZoom('zoom', 'camGame', 3, 0.25, 'expoInOut');
    elseif curStep == 335 then
        doTweenZoom('zoom', 'camGame', 3, 3, 'expoInOut');
        doTweenZoom('zoomCam', 'camHUD', 3, 3, 'expoInOut');
    elseif curStep >= 750 then
        if curBeat % 2 == 0 then
            doTweenZoom('zoom', 'camGame', 3, 3, 'bounceInOut');
        end
    end

    -- doTweenZoom('cameraZoom', 'camGame', 1.25, 2, 'elasticOut');
    -- if curStep == 534 then
    --     doTweenZoom('cameraZoom', 'camGame', 1.25, 2, 'elasticOut');
    -- elseif curStep == 536 then

    -- elseif curStep == 5 then
    --     doTweenZoom('cameraZoom', 'camGame', 1.25, 1, 'elasticInOut');
    --     doTweenZoom('hudZoom', 'camHUD', 1.25, 1, 'elasticInOut');
    -- elseif curStep == 7 then
    --     doTweenZoom('cameraZoom', 'camGame', 1.5, 2, 'elasticInOut');
    --     doTweenZoom('hudZoom', 'camHUD', 1.5, 2, 'elasticInOut');
    -- end

    if curStep >= 312 and curStep < 360 then
        if loop then
            j = j + 0.1;
            if(j >= 1)then
                loop = false;
            end
        else
            j = j - 0.1;
            if(j <= 0)then
                loop = true;
            end
        end
        setProperty('camHUD.alpha',j);
    end
    
    if curStep == 360 then
        setProperty('camHUD.alpha',1);
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if curStep >= 360 then
	    makeLuaText(i, 'thank,', 200, math.random(-250,1280), math.random(-250,720));
        setTextFont(i, '8bitoperator.ttf');
        setTextSize(i,40);
        setTextBorder(i, 3, '000000')
        addLuaText(i);
        i = i + 1;
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if curStep >= 360 then
        a = i - 1;
        removeLuaText(a);
        removeLuaText(i);
        i = i - 2;
        -- removeLuaText(i);
        -- i = i - 1;
    end
end