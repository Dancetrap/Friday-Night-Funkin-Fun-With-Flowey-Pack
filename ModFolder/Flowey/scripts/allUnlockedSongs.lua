-- This is only intended to be used in this file. If you find it, don't place this script anywhere else

function onEndSong()
    if songName == 'new-best-friend' then

    elseif songName == 'kill-or-be-killed' then

        if difficulty == 0 then
            unlockSong('flower-dance');
        else
            unlockSong('kill-or-be-killed');
        end
        -- Will this work? I don't know. But we'll have to find out soon
        
    elseif songName == 'but-nobody-came' then

        unlockSong('fear');

    elseif songName == 'fear' then

        unlockSong('thank');

    elseif songName == 'smiley-trashbag' then

        unlockSong('bad-tom');

    elseif songName == 'bad-tom' then

        unlockSong('confronting-saness');

    end
end

function onSongStart()
    -- unlockSong('new-best-friend');
    -- revealSong('new-best-friend');
    -- unlockSong('kill-or-be-killed');
    -- revealSong('kill-or-be-killed');
    -- unlockSong('but-nobody-came');
    -- revealSong('but-nobody-came');
    -- unlockSong('flower-dance');
    -- revealSong('flower-dance');
    -- unlockSong('fear');
    -- revealSong('fear');
    -- unlockSong('thank');
    -- revealSong('thank');
    -- unlockSong('smiley-trashbag')
    -- revealSong('smiley-trashbag')
    -- unlockSong('bad-tom')
    -- revealSong('bad-tom')
    -- unlockSong('confronting-saness')
    -- revealSong('confronting-saness')
    -- lockSong('new-best-friend');
    -- hideSong('new-best-friend');
    -- lockSong('kill-or-be-killed');
    -- hideSong('kill-or-be-killed');
    -- lockSong('but-nobody-came');
    -- hideSong('but-nobody-came');
    -- lockSong('flower-dance');
    -- hideSong('flower-dance');
    -- lockSong('fear');
    -- hideSong('fear');
    -- lockSong('thank');
    -- hideSong('thank');
    -- lockSong('smiley-trashbag')
    -- hideSong('smiley-trashbag')
    -- lockSong('bad-tom')
    -- hideSong('bad-tom')
    -- lockSong('confronting-saness')
    -- hideSong('confronting-saness')
end