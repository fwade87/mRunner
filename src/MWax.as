package  
{
	import org.flixel.FlxSprite;
	
		/**
	 * 
	 * @author f87
	 */

	public class MWax extends FlxSprite
	{
		//GFX and Sound for MWAX
		public var gfxdata:GfxData;

		
		public function MWax()
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			
			
			//Make the Mwax stay in place!
			solid = true;
			immovable = true;
			
			//Animation
			loadGraphic(gfxdata.interactPNG, true, false, 16, 16);
			addAnimation("idle", [21,22,21,22,23], 15, true);
			
			play("idle");	
		}
		
		override public function update():void
		{
			super.update();
		}
		
		
		//Colliding with MWAX
		public function wax():void 
		{
			play("idle");	
			
		}
		
	}

}