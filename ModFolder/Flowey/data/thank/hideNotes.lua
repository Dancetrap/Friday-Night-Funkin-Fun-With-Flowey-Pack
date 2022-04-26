function onSongStart()
	-- noteTweenX("NoteMove1", 0, -1000, 0.5, cubeInOut)
	-- noteTweenX("NoteMove2", 1, -1000, 0.5, cubeInOut)
	-- noteTweenX("NoteMove3", 2, -1000, 0.5, cubeInOut)
	-- noteTweenX("NoteMove4", 3, -1000, 0.5, cubeInOut)
	-- for i=0,3 do
    --     noteTweenAlpha(i+0, i, 0, 0.3)
    -- end
end

function onUpdate(elapsed)
	for i=0,3 do
        noteTweenAlpha(i+0, i, math.floor, 0.01)
    end
end