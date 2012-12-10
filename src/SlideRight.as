package  
{
	import org.flixel.FlxSprite;
		
	/**
	 * 
	 * @author f87
	 */
	
	public class SlideRight extends FlxSprite
	{
		public var gfxdata:GfxData;
		public var sliding:Boolean = false;
		
		public function SlideRight() 
		{
			gfxdata = new GfxData();
			super(x * 16, y * 16);
			
			solid = true;
			immovable = true;
			
			loadGraphic(gfxdata.interactPNG, true, false, 16, 16);
			addAnimation("idle", [24, 26, 24, 26, 24, 26], 2, true);
			addAnimation("slidin", [27]);
			play("idle");
			
			
			//audio
			
		}
		
		override public function update():void
		{
			super.update();
			if (this.frame == 27)
			{
				play("idle");
			}
		}
		
		//when the player collides with SlideRight, this gets called
		public function slide():void 
		{
			sliding = true;
			play("slidin");
		}
		
		
	}

}
		
