package  
{
	import org.flixel.*
	
	/**
	 * 
	 * @author f87
	 */
	
	public class GameCredits extends BaseLevel
	{
		
		override public function setData():void 
		{			
			floorCSV = data.floorCredits;
			interactiveCSV = data.interactCredits;
			mainParallaxCSV = data.mainParCredits;
			secondParallaxCSV = data.secondParCredits;
			backgroundCSV = data.backgroundCredits;
			
			name = "Congratulations!";
		}
		
	}

}