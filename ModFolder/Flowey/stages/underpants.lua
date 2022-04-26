function onCreate()
	-- background shit
	makeLuaSprite('bg', 'stage/pelo/FuckU', -625, -750);
	setScrollFactor('bg', 1, 1);
	scaleObject('bg', 1.25, 1.25);
	addLuaSprite('bg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end