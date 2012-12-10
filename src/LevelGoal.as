package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author f87
	 */
	
	public class LevelGoal extends FlxSprite
	{		
		public var gfxdata:GfxData;
		
		public function LevelGoal() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			
			solid = true;
			immovable = true;
			
			loadGraphic(gfxdata.interactPNG, true, false, 16, 16, false);
			
			height = 8;
			offset.y = 8;
			
			addAnimation("pulseG", [36, 37, 38, 39], 12, true);
		}
		
		override public function update():void
		{
			play("pulseG");
		}
		
	}

}