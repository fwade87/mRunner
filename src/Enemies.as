package  
{
	import org.flixel.*
	
	/**
	 * ...
	 * @author Frank Wade
	 */
	public class Enemies extends FlxGroup
	{

		public function Enemies() 
		{
			super();
		}
		
		public function addScientist(x:int, y:int):void
		{
			var tempScientist:Scientist = new Scientist(x,y);
				
			add(tempScientist);
		}
		
		override public function update():void
		{
			super.update();
		}
		

	}

}