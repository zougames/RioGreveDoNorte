package org.zougames.level 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import org.zougames.character.Character;
	import org.zougames.gameplay.Enemy;
	import org.zougames.gameplay.Player;
	import org.zougames.level.layers.FarAwayBuildings;
	import org.zougames.level.layers.FarFarAwayBuildings;
	import org.zougames.level.utils.StartMarker;
	import org.zougames.objects.Floor;
	
	/**
	 * ...
	 * @author Sadjow Leão
	 * @author Waldson Patrício
	 */
	public class Level extends MovieClip
	{
		private var _gravity:Number;
		
		public var _startMarker:StartMarker;
		public var _player:Player;
		public var _enemy:Enemy;
		
		public var _characters:Array;
		
		public var _floor:Floor;
		
		private var _layers:Array;
		
		public function Level() 
		{
			// Valores default
			
			_gravity 	= 1;
			_characters = new Array();
			_layers	    = new Array();
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Valores por default.
			_startMarker.visible = false;
			
			//adiciona as camadas de bg
			_insertLayers();
			
			// Eventos do level.
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			// Personagens padrões
			_characters.push(_player, _enemy);
			
			for (var i:* in _characters)
				_characters[i].level = this;
			
			// Reiniciar as posições.
			reset();
			
		}
		
		private function _insertLayers():void
		{
			var layer1:LevelLayer = new FarFarAwayBuildings();
							
			var layerFarFarAwayBuildingsX = this.x;
			var layerFarAwayBuildingsX    = this.x;
			
			//adicionando as camadas dos prédios tão tão distantes
			var ffab:FarFarAwayBuildings = new FarFarAwayBuildings();
			
			var totalTilesFfab = Math.ceil(stage.stageWidth / ffab.width) + 1;
			var offsetFfab     = totalTilesFfab * ffab.width;
			for (var i:Number = 0; i < totalTilesFfab; i++) {
				var lffab = new FarFarAwayBuildings();
				lffab.x      = layerFarFarAwayBuildingsX;
				lffab.offset = offsetFfab;
				layerFarFarAwayBuildingsX += lffab.width;
				_layers.push(lffab);
			}			
			ffab.x 	 	= layerFarFarAwayBuildingsX;
			ffab.offset = offsetFfab;
			this._layers.push(ffab);
			
			
			//adicionando prédios muito distantes
			var fab:FarAwayBuildings = new FarAwayBuildings();
			
			var totalTilesFab = Math.ceil(stage.stageWidth / fab.width) + 1;
			var offsetFab     = totalTilesFab * fab.width;
			for (i = 0; i < totalTilesFab; i++) {
				var lfab = new FarAwayBuildings();
				lfab.x      = layerFarAwayBuildingsX;
				lfab.offset = offsetFab;
				layerFarAwayBuildingsX += lfab.width;
				_layers.push(lfab);
			}			
			fab.x = layerFarAwayBuildingsX;
			fab.offset = offsetFab;
			this._layers.push(fab);
			
			for (var j:* in _layers) {
				stage.addChild(_layers[j]);
				stage.setChildIndex(_layers[j], j);
			}
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
			for (var i:* in _layers) {				
				_layers[i].updatePosition(_player.speedX);				
				if ((_layers[i].x + _layers[i].width) < 0)
					_layers[i].onOutOfStage();
			}
			
			//_player.x = stage.stageWidth * 0.5;
			//this.y += (stage.stageHeight * 0.5) - _player.y;
			//_player.y = stage.stageHeight * 0.5;
			
		}
		
		
	}

}