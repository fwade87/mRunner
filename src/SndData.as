package  
{
	
	/**
	 * 
	 * @author f87
	 */
	public class SndData
	{
		//Sound Data for the Game
		[Embed(source="../assets/sfx/step.mp3")] public var stepSFX:Class;
		[Embed(source="../assets/sfx/die.mp3")] public var dieSFX:Class;
		[Embed(source="../assets/sfx/jump.mp3")] public var jumpSFX:Class;
		
		[Embed(source = "../assets/sfx/spring.mp3")]public var JetPadSFX:Class;
		[Embed(source = "../assets/sfx/break.mp3")]public var breakSFX:Class;
	}

}