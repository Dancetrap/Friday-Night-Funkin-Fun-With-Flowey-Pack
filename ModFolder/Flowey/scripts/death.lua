function onCreate()
if boyfriendName=='bf-frisk' then
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-frisk'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
elseif boyfriendName=='bf' or boyfriendName=='mic-hand' or boyfriendName=='mic-hand-helptale' or boyfriendName=='bf-opposite-side' or boyfriendName=='bofend' then
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-soul'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
elseif boyfriendName=='horrortale-bf' then
	setPropertyFromClass('GameOverSubstate', 'characterName', 'horrortale-bf-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'stab'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
elseif boyfriendName=='sans' then
	setPropertyFromClass('GameOverSubstate', 'characterName', 'sans'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'monster_death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
elseif boyfriendName=='flowey-happy' then
	setPropertyFromClass('GameOverSubstate', 'characterName', 'flowey-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'ow'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
elseif boyfriendName=='sans-doock' then
	setPropertyFromClass('GameOverSubstate', 'characterName', 'sans-doock-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'monster_death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
elseif boyfriendName=='underpants-frisk' then
	setPropertyFromClass('GameOverSubstate', 'characterName', 'underpants-frisk'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'AAAAAAAAAAAHHHHHHHHHHHHHH'); --put in mods/sounds/
end
end