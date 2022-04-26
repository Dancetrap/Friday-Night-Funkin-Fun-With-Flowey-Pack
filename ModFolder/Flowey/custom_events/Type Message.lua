local message;
local startTimer = false;
local i = 0;
local j = 0;

-- Event notes hooks
function onEvent(name, value1, value2)
	--naa
    if name == 'Type Message' then
        j = value1;
        addLuaText(message);
        startTimer = true;
    end
end

function onCreate()
    message = string;
    makeLuaText(message, 'down, down, up, right, D, left, A, down, A, left', 1280, 0, math.random(-250,720));
    setTextFont(message, '8bitoperator.ttf');
    setTextSize(message, 40);
    setTextBorder(message, 3, '000000')
end



function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end


function onUpdate(elapsed)
    if startTimer then
        i = i + 1;

        if(i >= 50) then
            removeLuaText(message, false);
            startTimer = false;
        end
    end
end