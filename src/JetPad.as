package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author f87
	 */
	
	public class JetPad extends FlxSprite
	{
		//GFX and Sound for JetPad
		public var gfxdata:GfxData;
		public var snddata:SndData;
		public var jetSND:FlxSound;
		
		public function JetPad() 
		{
			gfxdata = new GfxData();
			snddata = new SndData();
			
			super(x * 16, y * 16);
			
			//Make the JetPad stay in place!
			solid = true;
			immovable = true;
			
			//Animation
			loadGraphic(gfxdata.interactPNG, true, false, 16, 16);
			addAnimation("idle", [4,5,6,4,5,6], 15, true);
			addAnimation("jet", [7,7,7,8], 15, false);
			
			play("idle");
			
			jetSND = new FlxSound();
			jetSND.loadEmbedded(snddata.JetPadSFX, false, false);
			
		}
		
		override public function update():void
		{
			super.update();
			if (this.frame == 8)
			{
				play("idle");
			}
		}
		
		
		//Colliding with Jetpad:
		public function jet():void {
			play("jet");
			jetSND.play();
			
		}
		
	}

}