package org.zougames.character.animations 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Landing extends CharacterAnimation
	{
		
		public function Landing() 
		{
			
		}
		
		override public function enterFrameHandler(e:Event = null)
		{
		
			super.enterFrameHandler(e);
			
			if (_character.isOnFloor)
			{
				trace('chamando running: ' + this);
				stop();
				_character.gotoAndStop('running');
				
			}
		}
		
	}

}