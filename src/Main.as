package 
{
	import org.flixel.*;
	
		/**
	 * ...
	 * @author f87
	 */
	
	 [SWF(width = "640", height = "480", backgroundColor = "#ffffff")]
	
	public class Main extends FlxGame
	{
		
		public function Main():void 
		{
			super(320, 240, MainMenu, 2);
			forceDebugger = false;
		}
		
	}

}