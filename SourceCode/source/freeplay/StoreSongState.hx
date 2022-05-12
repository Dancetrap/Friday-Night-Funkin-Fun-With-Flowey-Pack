package;

#if desktop
import Discord.DiscordClient;
#end
import editors.ChartingState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import WeekData;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

class FreeplayState extends MusicBeatState
{
	var songs:Array<SongMetadata> = [];

	var selector:FlxText;
	private static var curSelected:Int = 0;
	var curDifficulty:Int = -1;
	private static var lastDifficultyName:String = '';

	var scoreBG:FlxSprite;
	var scoreText:FlxText;
	var moneyText:FlxText;
	var songTitle:FlxText;
	var diffText:FlxText;
	var lerpPrice:Int = 0;
	var lerpScore:Int = 0;
	var lerpRating:Float = 0;
	var intendedScore:Int = 0;
	var intendedRating:Float = 0;
	public var onReset:Bool = false;
	var seen:Bool;

	// Secret Codes
	var m:Float = 0;
	var b:Float = 0;

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var albumCovers:Array<FlxSprite> = [];
	private var songTitles:Array<FlxText> = [];
	private var curPlaying:Bool = false;

	private var iconArray:Array<HealthIcon> = [];
	// private var coverArray:Array<AlbumCover> = [];
	private var coverArray:Array<FlxSprite> = [];

	var bg:FlxSprite;
	var box:FlxSprite;
	var infobox:FlxSprite;
	var cover:FlxSprite;
	var albumName:String;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var curtains:FlxSprite;
	var floe:FlxSprite;

	override function create()
	{
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();
		
		persistentUpdate = true;
		PlayState.isStoryMode = false;
		WeekData.reloadWeekFiles(false);

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Hoi! Welcome to da Floe Shop!", null);
		#end

		for (i in 0...WeekData.weeksList.length) {
			var leWeek:WeekData = WeekData.weeksLoaded.get(WeekData.weeksList[i]);
			var leSongs:Array<String> = [];
			var leChars:Array<String> = [];
			for (j in 0...leWeek.songs.length)
			{
				leSongs.push(leWeek.songs[j][0]);
				leChars.push(leWeek.songs[j][1]);
			}

			WeekData.setDirectoryFromWeek(leWeek);
			for (song in leWeek.songs)
			{
				var visible:Bool = Paths.getAvailability(Paths.formatToSongPath(song[0]));
				// seen = Paths.getMystery(Paths.formatToSongPath(song[0]));

				// Remember to make these songs false
				Paths.setAvailability('flowey', true);
				// Paths.setMystery('flowey', true);
				// Paths.setAvailability('new-best-friend', true);
				// Paths.setAvailability('kill-or-be-killed',true);
				// Paths.setAvailability('smiley-trashbag',false);
				// Paths.setAvailability('bad-tom',false);
				// Paths.setMystery('new-best-friend', true);
				// Paths.setMystery('kill-or-be-killed',true);
				// Paths.setMystery('smiley-trashbag',false);
				// Paths.setMystery('bad-tom',false);
				// Paths.setAvailability('but-nobody-came',false);

				var colors:Array<Int> = song[2];
				if(colors == null || colors.length < 3)
				{
					colors = [146, 113, 253];
				}
				if(song[3]=="song")
				{
					// if(Paths.getAvailability(Paths.formatToSongPath(song[0]))){
					if(visible){
						addSong(song[0], i, song[1], FlxColor.fromRGB(colors[0], colors[1], colors[2]), song[3]);
					}
					
				}
				
			}
		}
		WeekData.setDirectoryFromWeek();

		/*		//KIND OF BROKEN NOW AND ALSO PRETTY USELESS//

		var initSonglist = CoolUtil.coolTextFile(Paths.txt('freeplaySonglist'));
		for (i in 0...initSonglist.length)
		{
			if(initSonglist[i] != null && initSonglist[i].length > 0) {
				var songArray:Array<String> = initSonglist[i].split(":");
				addSong(songArray[0], 0, songArray[1], Std.parseInt(songArray[2]));
			}
		}*/
		bg = new FlxSprite().loadGraphic(Paths.image('levelselector/wall'));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		bg.scale.x = 0.75;
		bg.scale.y = 0.75;
		bg.screenCenter();


		curtains = new FlxSprite().loadGraphic(Paths.image('levelselector/curtains'));
		curtains.antialiasing = ClientPrefs.globalAntialiasing;
		add(curtains);
		// box.screenCenter(Y);

		curtains.screenCenter();

		floe = new FlxSprite();
		floe.scale.x = 0.875;
		floe.scale.y = 0.875;
		floe.x = 100;
		floe.y = 25;
		floe.frames = Paths.getSparrowAtlas('levelselector/FLOESHOP');
		floe.animation.addByPrefix('idle', 'Symbol 2 instance 1', 24);
		floe.animation.play('idle');
		add(floe);

		infobox = new FlxSprite().loadGraphic(Paths.image('levelselector/infoBox'));
		infobox.antialiasing = ClientPrefs.globalAntialiasing;
		add(infobox);
		// infobox.screenCenter(Y);

		// box.screenCenter();

		// infobox.setGraphicSize(500,250);
		infobox.setPosition(37.5,FlxG.height - infobox.height);



		box = new FlxSprite().loadGraphic(Paths.image('levelselector/songSelector'));
		box.antialiasing = ClientPrefs.globalAntialiasing;
		add(box);
		box.setPosition(FlxG.width/2+50,0);
		box.screenCenter(Y);

		// box.screenCenter();
		box.setGraphicSize(720,720);

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);


		
		for (i in 0...songs.length)
		{
			// var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].songName, true, false);
			// songText.isMenuItem = true;
			// songText.targetY = i;
			// grpSongs.add(songText);

			// Check to see if song is avaiable in freeplay
			// Paths.getAvailability(songs[i].fileName);
			// Paths.formatToSongPath(songs[i].songName);


			

			//This is not the problem
			//if(!songs[i].hideInFreePlay)
			//{

				// songTitle = new FlxText(FlxG.width * 0.05, FlxG.height - 200, 0, '<' + songs[i].songName + '>', 32);
				// songTitle = new FlxText(FlxG.width * 0.05 + 50, FlxG.height - 200, 0, songs[i].songName, 32);
				if(!Paths.getMystery(Paths.formatToSongPath(songs[i].songName))) songTitle = new FlxText(FlxG.width * 0.05 + 50, FlxG.height - 200, 0, '???', 32);
				else songTitle = new FlxText(FlxG.width * 0.05 + 50, FlxG.height - 200, 0, songs[i].songName, 32);
				songTitle.setFormat(Paths.font("mars.ttf"), 32, FlxColor.WHITE, LEFT);
				songTitles.push(songTitle);
				add(songTitle);
				
				// if(Paths.getAvailability(songs[i].fileName)) 
				{
					
				}

				Paths.currentModDirectory = songs[i].folder;
				// var icon:HealthIcon = new HealthIcon(songs[i].songCharacter);
				// icon.sprTracker = songText;

				// // using a FlxGroup is too much fuss!
				// iconArray.push(icon);
				// add(icon);

				// if(!Paths.fileExists('images/levelselector/covers/' + songs[i].songName + '.png', IMAGE)) cover = new FlxSprite().loadGraphic(Paths.image('levelselector/covers/album-cover')); //Prevents crash from missing icon)
				// /*else*/ 
				if(!Paths.getMystery(Paths.formatToSongPath(songs[i].songName))) cover = new FlxSprite().loadGraphic(Paths.image('levelselector/covers/mystery'));
				else cover = new FlxSprite().loadGraphic(Paths.image('levelselector/covers/' + songs[i].fileName + 'cover'));
				// cover = new FlxSprite().loadGraphic(Paths.image('levelselector/covers/'+ i));
				// cover = new FlxSprite().loadGraphic(Paths.image('levelselector/covers/album-cover'));

				// if(!Paths.fileExists('images/levelselector/covers/' + songs[i].songName + '.png', IMAGE))
				// {
				// 	cover = new FlxSprite().loadGraphic(Paths.image('levelselector/covers/album-cover'));
				// }
				// else
				// {
				// 	cover = new FlxSprite().loadGraphic(Paths.image('levelselector/covers/' + songs[i].songName + '-cover'));
				// }

				cover.antialiasing = ClientPrefs.globalAntialiasing;
				coverArray.push(cover);
				add(cover);
				cover.setPosition(FlxG.width/2 - 50,0);
				cover.screenCenter(Y);

				cover.setGraphicSize(690,690);
				// cover.setGraphicSize(570,570);



			//}
			
		}

		
		WeekData.setDirectoryFromWeek();

		// curtains = new FlxSprite().loadGraphic(Paths.image('levelselector/curtains'));
		// curtains.antialiasing = ClientPrefs.globalAntialiasing;
		// add(curtains);
		// // box.screenCenter(Y);

		// curtains.screenCenter();

		// floe = new FlxSprite();
		// floe.scale.x = 0.875;
		// floe.scale.y = 0.875;
		// floe.x = 50;
		// floe.y = 250;
		// floe.frames = Paths.getSparrowAtlas('levelselector/FLOESHOP');
		// floe.animation.addByPrefix('idle', 'Symbol 2 instance 1', 24);
		// floe.animation.play('idle');
		// add(floe);

		// infobox = new FlxSprite().loadGraphic(Paths.image('levelselector/infoBox'));
		// infobox.antialiasing = ClientPrefs.globalAntialiasing;
		// add(infobox);
		// // infobox.screenCenter(Y);

		// // box.screenCenter();

		// // infobox.setGraphicSize(500,250);
		// infobox.setPosition(0,FlxG.height - infobox.height);

		scoreText = new FlxText(songTitle.x, songTitle.y + 50, 0, "", 32);
		scoreText.setFormat(Paths.font("mars.ttf"), 32, FlxColor.WHITE, LEFT);

		moneyText = new FlxText(0, 5, 0, "", 32);
		moneyText.setFormat(Paths.font("mars.ttf"), 32, FlxColor.WHITE, LEFT);

		scoreBG = new FlxSprite(scoreText.x - 6, 0).makeGraphic(1, 66, 0xFF000000);
		scoreBG.alpha = 0.6;
		// add(scoreBG);

		diffText = new FlxText(scoreText.x, scoreText.y + 50, 0, "", 24);
		diffText.setFormat(Paths.font("mars.ttf"), 32, FlxColor.WHITE, LEFT);
		// diffText.font = scoreText.font;
		add(diffText);

		add(scoreText);

		if(curSelected >= songs.length) curSelected = 0;
		// bg.color = songs[curSelected].color;
		// intendedColor = bg.color;

		if(lastDifficultyName == '')
		{
			// lastDifficultyName = CoolUtil.defaultDifficulty;
			lastDifficultyName = 'Hard';
		}
		curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(lastDifficultyName)));
		
		changeSelection();
		changeDiff();

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		// JUST DOIN THIS SHIT FOR TESTING!!!
		/* 
			var md:String = Markdown.markdownToHtml(Assets.getText('CHANGELOG.md'));

			var texFel:TextField = new TextField();
			texFel.width = FlxG.width;
			texFel.height = FlxG.height;
			// texFel.
			texFel.htmlText = md;

			FlxG.stage.addChild(texFel);

			// scoreText.textField.htmlText = md;

			trace(md);
		 */

		var textBG:FlxSprite = new FlxSprite(0, FlxG.height - 26).makeGraphic(FlxG.width, 26, 0xFF000000);
		textBG.alpha = 0.6;
		// add(textBG);

		#if PRELOAD_ALL
		var leText:String = "Press SPACE to listen to the Song / Press CTRL to open the Gameplay Changers Menu / Press RESET to Reset your Score and Accuracy.";
		var size:Int = 16;
		#else
		var leText:String = "Press CTRL to open the Gameplay Changers Menu / Press RESET to Reset your Score and Accuracy.";
		var size:Int = 18;
		#end
		var text:FlxText = new FlxText(textBG.x, textBG.y + 4, FlxG.width, leText, size);
		text.setFormat(Paths.font("mars.ttf"), size, FlxColor.WHITE, RIGHT);
		text.scrollFactor.set();
		// add(text);
		super.create();

		FlxG.sound.playMusic(Paths.music('tem menu song'), 0);
	}

	override function closeSubState() {
		changeSelection(0, false);
		persistentUpdate = true;
		super.closeSubState();
	}

	public function addSong(songName:String, weekNum:Int, songCharacter:String, color:Int, type:String)
	{
		songs.push(new SongMetadata(songName, weekNum, songCharacter, color, type));
	}

	/*public function addWeek(songs:Array<String>, weekNum:Int, weekColor:Int, ?songCharacters:Array<String>)
	{
		if (songCharacters == null)
			songCharacters = ['bf'];

		var num:Int = 0;
		for (song in songs)
		{
			addSong(song, weekNum, songCharacters[num]);
			this.songs[this.songs.length-1].color = weekColor;

			if (songCharacters.length != 1)
				num++;
		}
	}*/

	var instPlaying:Int = -1;
	private static var vocals:FlxSound = null;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{

		// if (FlxG.sound.music.volume < 0.7)
		// {
		// 	FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		// }

		FlxG.sound.music.volume = 1;

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, CoolUtil.boundTo(elapsed * 24, 0, 1)));
		lerpRating = FlxMath.lerp(lerpRating, intendedRating, CoolUtil.boundTo(elapsed * 12, 0, 1));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;
		if (Math.abs(lerpRating - intendedRating) <= 0.01)
			lerpRating = intendedRating;

		var ratingSplit:Array<String> = Std.string(Highscore.floorDecimal(lerpRating * 100, 2)).split('.');
		if(ratingSplit.length < 2) { //No decimals, add an empty space
			ratingSplit.push('');
		}
		
		while(ratingSplit[1].length < 2) { //Less than 2 decimals in it, add decimals then
			ratingSplit[1] += '0';
		}

		// scoreText.text = 'PERSONAL BEST: ' + lerpScore + ' (' + ratingSplit.join('.') + '%)';
		scoreText.text = 'HighScore: ' + lerpScore;
		// positionHighscore();

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var leftP = controls.UI_LEFT_P;
		var rightP = controls.UI_RIGHT_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;
		var ctrl = FlxG.keys.justPressed.CONTROL;

		// Musical Keys
		var up = FlxG.keys.justPressed.UP;
		var down = FlxG.keys.justPressed.DOWN;
		var left = FlxG.keys.justPressed.LEFT;
		var right = FlxG.keys.justPressed.RIGHT;
		var w = FlxG.keys.justPressed.W;
		var s = FlxG.keys.justPressed.S;
		var a = FlxG.keys.justPressed.A;
		var d = FlxG.keys.justPressed.D;



		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		if(songs.length > 1)
		{

			if (leftP)
			{
				// Sound FX for Smiley Trashbag
				if(!onReset)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
			}
			if (rightP)
			{
				// Sound FX for Smiley Trashbag
				if(!onReset)
				{
					changeSelection(shiftMult);
					holdTime = 0;
				}
			}

			// if (upP)
			// {
			// 	// Sound FX for Smiley Trashbag
			// 	FlxG.sound.play(Paths.sound('ping'));
			// }
			// if (downP)
			// {
			// 	// Sound FX for Smiley Trashbag
			// 	FlxG.sound.play(Paths.sound('ping'));
			// }

			// Musical Notes
			if(left)
			{
				FlxG.sound.play(Paths.sound('keys/F_ping'));
				// if(m==5)
				// {
				// 	m = 6;
				// }
				// else if(m==9)
				// {
				// 	m = 10;
				// }
				// else
				// {
				// 	m = 0;
				// }
				
			}
			if(right)
			{
				FlxG.sound.play(Paths.sound('keys/G_ping'));
				// if(m==3)
				// {
				// 	m = 4;
				// }
				// else
				// {
				// 	m = 0;
				// }
			}
			if(up)
			{
				FlxG.sound.play(Paths.sound('keys/C2_ping'));
				// if(m==2)
				// {
				// 	m = 3;
				// }
				// else
				// {
				// 	m = 0;
				// }
			}
			if(down)
			{
				FlxG.sound.play(Paths.sound('keys/C_ping'));
				// if(m==0)
				// {
				// 	m = 1;
				// }
				// else if(m==1)
				// {
				// 	m = 2;
				// }
				// else if (m==7)
				// {
				// 	m = 8;
				// }
				// else
				// {
				// 	m = 0;
				// }
			}
			if(a)
			{
				FlxG.sound.play(Paths.sound('keys/E_ping'));
				// if(m==6)
				// {
				// 	m = 7;
				// }
				// else if(m==8)
				// {
				// 	m = 9;
				// }
				// else
				// {
				// 	m = 0;
				// }
			}
			if(d)
			{
				FlxG.sound.play(Paths.sound('keys/F#_ping'));
				// if(m==4)
				// {
				// 	m = 5;
				// }
				// else
				// {
				// 	m = 0;
				// }
			}
			if(w)
			{
				// FlxG.sound.play(Paths.sound('keys/A_ping'));
				FlxG.sound.play(Paths.sound('keys/C2_ping'));
				// m = 0;
			}
			if(s)
			{
				// FlxG.sound.play(Paths.sound('keys/D#_ping'));
				FlxG.sound.play(Paths.sound('keys/C_ping'));
				// m = 0;
			}
	
			

			// if(controls.UI_DOWN || controls.UI_UP)
			if(controls.UI_LEFT || controls.UI_RIGHT)
			{
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

				if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
				{
					changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
				}
			}
		}

		if (upP)
			changeDiff(1);
		else if (downP)
			changeDiff(-1);
		else if (leftP || rightP) changeDiff();

		if(m==10)
		{
			FlxG.sound.play(Paths.sound('ping'));
			persistentUpdate = false;
			var songLowercase:String = Paths.formatToSongPath('smiley trashbag');
			var poop:String = Highscore.formatSong(songLowercase, 0);
			/*#if MODS_ALLOWED
			if(!sys.FileSystem.exists(Paths.modsJson(songLowercase + '/' + poop)) && !sys.FileSystem.exists(Paths.json(songLowercase + '/' + poop))) {
			#else
			if(!OpenFlAssets.exists(Paths.json(songLowercase + '/' + poop))) {
			#end
				poop = songLowercase;
				curDifficulty = 1;
				trace('Couldnt find file');
			}*/
			trace(poop);

			PlayState.SONG = Song.loadFromJson(poop, songLowercase);
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = 0;

			trace('CURRENT WEEK: ' + WeekData.getWeekFileName());
			if(colorTween != null) {
				colorTween.cancel();
			}
			
			if (FlxG.keys.pressed.SHIFT){
				LoadingState.loadAndSwitchState(new ChartingState());
			}else{
				LoadingState.loadAndSwitchState(new PlayState());
			}

			FlxG.sound.music.volume = 0;
					
			destroyFreeplayVocals();
			m = 0;
		}

		if (controls.BACK)
		{
			onReset = false;
			persistentUpdate = false;
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxG.sound.playMusic(Paths.music('yourbestfriend'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if(ctrl)
		{
			persistentUpdate = false;
			openSubState(new GameplayChangersSubstate());
		}
		else if(space)
		{
			if(instPlaying != curSelected)
			{
				#if PRELOAD_ALL
				destroyFreeplayVocals();
				FlxG.sound.music.volume = 0;
				Paths.currentModDirectory = songs[curSelected].folder;
				var poop:String = Highscore.formatSong(songs[curSelected].songName.toLowerCase(), curDifficulty);
				PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName.toLowerCase());
				if (PlayState.SONG.needsVoices)
					vocals = new FlxSound().loadEmbedded(Paths.voices(PlayState.SONG.song));
				else
					vocals = new FlxSound();

				FlxG.sound.list.add(vocals);
				FlxG.sound.playMusic(Paths.inst(PlayState.SONG.song), 0.7);
				vocals.play();
				vocals.persist = true;
				vocals.looped = true;
				vocals.volume = 0.7;
				instPlaying = curSelected;
				#end
			}
		}

		else if (accepted)
		{
			if(!onReset)
			{
				persistentUpdate = false;
				var songLowercase:String = Paths.formatToSongPath(songs[curSelected].songName);
				var poop:String = Highscore.formatSong(songLowercase, curDifficulty);
				/*#if MODS_ALLOWED
				if(!sys.FileSystem.exists(Paths.modsJson(songLowercase + '/' + poop)) && !sys.FileSystem.exists(Paths.json(songLowercase + '/' + poop))) {
				#else
				if(!OpenFlAssets.exists(Paths.json(songLowercase + '/' + poop))) {
				#end
					poop = songLowercase;
					curDifficulty = 1;
					trace('Couldnt find file');
				}*/
				trace(poop);

				PlayState.SONG = Song.loadFromJson(poop, songLowercase);
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = curDifficulty;

				trace('CURRENT WEEK: ' + WeekData.getWeekFileName());
				if(colorTween != null) {
					colorTween.cancel();
				}
			
				if (FlxG.keys.pressed.SHIFT){
					LoadingState.loadAndSwitchState(new ChartingState());
				}else{
					LoadingState.loadAndSwitchState(new PlayState());
				}

				FlxG.sound.music.volume = 0;
					
				destroyFreeplayVocals();
			}
			else
			{
				onReset = false;
			}
			
		}
		else if(controls.RESET)
		{
			openSubState(new ResetScoreSubState(songs[curSelected].songName, curDifficulty, songs[curSelected].songCharacter));
			FlxG.sound.play(Paths.sound('scrollMenu'));
			onReset = true;
		}
		super.update(elapsed);
	}

	public static function destroyFreeplayVocals() {
		if(vocals != null) {
			vocals.stop();
			vocals.destroy();
		}
		vocals = null;
	}

	function changeDiff(change:Int = 0)
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = CoolUtil.difficulties.length-1;
		if (curDifficulty >= CoolUtil.difficulties.length)
			curDifficulty = 0;

		lastDifficultyName = CoolUtil.difficulties[curDifficulty];

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

		PlayState.storyDifficulty = curDifficulty;
		diffText.text = 'Mode: ' + CoolUtil.difficultyString();
		// positionHighscore();
	}

	function changeSelection(change:Int = 0, playSound:Bool = true)
	{
		// if(playSound) FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = songs.length - 1;
		if (curSelected >= songs.length)
			curSelected = 0;
		
		// if(songs[curSelected].hideInFreePlay)
		// 	{
		// 		while(songs[curSelected].hideInFreePlay)
		// 			curSelected += change;

		// 		if (curSelected < 0)
		// 			curSelected = songs.length - 1;
		// 		if (curSelected >= songs.length)
		// 			curSelected = 0;
		// 	}

		// I need to make it so that anytime the user hits a hidden song, it skips over it


		/*var newColor:Int = songs[curSelected].color;
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}*/

		// selector.y = (70 * curSelected) + 30;

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

		var bullShit:Int = 0;

		// for (i in 0...iconArray.length)
		// {
		// 	iconArray[i].alpha = 0;
		// }

		// iconArray[curSelected].alpha = 1;

		for(i in 0...coverArray.length)
		{
			coverArray[i].alpha = 0;
		}

		coverArray[curSelected].alpha = 1;

		for(i in 0...songTitles.length)
			{
				songTitles[i].alpha = 0;
			}
	
			songTitles[curSelected].alpha = 1;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
		
		Paths.currentModDirectory = songs[curSelected].folder;
		PlayState.storyWeek = songs[curSelected].week;

		CoolUtil.difficulties = CoolUtil.defaultDifficulties.copy();
		var diffStr:String = WeekData.getCurrentWeek().difficulties;
		if(diffStr != null) diffStr = diffStr.trim(); //Fuck you HTML5

		if(diffStr != null && diffStr.length > 0)
		{
			var diffs:Array<String> = diffStr.split(',');
			var i:Int = diffs.length - 1;
			while (i > 0)
			{
				if(diffs[i] != null)
				{
					diffs[i] = diffs[i].trim();
					if(diffs[i].length < 1) diffs.remove(diffs[i]);
				}
				--i;
			}

			if(diffs.length > 0 && diffs[0].length > 0)
			{
				CoolUtil.difficulties = diffs;
			}
		}
		
		curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(CoolUtil.defaultDifficulty)));
		var newPos:Int = CoolUtil.difficulties.indexOf(lastDifficultyName);
		//trace('Pos of ' + lastDifficultyName + ' is ' + newPos);
		if(newPos > -1)
		{
			curDifficulty = newPos;
		}
	}

	private function positionHighscore() {
		scoreText.x = FlxG.width - scoreText.width - 6;

		scoreBG.scale.x = FlxG.width - scoreText.x + 6;
		scoreBG.x = FlxG.width - (scoreBG.scale.x / 2);
		diffText.x = Std.int(scoreBG.x + (scoreBG.width / 2));
		diffText.x -= diffText.width / 2;
	}

	private function positionMoney()
	{
		moneyText.x = FlxG.width - moneyText.width - 6;
	}
}

class SongMetadata
{
	public var songName:String = "";
	public var week:Int = 0;
	public var songCharacter:String = "";
	public var color:Int = -7179779;
	public var folder:String = "";
	public var fileName:String = "";
	public var type:String = "";
	public var hideInFreePlay:Bool = false;
	public var isMysterySong:Bool = false;
	public var purchased:Bool = true;
	public var price:Float = 0;

	public function new(song:String, week:Int, songCharacter:String, color:Int, type:String)
	{
		this.songName = song;
		this.week = week;
		this.songCharacter = songCharacter;
		this.color = color;
		this.type = type;
		this.folder = Paths.currentModDirectory;
		if(this.folder == null) this.folder = '';

		// this.fileName = Paths.formatToSongPath(song);

		var r:Array<String> = this.songName.split(" ");
		for(i in r)
		{
			this.fileName += i + "-";
		}
	}
}