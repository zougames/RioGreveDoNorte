package org.zougames
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import org.zougames.level.Level;

	/**
	 * ...
	 * @author Sadjow Leão
	 */
	[Frame(factoryClass = "br.zougames.Preloader")]
	[SWF(width="960", height="640")]
	public class Main extends MovieClip 
	{
		public var _startMarker:StartMarker;
		public var _player:Player;
		public var _boundaries:Boundaries;
		
		private var _vy:Number;
		
		private var _vx:Number;

		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Valores por default.
			_startMarker.visible = false;
			_vx = 0;
			_vy = 0;
			
			// Foco para o treclado.
			stage.focus = stage;
			
			// Eventos
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
		private function enterFrameHandler(e:Event)
		{
			// Gravidade
			_vy += 2;
			
			
			// Movimentação
			_player.x += _vx;
			_player.y += _vy;
			
			
			// Processamento de colisões.
			processColisions();
			
			
			// Movimentação do stage.
			scrollStage();
		}
		
		private function keyUpHandler(e:KeyboardEvent)
		{
			switch(e.keyCode)
			{
				case 37: // Seta da esquerda.
				case 39: // Seta para direita.
					_vx = 0;
				break;
				
				default:
			}
		}
		
		private function keyDownHandler(e:KeyboardEvent)
		{
			switch(e.keyCode)
			{
				case 37: // Seta da esquerda.
					_vx = -7;
				break;
				case 38: // Seta para cima
					_vy = -20;
				break;
				case 39: // Seta para direita.
					_vx = 7;
				break;
				default:
			}
			
		}
		
		private function processColisions():void
		{
			// Quando o jogador estiver caindo
			if(_vy > 0)
			{
				// Verifica se o jogador caiu para fora  do stage;
				if (_player.y > stage.stageHeight)
				{
					_player.x = _startMarker.x;
					_player.y = _startMarker.y;
					_boundaries.x = 0;
					_boundaries.y = 0;
					_vy = 0;
					_vx = 0;
				}
				// Se não estiver.
				else 
				{
					var collision:Boolean = false;
					
					if (_boundaries.hitTestPoint(_player.x, _player.y, true))
					{
						collision = true;
					}
					
					if (collision)
					{
						while (collision)
						{
							_player.y -= 0.1;
							
							collision = false;
							
							if (_boundaries.hitTestPoint(_player.x, _player.y, true))
							{
								collision = true;
							}
						}
						_vy = 0;
					}
					
				}
			}
		}
		
		private function scrollStage() 
		{
			_boundaries.x += (stage.stageWidth * 0.5) - _player.x;
			_player.x = stage.stageWidth * 0.5;
			_boundaries.y += (stage.stageHeight * 0.5) - _player.y;
			_player.y = stage.stageHeight * 0.5;
		}

	}
	
	
}