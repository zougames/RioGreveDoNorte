package org.zougames.gameplay 
{
	import flash.events.Event;
	import org.zougames.character.Character;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Player extends Character
	{
		
		public function Player() 
		{
			
		}
		
		override protected function init(e:Event = null)
		{
			super.init(e);
			speedX = 1;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
		
		override public function enterFrame(e:Event)
		{
			super.enterFrame(e);
			if (isOnFloor)
			{
				gotoAndStop("correndo");
			}
		}
		
		
		private function keyUpHandler(e:KeyboardEvent)
		{
			switch(e.keyCode)
			{
				case 37: // Seta da esquerda.
				case 39: // Seta para direita.
					//speedX = 0;
				break;
				
				default:
			}
		}
		
		private function keyDownHandler(e:KeyboardEvent)
		{
			switch(e.keyCode)
			{
				case 37: // Seta da esquerda.
					//speedX = -7;
				break;
				case 38: // Seta para cima
					speedY = -20;
					gotoAndStop("pulando");
				break;
				case 39: // Seta para direita.
					//speedX = 7;
				break;
				default:
			}
			
		}
		
		
		
	}

}