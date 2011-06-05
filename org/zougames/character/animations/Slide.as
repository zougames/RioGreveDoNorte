package org.zougames.character.animations 
{
	import org.zougames.graphics.AnimationEvent;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Slide extends CharacterAnimation
	{
		
		public function Slide() 
		{
			isLoop = false;
		}
		
		override protected function endedHandler(e:AnimationEvent)
		{
			stop();
			this._character.gotoAndStop('running');
		}
		
	}

}