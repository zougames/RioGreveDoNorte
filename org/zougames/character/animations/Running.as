package org.zougames.character.animations 
{
	import org.zougames.graphics.AnimationEvent;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Running extends CharacterAnimation
	{
		

		public function Running() 
		{
			
		}
		
		override protected function startedHandler(e:AnimationEvent) 
		{
			_character.speedX = 10;
		}
		
		
		
		
	}

}