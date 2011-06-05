package org.zougames.gameplay 
{
	import flash.events.Event;
	import org.zougames.character.Character;
	import org.zougames.character.animations.CharacterAnimation;
	import org.zougames.character.CharacterStateManager;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Player extends Character
	{
		
		
		
		public function Player() 
		{
			_stateManager = new PlayerStateManager(this);
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
				case Keyboard.LEFT: // Seta da esquerda.
				case Keyboard.RIGHT: // Seta para direita.
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
				case Keyboard.LEFT: // Seta da esquerda.
					//speedX = -7;
				break;
				case Keyboard.UP: // Seta para cima
					if(jumpingCount == 0)
						gotoAndStop("jumping");
				break;
				case Keyboard.DOWN: // Seta para cima
						gotoAndStop("slide");
				break;
				case Keyboard.BACKSPACE: // Seta para cima
						gotoAndStop("capotando");
				break;
				case Keyboard.RIGHT: // Seta para direita.
					//speedX = 7;
					if (isOnFloor && currentFrameLabel != 'superspeedrunning')
						gotoAndStop('superspeedrunning');
				break;
				default:
			}
			
		}
		
		
		
	}

}