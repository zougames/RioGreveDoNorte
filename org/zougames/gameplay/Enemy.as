package org.zougames.gameplay 
{
	import org.zougames.character.Character;
	import flash.events.Event;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Enemy extends Character
	{
		
		public function Enemy() 
		{
			
		}
		
		override protected function init(e:Event = null)
		{
			super.init(e);
			speedX = 1;
		}
		
	}

}