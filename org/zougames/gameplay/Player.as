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
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
		
		override public function enterFrame(e:Event)
		{
			super.enterFrame(e);
		}
		
		
		private function keyUpHandler(e:KeyboardEvent)
		{
			switch(e.keyCode)
			{
				case 37: // Seta da esquerda.
				case 39: // Seta para direita.
					//speedX = 0;
					if (currentFrameLabel == 'superspeedrunning')
						gotoAndStop('running');
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
					if(jumpingCount == 0)
						gotoAndStop("jumping");
				break;
				case 39: // Seta para direita.
					//speedX = 7;
					if (isOnFloor && currentFrameLabel != 'superspeedrunning')
						gotoAndStop('superspeedrunning');
				break;
				default:
			}
			
		}
		
		
		
	}

}