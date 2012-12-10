package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author f87
	 */
	
	public class Level2 extends BaseLevel
	{
		
		override public function setData():void 
		{			
			floorCSV = data.floor2;
			interactiveCSV = data.interact2;
			mainParallaxCSV = data.mainPar2;
			secondParallaxCSV = data.secondPar2;
			backgroundCSV = data.background2;
			name = "Level 2";
		}
		
	}

}