package org.zougames.level 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import org.zougames.character.Character;
	import org.zougames.gameplay.Enemy;
	import org.zougames.gameplay.Player;
	import org.zougames.level.utils.StartMarker;
	import org.zougames.objects.Floor;
	
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Level extends MovieClip
	{
		private var _gravity:Number;
		
		public var _startMarker:StartMarker;
		public var _player:Player;
		public var _enemy:Enemy;
		
		public var _characters:Array;
		
		public var _floor:Floor;
		
		public function Level() 
		{
			// Valores default
			
			_gravity = 1;
			_characters = new Array();
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init():void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Valores por default.
			_startMarker.visible = false;
			
			// Eventos do level.
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			// Personagens padrões
			_characters.push(_player, _enemy);
			
			for (var i:* in _characters)
				_characters[i].level = this;
			
			// Reiniciar as posições.
			reset();
		}
		
		private function reset():void
		{
			
			for (var i:* in _characters)
				_characters[i].reset();
			
			_player.x = _startMarker.x;
			_player.y = _startMarker.y;

			x = 0;
			y = 0;
		}
		
		private function enterFrameHandler(e:Event)
		{
			
			// Atualiza os personagens
			for (var i:* in _characters)
			{
				// Gravidade
				_characters[i].speedY += _gravity;
				
				// Atualiza o personagem.
				_characters[i].enterFrame(e);
			}
				
			
			
			// Processamento de colisões.
			processColisions();
			
			// Movimentação do stage.
			scrollStage();
		}
		
		private function processColisions():void
		{
			
			for (var i:* in _characters)
			{
				var c:Character = _characters[i];
				
				// Quando o jogador estiver caindo
				if(c.speedY > 0)
				{
					// Verifica se o jogador caiu para fora  do stage;
					if (c.y > stage.stageHeight)
					{
						reset();
					}
					// Se não estiver.
					else 
					{
						if (c.y >= _floor.y) {
							c.y = _floor.y;
							c.speedY = 0;
						}
					}
				}
				
				
			}
			
			
		}
		
		private function scrollStage() 
		{
			
			this.x +=  -_player.speedX;
			//_player.x = stage.stageWidth * 0.5;
			//this.y += (stage.stageHeight * 0.5) - _player.y;
			//_player.y = stage.stageHeight * 0.5;
			
		}
		
		
	}

}