package  
{
	import org.flixel.*
	
	/**
	 * 
	 * @author f87
	 */
	
	public class Player extends FlxSprite
	{	
		public var gfxdata:GfxData;
		public var snddata:SndData;
		
		protected var _jumpPower:int;
		protected var _runSpeed:uint;
		protected var _playerBounds:FlxRect;
		
		public var levelActive:Boolean;
		
		public var stepSND:FlxSound = new FlxSound();
		public var dieSND:FlxSound = new FlxSound();
		public var jumpSND:FlxSound = new FlxSound();
		
		public var xPos:int = 0;
		public var yPos:int = 0;
		
		
		public function Player() 
		{
			super(xPos, yPos);
			gfxdata = new GfxData();
			snddata = new SndData();
			
			//load the sprite sheet for player
			loadGraphic(gfxdata.playerPNG, true, true, 16, 32);
			
			//Set Physics variables
			_runSpeed = 190;
			drag.x = _runSpeed * 8;
			acceleration.y = 380;
			_jumpPower = 230;
			maxVelocity.x = _runSpeed;
			maxVelocity.y = _jumpPower*2;
			
			//Dimensions for Collision
			width = 14;
			offset.x = 1;
			
			//Direction the Player is facing
			facing = RIGHT;
			
			//Is Level running?
			levelActive = true;
			
			//animations for the Player
			addAnimation("idle", [0,12], 2,true);
			addAnimation("run", [1, 2, 3, 4, 5, 6, 7, 8], 12);
			addAnimation("jumpUp", [10]);
			addAnimation("jumpDown", [9]);
			addAnimation("death", [11, 0], 2, false);
			
			//Create sound Objects
			stepSND.loadEmbedded(snddata.stepSFX, false, false);
			jumpSND.loadEmbedded(snddata.jumpSFX, false, false);
			dieSND.loadEmbedded(snddata.dieSFX, false, false);
			
			//Get Anim Info
			addAnimationCallback(animCallback);
		}
		
		override public function update():void
		{
			super.update();
			
			if(alive && levelActive){
				
				acceleration.x = 0;
				
				if (FlxG.keys.LEFT)
				{
					facing = LEFT;
					acceleration.x -= drag.x;
				}
				if (FlxG.keys.RIGHT)
				{
					facing = RIGHT;
					acceleration.x += drag.x;
				}
				
				if (FlxG.keys.justPressed("UP") && isTouching(FlxObject.FLOOR))
				{
					velocity.y = -_jumpPower;
					jumpSND.play();
				}

			
				if (velocity.y != 0)
				{
					if (velocity.y > 0) play("jumpUp");
					if (velocity.y < 0) play("jumpDown");
				}
				else if (velocity.x == 0)
				{
					play("idle");
				}
				else
				{
					play("run");
				}
				if (x < 0) x = 0;
				if (y < 0) y = 0;
				if (x > _playerBounds.width - 16) x = _playerBounds.width - 16;
				if (y > _playerBounds.height - 32) y = _playerBounds.height - 32;
			}
		}
		
		public function setBounds(bounds:FlxRect):void
		{
			_playerBounds = bounds;
		}
		
		public function setPosition(X:int, Y:int):void
		{
			xPos = X;
			yPos = Y;
		}
		
		public function animCallback(animationName:String, frameNumber:uint, frameIndex:uint):void
		{
			if (animationName == "death" && frameNumber == 1)
			{
				reset(xPos, yPos);
				facing = RIGHT;
				acceleration.y = 380;
				alive = true;
			}
			if (!levelActive)
			{
				frame = frameNumber;
			}
			
			if (animationName == "run")
			{
				if (frameNumber == 3 || frameNumber == 7)
				{
					stepSND.play();
				}
			}
		}		
		
		//Event for Player touching LevelGoal
		public function levelComplete():void
		{
			levelActive = false;
			acceleration.x = 0;
			acceleration.y = 0;
			velocity.x = 0;
			velocity.y = 0;
			FlxG.log("Level Complete!");
		}
		
		//Death from Acid!
		public function death():void 
		{
			alive = false;
			dieSND.play();
			acceleration.x = 0;
			acceleration.y = 0;
			velocity.x = 0;
			velocity.y = 0;
			flicker(2);
			play("death");	
		}
	}
}