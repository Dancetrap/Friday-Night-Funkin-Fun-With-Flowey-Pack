package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;
// // import Song.SwagSong;

using StringTools;

class AlbumCover extends FlxSprite
{
    public var cover:FlxSprite;
    private var char:String = '';

    public function new(char:String = 'bf', isPlayer:Bool = false)
    {
        super();
        // isOldIcon = (char == 'bf-old');
        // this.isPlayer = isPlayer;
        changeCover(char);
        scrollFactor.set();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);
    
        if (cover != null)
            setPosition(cover.x + cover.width + 10, cover.y - 30);
    }

    public function changeCover(char:String) {
		if(this.char != char) {
			var name:String = 'levelselector/covers/' + char;
			if(!Paths.fileExists('images/levelselector/covers/' + name + '.png', IMAGE)) name = 'levelselector/covers/' + char + '-cover'; //Older versions of psych engine's support
			if(!Paths.fileExists('images/levelselector/covers/' + name + '.png', IMAGE)) name = 'levelselector/covers/album-cover'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);

			loadGraphic(file); //Load stupidly first for getting the file size
			loadGraphic(file, true, Math.floor(width), Math.floor(height)); //Then load it fr
			// iconOffsets[0] = (width - 150) / 2;
			// iconOffsets[1] = (width - 150) / 2;
			// updateHitbox();

			// animation.add(char, [0, 1], 0, false, isPlayer);
			// animation.play(char);
			// this.char = char;

			// antialiasing = ClientPrefs.globalAntialiasing;
			// if(char.endsWith('-pixel')) {
			// 	antialiasing = false;
			// }
		}
	}

//     override public function create()
//     {
//         Paths.clearStoredMemory();
// 		Paths.clearUnusedMemory();

//     }

//     override function update()
// 	{

//     }

}