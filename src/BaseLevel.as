package  
{
	import flash.sampler.NewObjectSample;
	import org.flixel.*
	
	/**
	 * 
	 * @author f87
	 */
	
	public class BaseLevel extends FlxGroup
	{
		//Data for all Levels
		public var data:LevelData;
		public var gfxdata:GfxData;
		
		//CSV classes that get data set from LevelData.as
		public var floorCSV:Class;
		public var interactiveCSV:Class;
		public var backgroundCSV:Class;
		public var mainParallaxCSV:Class;
		public var secondParallaxCSV:Class;
		
		//Tilemap for the Floor
		public var floorMap:FlxTilemap;
		
		//Interactive Tilemap
		public var interactiveMap:FlxTilemap;
		
		//Background Tilemap
		public var backgroundMap:FlxTilemap;
		
		//Parallax Tilemap
		public var mainParallaxMap:FlxTilemap;
		
		//2nd parallax tilemap
		public var secondParallaxMap:FlxTilemap;
		
		//Total M Wax in level
		public var totalmWaxs:int;
		
	
		//Interactive Objects
		public var jetpads:FlxGroup;
		public var acids:FlxGroup;
		public var levelGoals:FlxGroup;
		public var breakblocks:FlxGroup;
		public var slidersR:FlxGroup;
		public var slidersL:FlxGroup;
		public var flickers:FlxGroup;
		public var bubbles:FlxGroup;
		public var bubbles2:FlxGroup;
		public var mWaxs:FlxGroup;
			
		//Player Start Position
		public var playerStartX:int;
		public var playerStartY:int;
		
		//enemies
		public var enemies:Enemies;
		
		//completed boolean
		public var complete:Boolean = false;
		
		//Level Deminsions in Pixels
		public var width:int;
		public var height:int;
		
		//Level Name
		public var name:String;
		
		public function BaseLevel():void
		{
			data = new LevelData();
			gfxdata = new GfxData();
			setData();
			createFloorMap();
			createBackgroundMap();
			createMainParallaxMap();
			createSecondParallaxMap();
			createInteractiveElements();
			addEnemies();
			setDimensions();
			exists = true;
		}
		
		//Assigns data to the variables used in Map Creation!
		public function setData():void
		{
			floorCSV = data.floor1;
			interactiveCSV = data.interact1;
			backgroundCSV = data.background1;
			mainParallaxCSV = data.mainPar1;
			secondParallaxCSV = data.secondPar1;
			name = "Base Level";
		}
		
		private function addEnemies():void
		{
			enemies = new Enemies;
			
			enemies.addScientist(20, 10);
		}
		
		//Loads the Floormap (floor csv)
		public function createFloorMap():void
		{
			
			floorMap = recycle(FlxTilemap) as FlxTilemap;
			floorMap.loadMap(new floorCSV, gfxdata.tilesPNG, 16, 16, 0, 0, 1, 1);
			
			flickers = recycle(FlxGroup) as FlxGroup;
			bubbles = recycle(FlxGroup) as FlxGroup;
			bubbles2 = recycle(FlxGroup) as FlxGroup;
			
			//Scan the Y axis
			for (var ty:int = 0; ty < floorMap.heightInTiles; ty++)
			{
				//Scan the X axis
				for (var tx:int = 0; tx < floorMap.heightInTiles; tx++)
				{
					//Check for flickers and add to FlxGroup
					if (floorMap.getTile(tx, ty) > 10 && floorMap.getTile(tx, ty) <13)
					{
						var tempFlickers:Flickers = recycle(Flickers) as Flickers;
						tempFlickers.reset(tx * 16, ty * 16);
						flickers.add(tempFlickers);
					}
				
					//Check for bubbles and add to FlxGroup
					if (floorMap.getTile(tx, ty) > 81 && floorMap.getTile(tx, ty) <85)
					{
						var tempBubbles:Bubble = recycle(Bubble) as Bubble;
						tempBubbles.reset(tx * 16, ty * 16);
						bubbles.add(tempBubbles);
					}
					
					//Check for bubbles2 and add to FlxGroup
					if (floorMap.getTile(tx, ty) > 85 && floorMap.getTile(tx, ty) <89)
					{
						var tempBubbles2:Bubble2 = recycle(Bubble2) as Bubble2;
						tempBubbles2.reset(tx * 16, ty * 16);
						bubbles2.add(tempBubbles2);
					}
				}
			}
		}
		
		//Loads the Background map (background csv)
		public function createBackgroundMap():void
		{
			backgroundMap = recycle(FlxTilemap) as FlxTilemap;
			backgroundMap.loadMap(new backgroundCSV, gfxdata.backgroundPNG, 64, 64, 0, 0, 1, 8);
			backgroundMap.scrollFactor.x = 0.5;
			backgroundMap.scrollFactor.y = 0.5;
		}
		
		//Loads the Parallax map (Parallax csv)
		public function createMainParallaxMap():void
		{
			mainParallaxMap = recycle(FlxTilemap) as FlxTilemap;
			mainParallaxMap.loadMap(new mainParallaxCSV, gfxdata.mainParPNG,64,64,0,0,1,1);
			mainParallaxMap.scrollFactor.x = 0.7;
			mainParallaxMap.scrollFactor.y = 0.7;
		}
		
		//Loads the 2nd Parallax map (Parallax2 csv)
		public function createSecondParallaxMap():void
		{
			secondParallaxMap = recycle(FlxTilemap) as FlxTilemap;
			secondParallaxMap.loadMap(new secondParallaxCSV, gfxdata.secondParPNG,32,32,0,0,1,1);
			secondParallaxMap.scrollFactor.x = 0.9;
			secondParallaxMap.scrollFactor.y = 0.9;
		}
		
		//A loop that checks the Maps interactive CSV and creates the element in its respective FlxGroup based on CSV
		public function createInteractiveElements():void
		{
			interactiveMap = recycle(FlxTilemap) as FlxTilemap;
			interactiveMap.loadMap(new interactiveCSV, gfxdata.interactPNG, 16, 16);
			
			
			//Initialize each element to it's FlxGroup
			jetpads = recycle(FlxGroup) as FlxGroup;
			acids = recycle(FlxGroup) as FlxGroup;
			levelGoals = recycle(FlxGroup) as FlxGroup;
			breakblocks = recycle(FlxGroup) as FlxGroup;
			slidersR = recycle(FlxGroup) as FlxGroup;
			slidersL = recycle(FlxGroup) as FlxGroup;
			mWaxs = recycle(FlxGroup) as FlxGroup;
			
			
			//Scan the Y axis
			for (var ty:int = 0; ty < interactiveMap.heightInTiles; ty++)
			{
				//Scan the X axis
				for (var tx:int = 0; tx < interactiveMap.widthInTiles; tx++)
				{
					//Check for Player start tile and store Values for PlayState
					if (interactiveMap.getTile(tx, ty) == 1)
					{
						playerStartX = tx*16;
						playerStartY = ty*16;
					}
					
					
					//Check for Jetpads and add to FlxGroup
					if (interactiveMap.getTile(tx, ty) == 4)
					{
						//Recycle for memory 
						var tempJetPad:JetPad = recycle(JetPad) as JetPad;
						tempJetPad.reset(tx * 16, ty * 16);
						jetpads.add(tempJetPad);
					}
					
					//Check for acids and add to FlxGroup
					if (interactiveMap.getTile(tx, ty) == 12)
					{
						var tempAcid:Acid = recycle(Acid) as Acid;
						tempAcid.reset(tx * 16, ty * 16);
						acids.add(tempAcid);
					}
					
					//Check for goal tiles and add to FlxGroup
					if (interactiveMap.getTile(tx, ty) == 36)
					{
						var tempLevelGoal:LevelGoal = recycle(LevelGoal) as LevelGoal;
						tempLevelGoal.reset(tx * 16, (ty * 16)+8);
						levelGoals.add(tempLevelGoal);
					}
					
					//Check for breakblocks and add to FlxGroup
					if (interactiveMap.getTile(tx, ty) == 16)
					{
						var tempBreakBlock:BreakBlock = recycle(BreakBlock) as BreakBlock;
						tempBreakBlock.reset(tx * 16, ty * 16);
						breakblocks.add(tempBreakBlock);
					}
					
						//Check for mWax and add to FlxGroup
					if (interactiveMap.getTile(tx, ty) > 20 && interactiveMap.getTile(tx,ty) < 24)
					{
						var tempMWax:MWax = recycle(MWax) as MWax;
						tempMWax.reset(tx * 16, (ty * 16)+8);
						mWaxs.add(tempMWax);
						totalmWaxs++;
					}
					
					//Check for slidersR and add to FlxGroup
					if (interactiveMap.getTile(tx, ty) ==24)
					{
						var tempSlideR:SlideRight = recycle(SlideRight) as SlideRight;
						tempSlideR.reset(tx * 16, ty * 16);
						slidersR.add(tempSlideR);
					}
					
					//Check for slidersL and add to FlxGroup
					if (interactiveMap.getTile(tx, ty) == 25)
					{
						var tempSlideL:SlideLeft = recycle(SlideLeft) as SlideLeft;
						tempSlideL.reset(tx * 16, ty * 16);
						slidersL.add(tempSlideL);
					}
				}
			}
		}
		
		
		public function setDimensions():void
		{
			width = floorMap.width;
			height = floorMap.height;
		}
	}
}