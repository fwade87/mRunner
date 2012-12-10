package  
{
	import flash.display.Stage;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.CenterSlideFX;
	import org.flixel.plugin.photonstorm.FX.FloodFillFX;
	
	/**
	 * ...
	 * @author f87
	 */
	
	public class MainMenu extends FlxState
	{
		[Embed(source="../assets/sfx/bgm1.mp3")] public var bgm1SFX:Class;
		[Embed(source = "../assets/gfx/menu.png")] public var menuPNG:Class;
		
		public var menuIMG:FlxSprite;
		private var start:FlxText;
		public var level:Level0;
		private var title:FlxSprite;
		private var dolly:FlxSprite;
		private var flood:FloodFillFX;
		public var reveal:CenterSlideFX;
		
		public function MainMenu() 
		{
			
		}
		
		override public function create():void
		{
			level = new Level0;
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			var t:FlxSprite = new FlxSprite(0,0,menuPNG);
			
			flood = FlxSpecialFX.floodFill();
			reveal = FlxSpecialFX.centerSlide();
			
			//	Push Image Down with y coord
			title = flood.create(t, 0, 0, t.width, t.height);
			title.scrollFactor.x = 0;
			title.scrollFactor.y = 0;
			
			start = new FlxText(0, 226, 320, "PRESS X!");
			start.alignment = "center";
			start.shadow = 0xff032300;
			start.scrollFactor.x = 0;
			start.scrollFactor.y = 0;
			
			dolly = new FlxSprite(160, 170);
			dolly.facing = FlxObject.RIGHT;
			
			FlxG.worldBounds = new FlxRect(40,40,level.width,level.height);
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			FlxG.camera.follow(dolly, FlxCamera.STYLE_PLATFORMER);
			
			reveal.start(.5);
			flood.start(.5);
			add(level);
			
			add(title);
			add(start);
			
			FlxG.playMusic(bgm1SFX, 1);
		}
		
				override public function destroy():void
		{
			//	Important! Clear out the plugin, otherwise resources will get messed right up after a while
			FlxSpecialFX.clear();
			
			super.destroy();
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.X)
			{
				FlxG.switchState(new PlayState);
			}
			
			if (dolly.facing == FlxObject.RIGHT)
			{
				dolly.x++;
				
				if (dolly.x >= (level.width - 200))
				{
					dolly.facing = FlxObject.LEFT;
				}
			}
			else if (dolly.facing == FlxObject.LEFT)
			{
				dolly.x--;
				
				if (dolly.x <= 0)
				{
					dolly.facing = FlxObject.RIGHT;
				}
			}
		}
		
	}

}