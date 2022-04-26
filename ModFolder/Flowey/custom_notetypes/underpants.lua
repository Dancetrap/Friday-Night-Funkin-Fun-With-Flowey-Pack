--custom opponent note skin <3
--credit to vCherry.kAI.16 <3 if you remove this text then you're not allowed to use this
function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'underpants' then --"NOTE_NAME" must be the EXACT same as this lua file's name
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_underpants'); --"NOTES_TEXTURE" must exactly match the .png and .xml file you want to use(located in custom_notetypes)
		end
	end
end