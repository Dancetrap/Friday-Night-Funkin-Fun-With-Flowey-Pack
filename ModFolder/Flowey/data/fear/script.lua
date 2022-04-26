local i = 1;
local j = 1;

function onCreate()
    -- makeLuaSprite('background','bg/black',-72,-40.5);
    -- makeLuaSprite('background','bg/blackBackground',-72,-40.5);
    makeAnimatedLuaSprite('background','bg/fearOpening',-0.5,0)
    -- addAnimationByPrefix('background', 'start', 'start', 5, false)
    addAnimationByPrefix('background', 'begin', 'fearOpening idle', 5, false)
    setObjectCamera('background','hud');
    setScrollFactor('background', 0, 0);
    addLuaSprite('background',true);

    -- Group of menu assets
    setProperty('iconP1.alpha', 0);
    setProperty('iconP2.alpha', 0);
    setProperty('healthBar.alpha', 0);
    setProperty('scoreTxt.alpha',0);
    setProperty('timeBar.visible',false)
    setProperty('timeBarBG.visible',false)
    setProperty('timeTxt.visible',false)
    -- setProperty('botplayTxt.alpha',0);

    -- noteTweenAlpha('note 0', 0, 0, 30, 'linear');
    
    -- setProperty('timeTxt.alpha',0);
    -- noteTweenX("NoteMove1", 0, -1000, 0.5, cubeInOut)
	-- noteTweenX("NoteMove2", 1, -1000, 0.5, cubeInOut)
	-- noteTweenX("NoteMove3", 2, -1000, 0.5, cubeInOut)
	-- noteTweenX("NoteMove4", 3, -1000, 0.5, cubeInOut)

    setProperty('skipCountdown', true);
    -- precacheImage("bg/black");
end

function onSongStart()
    objectPlayAnimation('background', 'begin');
    setPropertyFromClass('timeBar.alpha',0);
end

function onUpdate()
-- setProperty('timeBar.visible',false);
    if curStep < 27 then
        for i=0,7 do
        noteTweenAlpha(i+0, i, 0, 0.3)
        end
    else
        for i=0,7 do
        noteTweenAlpha(i+0, i, 1, 0.3)
        end
    end
    if curStep >= 20 and curStep < 27 then
        i = i - 0.025
        j = j - 0.25
        setProperty('background.alpha', i)
    end

    if curStep == 22 then
        doTweenZoom('zoom', 'camGame', 1.5, 1, 'expoInOut')
        doTweenZoom('zoomHud', 'camHUD', 2, 1, 'expoInOut')
        
    end

    if curStep == 25 then
        removeLuaSprite('background')
    end

    if curStep == 27 then
        setProperty('camHUD.visible', true);
        setProperty('camHUD.alpha', 1);
        setProperty('iconP1.alpha', 1);
        setProperty('iconP2.alpha', 1);
        setProperty('healthBar.alpha', 1);
        setProperty('scoreTxt.alpha',1);
        setProperty('timeBar.visible',true)
        setProperty('timeBarBG.visible',true)
        setProperty('timeTxt.visible',true)
        -- setProperty('botplayTxt.alpha',1)
    end
end