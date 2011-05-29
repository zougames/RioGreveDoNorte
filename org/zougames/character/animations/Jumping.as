package org.zougames.character.animations 
{
	import org.zougames.graphics.AnimationEvent;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Jumping extends CharacterAnimation
	{
		
		public function Jumping() 
		{
			isLoop = false;
		}
		
		override protected function startedHandler(e:AnimationEvent) 
		{
			_character.jumpingCount++;	
			_character.speedY = -15;
		}
		
		override protected function endedHandler(e:AnimationEvent)
		{
			stop();
			this._character.gotoAndStop('midair');
		}
		
		
	}

}