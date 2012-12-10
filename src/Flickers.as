package  
{
	import org.flixel.FlxSprite;
		
	/**
	 * 
	 * @author f87
	 */
	
	public class Flickers extends FlxSprite
	{
		public var gfxdata:GfxData;

		
		public function Flickers() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			
			solid = true;
			immovable = true;
			
			loadGraphic(gfxdata.tilesPNG, true, false, 16, 16);
			addAnimation("idle", [11,12,11,12], 2, true);
			play("idle");
			
			
			//audio
			
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}