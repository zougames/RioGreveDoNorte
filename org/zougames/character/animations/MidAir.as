package org.zougames.character.animations 
{
	import org.zougames.graphics.AnimationEvent;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class MidAir extends CharacterAnimation
	{
		
		public function MidAir() 
		{
			
		}
		
		override protected function loopHandler(e:AnimationEvent)
		{
			if (_character.isFalling)
			{
				stop();
				_character.gotoAndStop('landing');
			}
		}
		
	}

}