package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author f87
	 */
	
	public class Level1 extends BaseLevel
	{
		
		override public function setData():void 
		{			
			floorCSV = data.floor1;
			interactiveCSV = data.interact1;
			mainParallaxCSV = data.mainPar1;
			secondParallaxCSV = data.secondPar1;
			backgroundCSV = data.background1;
			name = "Level 1";
			
		}
		
		
		
		
	}

}