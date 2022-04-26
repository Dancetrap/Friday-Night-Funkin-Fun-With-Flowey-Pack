function onCreate()
	-- background shit
	
	makeLuaSprite('ground', 'stage/patch', 450, 625);
	setScrollFactor('ground', 0.9, 0.9);
	scaleObject('ground', 1.1, 1.1);
	addLuaSprite('ground', false);

	makeAnimatedLuaSprite('flowers','stage/flowrs',450,500)
	setScrollFactor('flowers', 0.9, 0.9);
	scaleObject('flowers', 0.375, 0.375);
    addAnimationByPrefix('flowers', 'idle', 'Symbol 9 instance 1', 24, true);
	-- addLuaSprite('flowers', false);

	-- sprites that only load if Low Quality is turned off
	-- if not lowQuality then
	-- 	makeLuaSprite('stagelight_left', 'stage_light', -125, -100);
	-- 	setScrollFactor('stagelight_left', 0.9, 0.9);
	-- 	scaleObject('stagelight_left', 1.1, 1.1);
		
	-- 	makeLuaSprite('stagelight_right', 'stage_light', 1225, -100);
	-- 	setScrollFactor('stagelight_right', 0.9, 0.9);
	-- 	scaleObject('stagelight_right', 1.1, 1.1);
	-- 	setProperty('stagelight_right.flipX', true); --mirror sprite horizontally

	-- 	makeLuaSprite('stagecurtains', 'stagecurtains', -500, -300);
	-- 	setScrollFactor('stagecurtains', 1.3, 1.3);
	-- 	scaleObject('stagecurtains', 0.9, 0.9);
	-- end

	-- addLuaSprite('gateway', false);
	-- addLuaSprite('stagefront', false);
	-- addLuaSprite('stagelight_left', false);
	-- addLuaSprite('stagelight_right', false);
	-- addLuaSprite('stagecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end