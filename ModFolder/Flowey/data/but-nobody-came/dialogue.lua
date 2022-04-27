local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	-- and difficulty == 1
	-- and isStoryMode
	if not allowCountdown and not seenCutscene and isStoryMode then

		-- if difficulty == 0 then
		-- 	setProperty('inCutscene', false);
		-- 	return Function_Stop;
		-- else
			setProperty('inCutscene', true);
		-- end
		runTimer('startDialogue', 0.8);
		makeLuaSprite('dialoguebg', 'bg/black', -75, -100);
		setObjectCamera('dialoguebg','hud');
		setScrollFactor('dead', 0, 0);
		addLuaSprite('dialoguebg', true);
		setProperty('healthBar.alpha', tonumber(0))
    	setProperty('iconP1.alpha', tonumber(0))
    	setProperty('iconP2.alpha', tonumber(0))
		setProperty('comboSpr.alpha', tonumber(0))
		setProperty('ranking.alpha', tonumber(0))
		setProperty('numScore.alpha', tonumber(0))
		setProperty('scoreTxt.alpha',tonumber(0));

		allowCountdown = true;
		return Function_Stop;
	elseif not allowCountdown and getPropertyFromClass('PlayState','deathCounter') > 0 then
	    if getPropertyFromClass('PlayState','deathCounter') == 1 then
	    	startVideo('omega/first');
	    elseif getPropertyFromClass('PlayState','deathCounter') == 2 then
	    	startVideo('omega/idiot');
	    elseif getPropertyFromClass('PlayState','deathCounter') == 3 then
	    	startVideo('omega/funnyjoke');
	    elseif getPropertyFromClass('PlayState','deathCounter') == 4 then
	    	startVideo('omega/deseperate');
	    elseif getPropertyFromClass('PlayState','deathCounter') == 5 then
	    	startVideo('omega/sad');
	    elseif getPropertyFromClass('PlayState','deathCounter') == 6 then
	    	startVideo('omega/justquit');
	    elseif getPropertyFromClass('PlayState','deathCounter') >= 7 then
	    	startVideo('omega/better');
        end

        allowCountdown = true;
		return Function_Stop;
		-- endSong();
	end

	setProperty('camHUD.visible', false);
    setProperty('skipCountdown', true);
	removeLuaSprite('dialoguebg', true);
	setProperty('healthBar.alpha', tonumber(1))
    setProperty('iconP1.alpha', tonumber(1))
    setProperty('iconP2.alpha', tonumber(1))
	setProperty('comboSpr.alpha', tonumber(1))
	setProperty('ranking.alpha', tonumber(1))
	setProperty('numScore.alpha', tonumber(1))
	setProperty('scoreTxt.alpha',tonumber(1));
	return Function_Continue;
end


function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' and isStoryMode then -- Timer completed, play dialogue
		if difficulty == 0 then
			setProperty('inCutscene', false);
			endSong();
		elseif difficulty == 1 then
			startDialogue('dialogueB', '');
		end
	end
end


-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	if count == 12 and difficulty == 1 then
		playMusic('idiot',1,true);
	elseif count == 19 and difficulty == 1 then
		removeLuaSprite('dialoguebg', true);
		playMusic('',1,true);
	end
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

local allowEnd = false
function onEndSong()
if not allowEnd and not seenCutscene and isStoryMode then
		setProperty('inCutscene', true);
		if difficulty == 0 then
			makeLuaSprite('dialoguebg', 'bg/black', -600, -100);
			setObjectCamera('dialoguebg','hud');
			setScrollFactor('dead', 0, 0);
			addLuaSprite('dialoguebg', true);
			startDialogue('dialogueA', '');
			setProperty('healthBar.alpha', tonumber(0))
    		setProperty('iconP1.alpha', tonumber(0))
    		setProperty('iconP2.alpha', tonumber(0))
			setProperty('comboSpr.alpha', tonumber(0))
			setProperty('ranking.alpha', tonumber(0))
			setProperty('numScore.alpha', tonumber(0))
		else
			setProperty('inCutscene', false);
		end

		allowEnd = true;
		return Function_Stop;
	end
		-- removeLuaSprite('dialoguebg', true);
	return Function_Continue;
end