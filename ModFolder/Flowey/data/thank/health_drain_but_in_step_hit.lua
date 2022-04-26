function onCreate()
    
end

function onStepHit()
    if stepHitFuncs[curStep] then  --impotant
        stepHitFuncs[curStep]()
    end
end

stepHitFuncs = {
    [360] = function() --Replace it with ur song step
        function opponentNoteHit()
            health = getProperty('health')
            if getProperty('health') > 0.4 then --change it to the health u want
                setProperty('health', health- 0.02); --limit, 0 is no misses or die
            end
        end
    end,
}

