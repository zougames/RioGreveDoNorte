package org.zougames.character.animations 
{
	import org.zougames.graphics.AnimationEvent;
	
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class SuperSpeedRunning extends CharacterAnimation
	{
		
		public function SuperSpeedRunning() 
		{
			
		}
		
		override protected function startedHandler(e:AnimationEvent) 
		{
			_character.speedX = 3;
		}
		
	}

}