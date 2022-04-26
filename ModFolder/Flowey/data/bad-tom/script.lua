local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not seenCutscene and getPropertyFromClass('PlayState','deathCounter') == 0 then --Block the first countdown
		-- if getPropertyFromClass('PlayState','deathCounter') == 0 then
			startVideo('sanes cutscene');
		-- end
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

-- function onCreate()
-- 	printDebug(getPropertyFromClass('PlayState','deathCounter'));
-- end