package  
{
	import org.flixel.FlxSprite;
		
	/**
	 * 
	 * @author f87
	 */
	
	public class Bubble2 extends FlxSprite
	{
		public var gfxdata:GfxData;

		
		public function Bubble2() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			
			solid = true;
			immovable = true;
			
			loadGraphic(gfxdata.tilesPNG, true, false, 16, 16);
			addAnimation("idle", [86,87,88,86,87,88], 4, true);
			play("idle");
			
			
			//audio
			
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}