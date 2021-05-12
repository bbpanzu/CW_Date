package;
import flixel.*;

/**
 * ...
 * @author bbpanzu
 */
class HeartThingy extends FlxSprite 
{
	public var fadedelay:Int = 0;
	public var framee:Int = 0;
	public var speed:Float = 0;
	public function new(X,Y,SPEED:Float=1) 
	{
		super(X,Y);
		speed = SPEED;
		fadedelay = FlxG.random.int(240, 360);
		frames = Paths.getSparrowAtlas("date/heartthingy");
		animation.addByPrefix("bump", "heartthing", 24, true);
		scrollFactor.set(0.8,0.8);
		antialiasing = true;
		active = true;
		alpha = 0.9;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		y-= speed;
		framee ++;
		
		if (framee > fadedelay){
			alpha -= 0.01;
		}
		
		animation.play("bump"); 
		if (alpha > 0){
			super.update(elapsed);
		}else{
			active = false;
			visible = false;
		}
	}
	
}