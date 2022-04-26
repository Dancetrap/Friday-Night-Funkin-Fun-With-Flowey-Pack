--custom opponent note skin <3
--credit to vCherry.kAI.16 <3 if you remove this text then you're not allowed to use this
function onCreatePost()
  for i = 0, getProperty('opponentStrums.length')-1 do
      setPropertyFromGroup('opponentStrums', i, 'texture', 'notes/NOTE_underpants'); --"NOTES_TEXTURE" must exactly match the .png and .xml file you want to use(located in images)
  end
  for i = 0, getProperty('playerStrums.length')-1 do
      setPropertyFromGroup('playerStrums', i, 'texture', 'notes/NOTE_underpants'); --"NOTES_TEXTURE" must exactly match the .png and .xml file you want to use(located in images)
  end
end