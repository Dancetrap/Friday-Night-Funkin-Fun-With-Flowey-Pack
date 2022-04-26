function onCreate()
-- if daSong == "but-nobody-came" then
--     middlescroll = true;
-- end

end

-- function onSongStart()
--     if songName == 'but-nobody-came' then
--     noteTweenX('oppo0', 0, -1000, 1.5, 'quartInOut')
--     noteTweenX('oppo1', 1, -1000, 1.5, 'quartInOut')
--     noteTweenX('oppo2', 2, -1000, 1.5, 'quartInOut')
--     noteTweenX('oppo3', 3, -1000, 1.5, 'quartInOut')
--     noteTweenX('play0', 4, 415, 1, 'quartInOut')
--     noteTweenX('play1', 5, 525, 1, 'quartInOut')
--     noteTweenX('play2', 6, 635, 1, 'quartInOut')
--     noteTweenX('play3', 7, 745, 1, 'quartInOut')
--     end
-- end

function onUpdate(elapsed)
    if songName == 'but-nobody-came' then
    -- setPropertyFromClass('ClientPrefs', 'middleScroll',true)
        for i=0,3 do
        -- Alpha is 0 (0 being invisible)
        noteTweenAlpha(i+16, i, math.floor(curStep/9999), 0.3)
        noteTweenAlpha(i+16, i, math.floor(curStep/9999), 4-7)
        end
        -- noteTweenX('oppo0', 0, -1000, 1.5, 'quartInOut')
        -- noteTweenX('oppo1', 1, -1000, 1.5, 'quartInOut')
        -- noteTweenX('oppo2', 2, -1000, 1.5, 'quartInOut')
        -- noteTweenX('oppo3', 3, -1000, 1.5, 'quartInOut')
        -- noteTweenX('play0', 4, 415, 1, 'quartInOut')
        -- noteTweenX('play1', 5, 525, 1, 'quartInOut')
        -- noteTweenX('play2', 6, 635, 1, 'quartInOut')
        -- noteTweenX('play3', 7, 745, 1, 'quartInOut')
        -- noteTweenY('oppo0', 0, -1000, 1.5, 'quartInOut')
        -- noteTweenY('oppo1', 1, -1000, 1.5, 'quartInOut')
        -- noteTweenY('oppo2', 2, -1000, 1.5, 'quartInOut')
        -- noteTweenY('oppo3', 3, -1000, 1.5, 'quartInOut')
        -- setPropertyClass('ClientPrefs', 'downScroll',true)
    end
end

-- function onMoveCamera(focus)
-- 	if focus == 'boyfriend' then
-- 	noteTweenX("NoteMove1", 0, 0, 0.2, cubeInOut)
-- 	noteTweenX("NoteMove2", 1, 112, 0.2, cubeInOut)
-- 	noteTweenX("NoteMove3", 2, 1063, 0.2, cubeInOut)
-- 	noteTweenX("NoteMove4", 3, 1175, 0.2, cubeInOut)

--         noteTweenAlpha("NoteAlpha1", 0, 0.8, 0.4, linear)
--         noteTweenAlpha("NoteAlpha2", 1, 0.8, 0.4, linear)
--         noteTweenAlpha("NoteAlpha3", 2, 0.8, 0.4, linear)
--         noteTweenAlpha("NoteAlpha4", 3, 0.8, 0.4, linear)
-- 	elseif focus == 'dad' then
-- 	noteTweenX("NoteMove5", 0, 410, 0.2, cubeInOut)
-- 	noteTweenX("NoteMove6", 1, 525, 0.2, cubeInOut)
-- 	noteTweenX("NoteMove7", 2, 637, 0.2, cubeInOut)
-- 	noteTweenX("NoteMove8", 3, 749, 0.2, cubeInOut)

--         noteTweenAlpha("NoteAlpha13", 0, 0.2, 0.4, linear)
--         noteTweenAlpha("NoteAlpha14", 1, 0.2, 0.4, linear)
--         noteTweenAlpha("NoteAlpha15", 2, 0.2, 0.4, linear)
--         noteTweenAlpha("NoteAlpha16", 3, 0.2, 0.4, linear)
-- 	end
-- end