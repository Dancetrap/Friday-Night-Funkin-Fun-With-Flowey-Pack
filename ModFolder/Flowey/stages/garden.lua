-- This can be changed to remove or incorporate shadows
local shadow = false;
function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'stageback', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('stagefront', 'stagefront', -650, 600);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);

	makeLuaSprite('floor','stage/garden/PathSmushed',-2475,602);
	setScrollFactor('floor', 1, 1);

	makeLuaSprite('wall','stage/garden/BrickWall',-500,-150);
	setScrollFactor('wall', 0.9, 1);

	makeLuaSprite('frontwall','stage/garden/WallSmushedTextured',-1400,-200);
	setScrollFactor('frontwall', 1, 1);
	scaleObject('frontwall', 1.3, 1.3);

	makeLuaSprite('vineA','stage/garden/VineShading',200,-100);
	setScrollFactor('vineA', 1, 1);
	scaleObject('vineA', 1.3, 1.3);

	
	makeLuaSprite('vineB','stage/garden/VineShading',800,-100);
	setScrollFactor('vineB', 1, 1);
	scaleObject('vineB', 1.3, 1.3);

	makeLuaSprite('garden','stage/garden/FloweyGarden',-800,250);
	setScrollFactor('garden', 1, 1);
	scaleObject('garden', 0.3, 0.3);

	makeLuaSprite('shop','stage/garden/FlowerShop',0,250);
	setScrollFactor('shop', 1, 1);
	scaleObject('shop', 0.3, 0.3);

	makeLuaSprite('painting','stage/garden/Origin',-600,200);
	setScrollFactor('painting', 1, 1);
	-- scaleObject('painting', 0.3, 0.3);

	makeLuaSprite('window','stage/garden/Window',1000,250);
	setScrollFactor('window', 1, 1);
	scaleObject('window', 0.5, 0.5);

	makeLuaSprite('statue','stage/garden/StatueShading',1225,200);
	setScrollFactor('statue', 1, 1);
	scaleObject('statue', 1.1, 1.1);

	makeLuaSprite('shadow','stage/garden/StatueShadow',1252.5,740);
	setScrollFactor('shadow', 1, 1);
	scaleObject('shadow', 1.1, 1.1);
	setProperty('shadow.alpha',0.25);

	makeLuaSprite('patch','stage/garden/Patch',400,775);
	setScrollFactor('patch', 1, 1);
	scaleObject('patch', 0.5, 0.5);

	makeLuaSprite('patchB','stage/garden/Patch',600,700);
	setScrollFactor('patchB', 1, 1);
	scaleObject('patchB', 0.5, 0.5);

	makeLuaSprite('watching','stage/garden/Watching',1525,370);
	setScrollFactor('watching', 1, 1);
	scaleObject('watching', 0.8, 0.8);

	makeLuaSprite('crack','stage/garden/Crack',325,-200);
	setScrollFactor('crack', 0.9, 1);
	scaleObject('crack', 1.1, 1.1);

	makeLuaSprite('wallcrack','stage/garden/WallCracks',400,170);
	setScrollFactor('wallcrack', 0.9, 1);
	scaleObject('wallcrack', 1.3, 1.3);

	-- The group of Floweys
	makeAnimatedLuaSprite('flowey', 'characters/Flowey_normal', -350, 650);
	addAnimationByPrefix('flowey', 'first', 'Idle', 24, false);
	scaleObject('flowey', 0.3, 0.3);
	objectPlayAnimation('flowey', 'first');

	makeAnimatedLuaSprite('sneeze', 'stage/garden/flowey_with_no_petals', 1250, 750);
	addAnimationByPrefix('sneeze', 'normal', 'Idle', 24, false);
	addAnimationByPrefix('sneeze', 'sneeze', 'Sneeze', 24, false);
	addAnimationByPrefix('sneeze', 'pedalless', 'No petals', 24, false);
	scaleObject('sneeze', 0.5, 0.5);
	objectPlayAnimation('sneeze', 'normal');
	
	makeAnimatedLuaSprite('floweyBop', 'characters/Happy_Flowe', 1250, 750);
	addAnimationByPrefix('floweyBop', 'first', 'Idle', 24, false);
	scaleObject('floweyBop', 0.5, 0.5);
	objectPlayAnimation('floweyBop', 'first');

	-- You have to manually change it to any character you want
	if shadow then
	makeAnimatedLuaSprite('playershadow', 'characters/BOYFRIEND', defaultBoyfriendX + 100, defaultBoyfriendY + 250);
	addAnimationByPrefix('playershadow', 'first', 'BF idle dance', 24, false);
	addAnimationByPrefix('playershadow', 'left', 'BF NOTE LEFT0', 24, false);
	addAnimationByPrefix('playershadow', 'right', 'BF NOTE RIGHT0', 24, false);
	addAnimationByPrefix('playershadow', 'up', 'BF NOTE UP0', 24, false);
	addAnimationByPrefix('playershadow', 'down', 'BF NOTE DOWN0', 24, false);

	-- addAnimationByIndices('playershadow', 'left', 'BF NOTE LEFT', '2,3,4,5,6,7,8,9,10,11,12,13,14,2,3,4,5,6,7,8,9,10,11,12,13,14');
	-- addAnimationByIndices('playershadow', 'right', 'BF NOTE RIGHT', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61');
	-- addAnimationByIndices('playershadow', 'up', 'BF NOTE UP', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,2,3,4,5,6,7,8,9,10,11,12,13,14');
	-- addAnimationByIndices('playershadow', 'down', 'BF NOTE DOWN', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29');
	-- setProperty('playershadow.flipX', true);
	objectPlayAnimation('playershadow', 'first');
	end
	
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


	addLuaSprite('floor', false);
	addLuaSprite('wall', false);
	addLuaSprite('wallcrack', false);
	addLuaSprite('crack', false);
	addLuaSprite('patch', false);
	addLuaSprite('patchB', false);
	addLuaSprite('frontwall', false);
	addLuaSprite('watching', false);
	addLuaSprite('shop', false);
	addLuaSprite('garden', false);
	addLuaSprite('painting', false);
	addLuaSprite('window', false);
	addLuaSprite('vineA', false);
	addLuaSprite('vineB', false);
	addLuaSprite('shadow', false);
	addLuaSprite('statue', false);
	if shadow then
	addLuaSprite('playershadow', false); -- false = add behind characters, true = add over characters
	end

	addLuaSprite('flowey', true);
	addLuaSprite('floweyBop', true);
	-- addLuaSprite('sneeze', true);
	
	
end

-- Shadow shit

-- Gameplay interactions
function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		if shadow then
			objectPlayAnimation('playershadow', 'first');
		end
			objectPlayAnimation('flowey', 'first');
			objectPlayAnimation('floweyBop', 'first');
			-- if curStep < 440 then
			-- 	objectPlayAnimation('sneeze', 'normal');
			-- elseif curStep > 460 then
			-- 	objectPlayAnimation('sneeze', 'pedalless');
			-- end
	end
end

function onUpdate(elapsed)
	-- if curStep == 440 then
	-- 	objectPlayAnimation('sneeze', 'sneeze');
	-- end

		if curStep == 440 then
		objectPlayAnimation('sneeze', 'sneeze');
	end
end

function onStepHit()
	-- triggered 16 times per section
	-- setProperty('playershadow.scale.x', getProperty('playershadow.scale.x') + 0.01);
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
	if shadow then
		objectPlayAnimation('playershadow', 'first');
	end
		objectPlayAnimation('flowey', 'first');
		objectPlayAnimation('floweyBop', 'first');
		-- objectPlayAnimation('sneeze', 'normal');
	end
	
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
	if shadow then
	if direction == 0 then
		objectPlayAnimation('playershadow', 'left');
	elseif direction == 1 then
		objectPlayAnimation('playershadow', 'down');
	elseif direction == 2 then
		objectPlayAnimation('playershadow', 'up');
	elseif direction == 3 then
		objectPlayAnimation('playershadow', 'right');
	end
	end
	
end

function noteMiss(id, direction, noteType, isSustainNote)
	-- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	-- Works the same as goodNoteHit, but for Opponent's notes being hit
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end