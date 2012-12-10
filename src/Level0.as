package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author f87
	 */
	
	public class Level0 extends BaseLevel
	{
		
		override public function setData():void 
		{			
			floorCSV = data.floor0;
			interactiveCSV = data.interact0;
			mainParallaxCSV = data.mainPar0;
			secondParallaxCSV = data.secondPar0;
			backgroundCSV = data.background0;
			name = "Level 0";
		}
		
	}

}