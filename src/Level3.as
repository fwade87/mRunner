package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author f87
	 */
	
	public class Level3 extends BaseLevel
	{
		
		override public function setData():void 
		{			
			floorCSV = data.floor3;
			interactiveCSV = data.interact3;
			mainParallaxCSV = data.mainPar3;
			secondParallaxCSV = data.secondPar3;
			backgroundCSV = data.background3;
			name = "Level 3";
		}
		
	}

}