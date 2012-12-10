package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Frank Wade
	 */
	
	 public class Scientist extends FlxSprite
	{
		public var level:BaseLevel;
		protected var _jumpPower:int;
		protected var _runSpeed:uint;
		public var gfxData:GfxData;

		
		public function Scientist(x:int, y:int) 
		{
			super(x *16,y*16);
			alive = true;
			gfxData = new GfxData;
			loadGraphic(gfxData.scientistPNG,true, true, 16, 32);
			//Dimensions for Collision
			width = 14;
			offset.x = 1;
			
			//Set Physics variables
			_runSpeed = 190;
			drag.x = _runSpeed * 8;
			acceleration.y = 380;
			_jumpPower = 230;
			maxVelocity.x = _runSpeed;
			maxVelocity.y = _jumpPower * 2;
			
			//Direction the Enemy is Facing
			facing = RIGHT;
			//animations for Scientist
			
			addAnimation("idle", [0,12], 2,true);
			addAnimation("run", [1, 2, 3, 4, 5, 6, 7, 8], 12);
			addAnimation("jumpUp", [10]);
			addAnimation("jumpDown", [9]);
			addAnimation("death", [11, 0], 2, false);
			
			//Get Anim Info
			addAnimationCallback(animCallback);
			play("idle")
		}
		

		public function animCallback(animationName:String, frameNumber:uint, frameIndex:uint):void
		{
			if (animationName == "death" && frameNumber == 1)
			{
				reset(x,y);
				facing = RIGHT;
				acceleration.y = 380;
				alive = true;
			}
			if (!alive)
			{
				frame = frameNumber;
			}else if (velocity.x == 0)
				{
					play("idle");
				}
			
		}		
		
		override public function update():void
		{
			super.update();
		}
	}
}