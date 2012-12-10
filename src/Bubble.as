package  
{
	import org.flixel.FlxSprite;
		
	/**
	 * 
	 * @author f87
	 */
	
	public class Bubble extends FlxSprite
	{
		public var gfxdata:GfxData;

		
		public function Bubble() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			
			solid = true;
			immovable = true;
			
			loadGraphic(gfxdata.tilesPNG, true, false, 16, 16);
			addAnimation("idle", [82,83,84,82,83,84], 5, true);
			play("idle");
			
			
			//audio
			
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}