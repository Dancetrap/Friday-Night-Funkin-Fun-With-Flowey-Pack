local i = 0;

function onCreate()
	-- background shit

	i = math.random(0,5);
	-- debugPrint(math.random(0,5));

	-- No Mercy Toriel's House

	-- makeLuaSprite('ground', 'stage/horrortale/ground', -2000, 300);
	-- setScrollFactor('ground', 0.9, 0.9);
	-- scaleObject('ground', 3, 3);
	-- addLuaSprite('ground', false);

	-- makeLuaSprite('entrance', 'stage/horrortale/entrance', -1000, -625);
	-- setScrollFactor('entrance', 0.9, 0.9);
	-- scaleObject('entrance', 1.75, 1.75);
	-- addLuaSprite('entrance', false);

	-- makeLuaSprite('leaves', 'stage/horrortale/leaves', -860, 400);
	-- setScrollFactor('leaves', 0.9, 0.9);
	-- scaleObject('leaves', 1.75, 1.75);
	-- addLuaSprite('leaves', false);

	makeLuaSprite('ground', 'stage/horrortale/groundGritty', -2000, 300);
	setScrollFactor('ground', 1, 1);
	scaleObject('ground', 3, 4);
	addLuaSprite('ground', false);

	makeLuaSprite('entrance', 'stage/horrortale/RandomSigns/entranceGritty0', -1000, -200);
	setScrollFactor('entrance', 1, 1);
	scaleObject('entrance', 1.25, 1.25);
	addLuaSprite('entrance', false);

	-- makeLuaSprite('entrance', 'stage/horrortale/entrance', -775, -400);
	-- setScrollFactor('entrance', 1, 1);
	-- scaleObject('entrance', 1.5, 1.5);
	-- addLuaSprite('entrance', false);

	makeLuaSprite('leaves', 'stage/horrortale/leavesDeadGritty',-1325, 325);
	setScrollFactor('leaves', 1, 1);
	scaleObject('leaves', 1.25, 1.25);
	addLuaSprite('leaves', false);

	makeLuaSprite('vines', 'stage/horrortale/vines', -1000, -200);
	setScrollFactor('vines', 1, 1);
	scaleObject('vines', 1.25, 1.25);
	addLuaSprite('vines', false);


	-- makeLuaSprite('gateway', 'stage/Gateway', 0, 0);
	-- setScrollFactor('gateway', 0.9, 0.9);
	-- scaleObject('gateway', 2, 2);
	-- addLuaSprite('gateway', false);
	


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