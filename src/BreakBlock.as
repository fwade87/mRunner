package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author f87
	 */
	
	public class BreakBlock extends FlxSprite
	{
		public var gfxdata:GfxData;
		public var snddata:SndData;
		
		public var breakSND:FlxSound;
		
		//The Break variable
		public var hasbroke:Boolean = false;
		
		//BreakBlock animation variable for only 1 loop
		public var breakPlayed:Boolean = false;
		public var unbreakPlayed:Boolean = false;
		//The variable for Break Timer
		public var counter:Number = 0;
		
		public function BreakBlock() 
		{
			gfxdata = new GfxData();
			snddata = new SndData();
			super(x * 16, y * 16);
			
			//Make the BreakBlock stay in place
			solid = true;
			immovable = true;
			
			//Animations!
			loadGraphic(gfxdata.interactPNG, true, false, 16, 16);
			addAnimation("idle", [20]);
			addAnimation("breaking", [20, 16], 15, true);
			addAnimation("break", [16, 17, 18, 19, 0], 15, false);
			addAnimation("unbreak", [0, 19, 18, 17, 16, 20], 15, false);
			play("unbreak");
			
			//Sound
			breakSND = new FlxSound();
			breakSND.loadEmbedded(snddata.breakSFX);
		}
		
		override public function update():void
		{
			super.update();
			
			if (hasbroke)
			{
				//Start Counter!
				counter += FlxG.elapsed;
				//If about to Break play the break sound!
				if (counter > 0 && counter < 0.5) 
				{
					play("breaking");
				}
				//If counter passes 1 sec, break!
				if (counter >= 0.5 && counter < 3) 
				{
					if (solid) 
					{
						play("break");
						breakSND.play();
					}
					solid = false;
				}
				if (counter >= 3)
				{
					if (!solid)
					{
						play("unbreak");
					}
					solid = true;
				}
				if (counter >= 4)
				{
					hasbroke = false;
					counter = 0;
				}
			}
			if (!hasbroke)
			{
				play("idle");
			}
		}
		
		//Colliding with Breakblock:
		public function breakB():void 
		{
			hasbroke = true;
		}
		
	}

}