-- function opponentNoteHit()
--    health = getProperty('health')
--    if curStep >= 688 and curStep < 1344 then
--     if getProperty('health') > 0.1 then
--        setProperty('health', health- 0.025);
-- 	end
--    elseif curStep >= 1344 or curStep < 40 then
--    if getProperty('health') > 0.1 then
--        setProperty('health', health- 0);
-- 	end
--    else  
--     if getProperty('health') > 0.1 then
--        setProperty('health', health- 0.05);
-- 	end
--    end
-- end

-- function goodNoteHit()
--    health = getProperty('health')
--    if curStep >= 688 then
--       if getProperty('health') > 0.1 then
--        setProperty('health', health+ 0.075);
--       end
--    else  
--     if getProperty('health') > 0.1 then
--        setProperty('health', health+ 0.05);
-- 	end
--    end
-- end

function onCreate()
   makeLuaSprite('dead', 'bg/floweyDead', -75, -40);
   setScrollFactor('dead', 0, 0);
   scaleObject('dead', 1.125, 1.125);

   -- makeLuaSprite('light', 'bg/flashlight', -75, -40);
   -- setScrollFactor('light', 0, 0);
   -- scaleObject('light', 1.125, 1.125);
   -- addLuaSprite('light',true);
end

function onUpdate(elasped)
   health = getProperty('health')
   if curStep >= 784 then
      if getProperty('health') > 0.1 then
       setProperty('health', 0.125);
      end

      addLuaSprite('dead',true);
   end
end

function onSongStart()
   -- cameraFade('hud', 'FFFFFF', '3', false)
end
