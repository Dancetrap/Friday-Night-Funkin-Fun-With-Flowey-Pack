function opponentNoteHit(id,data,type,sus)
if difficulty == 1 then
    if curStep >= 688 and curStep <= 1364 then
        triggerEvent('Screen Shake','0.5, 0.01','0.01, 0.00')
    else
        triggerEvent('Screen Shake','0.5, 0.03','0.01, 0.00')
    end
else if difficulty == 0 then
    if curStep <= 35 then
        triggerEvent('Screen Shake','0.5, 0.03','0.01, 0.00')
    end
end
end
end
