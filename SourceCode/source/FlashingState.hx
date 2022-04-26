package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class FlashingState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	var flowey:FlxSprite;
	override function create()
	{
		super.create();

		// var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('floweymainmenu'));
		bg.alpha = 0.5;
		add(bg);
		bg.screenCenter();

		flowey = new FlxSprite(FlxG.width - 625, -10);
		flowey.scrollFactor.set(0, 0);
		flowey.flipX = true;
		flowey.frames = Paths.getSparrowAtlas('Flowey_normal');
		flowey.animation.addByPrefix('idle', "Idle", 24);
		flowey.animation.addByPrefix('disable', "Up", 24,false);
		flowey.animation.addByPrefix('keep', "Down", 24,false);
		// flowey.animation.addByPrefix('selected', "menu_" + optionShit[i] + " white", 24);
		flowey.animation.play('idle');
		flowey.antialiasing = ClientPrefs.globalAntialiasing;
		add(flowey);

		warnText = new FlxText(50, 0, FlxG.width,
			"WARNING!\n
			This mod contains flashing lights\n
			If you are prone to epilepsy, then\n
			Press ENTER to disable them now or go to Options Menu.\n
			Press ESCAPE to ignore this message.\n
			Thank you for playing the Fun With Flowey mod \n
			You have been warned! (you idiot) ;P",
			32);
		warnText.setFormat("Determination Sans Web Regular", 32, FlxColor.WHITE, LEFT);
		warnText.screenCenter(Y);
		add(warnText);

		
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			var back:Bool = controls.BACK;
			if (controls.ACCEPT || back) {
				leftState = true;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				if(!back) {
					ClientPrefs.flashing = false;
					ClientPrefs.saveSettings();
					FlxG.sound.play(Paths.sound('confirmMenu'));
					flowey.animation.play('disable');
					FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
						new FlxTimer().start(0.5, function (tmr:FlxTimer) {
							MusicBeatState.switchState(new TitleState());
						});
					});
				} else {
					FlxG.sound.play(Paths.sound('cancelMenu'));
					// flowey.animation.play('keep');
					FlxTween.tween(warnText, {alpha: 0}, 1, {
						onComplete: function (twn:FlxTween) {
							MusicBeatState.switchState(new TitleState());
						}
					});
				}
			}
		}
		super.update(elapsed);
	}
}
