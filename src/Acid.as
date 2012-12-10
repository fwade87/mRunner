package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author f87
	 */
	
	public class Acid extends FlxSprite
	{
		public var gfxdata:GfxData;
		
		public function Acid() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			
			//Make the Acid stay in place!
			solid = true;
			immovable = true;
			
			loadGraphic(gfxdata.interactPNG, true, false, 16, 16);
			addAnimation("idle", [12], 1, true);
		}
		
		override public function update():void
		{
			play("idle");
		}
		
	}

}