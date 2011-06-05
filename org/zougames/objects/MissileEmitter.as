package org.zougames.objects 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Waldson Patrício
	 */
	public class MissileEmitter extends MovieClip
	{
		/*
		 * Guarda referencia a todos os mísseis criados pelo emissor
		 */
		private var _missiles:Array;
		
		/*
		 * Quantidade máximas de mísseis que podem estar ativos simultaneamente
		 * */
		private var _maxMissiles:Number;
		
		public function MissileEmitter() {
			this._missiles = new Array();
			if (stage)
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function checkColision(object:DisplayObject) {
			var _countMissiles = countMissiles;
			for (var i:Number; i < _countMissiles; i++) {
				if (this._missiles[i].colidingWith(object)) {
					this._missiles[i].onColide(object);
				}
			}
		}
		
		public function createMissile(speedX:Number = 0, speedY:Number = 0):Missile {
			if (!canCreateMissile)
				return null;
			var missile:SandalFire = new SandalFire();
			missile.x = this.x;
			missile.y = this.y;
			missile.speedX = speedX;
			missile.speedY = speedY;
			this._missiles.push(missile);
			return missile;
		}
		
		public function get canCreateMissile():Boolean {
			return countMissiles < maxMissiles;
		}
		
		public function get countMissiles() {
			return this._missiles.length;
		}
		
		public function get isEmpty() {
			return this.countMissiles == 0;
		}
		
		public function get maxMissiles():Number { 
			return _maxMissiles; 
		}
		
		public function set maxMissiles(value:Number):void 
		{
			_maxMissiles = value;
		}
		
		public function removeMissile(missile:Missile) {
			for (var i:Number = 0; i < countMissiles; i++) {
				var _miss = this._missiles[i];				
				if (_miss == missile) {
					this._missiles.splice(i, 1);
					delete(stage.removeChild(_miss));
					break;
				}
			}
		}
		
		public function clear() {
			if (this.isEmpty)
				return;
			while (!isEmpty) {
				var elem = this._missiles.pop();
				delete(stage.removeChild(elem));
			}
		}
		
		/**
		 * CCCV de Sadjow 
		 * */
		protected function init(e:Event = null)	{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, _update);
		}
		
		protected function _update(e:Event):void {			
			_cleanup();
		}
		
				
		private function _cleanup():void
		{		
			for (var i:Number = 0; i < countMissiles; i++) {
				var _miss = this._missiles[i];				
				if (!_miss.isOnStage)
					removeMissile(_miss);
			}			
		}
		
	}

}