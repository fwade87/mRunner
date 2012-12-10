package  
{
	import flash.sampler.NewObjectSample;
	import org.flixel.*
	
	/**
	 * ...
	 * @author f87
	 */
	
	public class PlayState extends FlxState
	{
		[Embed(source = "../assets/sfx/bgm2.mp3")] public var bgm2SFX:Class;
		
		//Class references for EACH LEVEL!
		public var l1:Class = Level1;
		public var l2:Class = Level2;
		public var l3:Class = Level3;
		
		//Make the Class references (of each level) an ARRAY!
		public static var levels:Array;
		
		//The Base Level that all levels are "based" in.
		public var level:BaseLevel;
		
		//Make the Player object!
		public var player:Player;
		
		//enemies
		public var enemies:Enemies;
		public var scientist:Scientist;
		
		//score
		public var score:FlxText;
		
		//points
		public var points:int;
		
		//set a Level counter to 0...
		public static var levelCount:int = 0;
		
		//Reset boolean, for death purposes!
		public var reset:Boolean = false;
	
		//Credits...
		public var credits:Class = GameCredits;
		
		public function PlayState() 
		{
			FlxG.playMusic(bgm2SFX);
		}
		
		override public function create():void
		{
			levels = [l1, l2, l3, credits];
			FlxG.bgColor = 0xff000000;
			
			makeLevel();
			score = new FlxText(0, 0, 100);
			score.color = 0xffffffff;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = "M-Wax: " + points + " / " + level.totalmWaxs.toString();
			FlxG.log(level.name);
			
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
			points = 0;
			add(score);
		}
		
		//Update Function - Main Collision function!
		override public function update():void
		{
		
			super.update();
			FlxG.collide(player, level.floorMap);
			FlxG.collide(enemies, level.floorMap);
			
			if (player.levelActive)
			{
				FlxG.collide(player, level.jetpads, jetpadHit);
				FlxG.collide(player, level.acids, acidHit);
				FlxG.collide(player, level.breakblocks, breakblockHit);
				FlxG.collide(player, level.levelGoals, levelGoalHit);
				FlxG.collide(player, level.slidersR, slidersRHit);
				FlxG.collide(player, level.slidersL, slidersLHit);
				FlxG.collide(player, level.flickers, flickerHit);
				FlxG.collide(player, level.mWaxs, mWaxHit);
				
				FlxG.collide(enemies, level.jetpads);
				FlxG.collide(enemies, level.acids);
				FlxG.collide(enemies, level.breakblocks);
				FlxG.collide(enemies, level.levelGoals);
				FlxG.collide(enemies, level.slidersR);
				FlxG.collide(enemies, level.slidersL);
				FlxG.collide(enemies, level.flickers);
				FlxG.collide(enemies, level.mWaxs);
			}
			
			FlxG.watch(player, "x");
			FlxG.watch(player, "y");
			FlxG.watch(points, "points");
			
			
		}
		
		public function updateScore():void
		{
			points++;
			score.text = "M-Wax: " + points + " / " + level.totalmWaxs.toString();
			if (points == level.totalmWaxs)
			{
				score.text = "Level complete! Find the exit!";
				
				if (levelCount == 0)
				{
					level.floorMap.setTile(34, 34, 0, true);	
					level.floorMap.setTile(34, 33, 0, true);
					level.floorMap.setTile(35, 33, 0, true);
					level.floorMap.setTile(36, 33, 0, true);
					level.floorMap.setTile(37, 33, 0, true);
					level.floorMap.setTile(38, 33, 0, true);
					level.floorMap.setTile(38, 34, 0, true);
				}
				if (levelCount == 1)
				{
					level.floorMap.setTile(35, 34, 0, true);	
					level.floorMap.setTile(35, 33, 0, true);
					level.floorMap.setTile(36, 33, 0, true);
					level.floorMap.setTile(37, 33, 0, true);
					level.floorMap.setTile(38, 33, 0, true);
					level.floorMap.setTile(39, 33, 0, true);
					level.floorMap.setTile(39, 34, 0, true);
				}
				if (levelCount == 2)
				{
					level.floorMap.setTile(115, 34, 0, true);	
					level.floorMap.setTile(115, 33, 0, true);
					level.floorMap.setTile(116, 33, 0, true);
					level.floorMap.setTile(117, 33, 0, true);
					level.floorMap.setTile(118, 33, 0, true);
					level.floorMap.setTile(119, 33, 0, true);
					level.floorMap.setTile(119, 34, 0, true);
				}
			}
			
		}
		
		
		
		//Collision Events for interactive Tiles
		public function jetpadHit(p:Player, s:JetPad):void
		{
			s.jet();
			p.velocity.y = -400;
		}
		
		public function flickerHit(p:Player, s:Flickers):void
		{	
		}
		
		public function acidHit(p:Player, s:Acid):void
		{
			if (p.alive)
			{
				p.death();
				FlxG.log("That was one crazy, deadly FALL!");
			}
		}
		
		public function breakblockHit(p:Player, c:BreakBlock):void
		{
			c.breakB();
		}
		
		public function slidersRHit(p:Player, c:SlideRight):void
		{
			p.velocity.x = +420;
			c.slide();
		}
		
		public function slidersLHit(p:Player, c:SlideLeft):void
		{
			p.velocity.x = -420;
			c.slide();
		}
		
		public function mWaxHit(p:Player, s:MWax):void
		{
			updateScore();
			s.kill();
			

		}
		
		public function levelGoalHit(p:Player, g:LevelGoal):void
		{
			p.levelComplete();
			FlxG.fade(0xff000000, 2, nextLevel);
		}
		
		
		//To the next Level!
		public function nextLevel():void
		{
			FlxG.resetState();
			levelCount++;
			if (levelCount > (levels.length - 1))
			{
				levelCount = 0;
				FlxG.switchState(new MainMenu);
			} else {
				makeLevel();
			}
		}
		
		//Make the actual level!
		public function makeLevel():void
		{	
			
			level = new levels[levelCount];
			add(level.backgroundMap);
			add(level.mainParallaxMap);
			add(level.secondParallaxMap);
			
			player = recycle(Player) as Player;
			player.reset(level.playerStartX, level.playerStartY);
			player.setPosition(level.playerStartX, level.playerStartY);
			
			player.setBounds(new FlxRect(0, 0, level.width, level.height));

			FlxG.worldBounds.make(0, 0, level.width, level.height);

			add(level.jetpads);
			add(level.floorMap);
			add(level.acids);
			add(level.breakblocks);
			add(level.levelGoals);
			add(level.slidersR);
			add(level.slidersL);
			add(level.flickers);
			add(level.bubbles);
			add(level.bubbles2);
			add(level.mWaxs);
			add(level.enemies);
			add(player);
			
			FlxG.camera.flash(0xff000000, 1, null, false);
			
		}
		
	}
	

}