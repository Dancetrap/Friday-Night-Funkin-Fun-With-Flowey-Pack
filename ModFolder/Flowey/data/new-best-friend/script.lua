-- isHit = false;
-- local i = 0;

function onCreate()
    setPropertyFromClass('ClientPrefs','middleScroll',false);
    setPropertyFromClass('ClientPrefs','downScroll',false);
end

function onUpdate(elapsed)
--     debugPrint(isHit)
--     if keyJustPressed('space') and not isHit then
--         health = getProperty('health')
--         if getProperty('health') > 0.1 then
--             setProperty('health', health- 0.625);
-- 	    end
        
--         -- debugPrint('testing')
--         isHit = true
--         -- debugPrint(isHit)
        
--     end

--     if isHit then
--     i = i + 1
--         if i == 5 then
--             endSong()
--             i = 0
--         end
--     end

    -- setPropertyFromClass('ClientPrefs','middleScroll',false);
    -- setPropertyFromClass('ClientPrefs','downScroll',false);

end

-- local allowEnd = false
-- function onEndSong()
-- if not allowEnd and isStoryMode and not seenCutscene then
-- 		setProperty('inCutscene', true);
--         if isHit then
-- 		    startDialogue('dialogueB', 'breakfast');
--         else
--             startDialogue('dialogueA', 'breakfast');
--         end
-- 		allowEnd = true;
-- 		return Function_Stop;
-- 	end
-- 	return Function_Continue;
-- end