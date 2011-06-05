package org.zougames.character.animations 
{
	import org.zougames.graphics.AnimationEvent;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Capotando extends CharacterAnimation 
	{
		
		public function Capotando() 
		{
			
		}
		
		override protected function startedHandler(e:AnimationEvent) 
		{
			_character.speedX = _character.speedX * 0.5;
		}
		
		
		
	}

}