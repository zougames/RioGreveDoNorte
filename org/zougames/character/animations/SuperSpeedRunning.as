package org.zougames.character.animations 
{
	import flash.events.Event;
	import org.zougames.graphics.AnimationEvent;
	import org.zougames.objects.MissileEmitter;
	
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class SuperSpeedRunning extends CharacterAnimation
	{
		
		
		
		override protected function startedHandler(e:AnimationEvent) 
		{
			_character.speedX = 80;
		}
		
	}

}