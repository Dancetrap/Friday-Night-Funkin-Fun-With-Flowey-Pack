function opponentNoteHit()
   health = getProperty('health')
   if curStep >= 688 and curStep < 1344 then
    if getProperty('health') > 0.1 then
       setProperty('health', health- 0.025);
	end
   elseif curStep >= 1344 or curStep < 40 then
   if getProperty('health') > 0.1 then
       setProperty('health', health- 0);
	end
   else  
    if getProperty('health') > 0.1 then
       setProperty('health', health- 0.05);
	end
   end
end

function goodNoteHit()
   health = getProperty('health')
   if curStep >= 688 then
      if getProperty('health') > 0.1 then
       setProperty('health', health+ 0.075);
      end
   else  
    if getProperty('health') > 0.1 then
       setProperty('health', health+ 0.05);
	end
   end
end
