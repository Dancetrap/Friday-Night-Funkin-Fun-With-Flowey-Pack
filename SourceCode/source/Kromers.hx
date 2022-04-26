package;

import flixel.FlxG;

using StringTools;

class Kromers
{
    // public static var kromers:Int;
    public static var total:Map<String, Int> = new Map();
    public static var current:Int;

    public static function earnKromers(money:Int = 0):Void
    {
        if (!total.exists("coins"))
            current = 0;
        else
            current = getTotalCoins("coins");

        setTotalCoins("coins", money + current);
        // if (total.exists("coins"))
        //     {
        //         if (weekScores.get(daWeek) < score)
        //             setTotalCoins("coins", money);
        //     }
        //     else
        //         setTotalCoins("coins", money);
    }

    public static function spendKromers(money:Int = 0):Void
        {
            if (!total.exists("coins"))
                current = 0;
            else
                current = getTotalCoins("coins");
    
            setTotalCoins("coins", current - money);
            // if (total.exists("coins"))
            //     {
            //         if (weekScores.get(daWeek) < score)
            //             setTotalCoins("coins", money);
            //     }
            //     else
            //         setTotalCoins("coins", money);
        }

    public static function floorDecimal(value:Float, decimals:Int):Float
        {
            if(decimals < 1)
            {
                return Math.floor(value);
            }
        
            var tempMult:Float = 1;
            for (i in 0...decimals)
            {
                tempMult *= 10;
            }
            var newValue:Float = Math.floor(value * tempMult);
            return newValue / tempMult;
        }

    public static function setTotalCoins(name:String, money:Int):Void
    {
        total.set(name,money);
        FlxG.save.data.total = total;
		FlxG.save.flush();
    }

    public static function getTotalCoins(name:String):Int
    {
        if (!total.exists(name))
			setTotalCoins(name, 0);
        return total.get(name);
    }

    public static function load():Void
    {
        if (FlxG.save.data.total != null)
        {
            total = FlxG.save.data.total;
        }
    }
}

