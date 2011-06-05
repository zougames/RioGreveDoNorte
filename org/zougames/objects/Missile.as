package org.zougames.objects 
{
	import flash.display.DisplayObject;
	import flash.events.*;
	import org.zougames.graphics.*;
	/**
	 * ...
	 * @author Waldson Patrício 
	 */
	public class Missile extends Animation 
	{
		
		private var _speedX:Number;
		private var _speedY:Number;
								
		public function Missile() {
			this._speedX = 0;
			this._speedY = 0;
			this.x = 0;
			this.y = 0;
			this.isLoop  = false; 
			super();
		}
		
		public override function enterFrameHandler(e:Event = null) {
			this._updatePosition();
			this._update();			
		}
		
		public function colidingWith(object:DisplayObject):Boolean {
			return this.hitTestObject(object);
		}
		
		public function onColide(other:DisplayObject) {	}
		
		protected function _update():void	{}
		
		private function _updatePosition():void	{
			this.x += this._speedX;
			this.y += this._speedY;
		}
		
					
		public function get isOnStage():Boolean { 
			//PS: ponto de referência central
			var _x:Number = this.x - (this.width / 2);
			var _y:Number = this.y - (this.height / 2);			
			return 	   _x < stage.stageWidth 
					&& _y < stage.stageHeight 
					&& _x + width > 0 
					&& _y + height > 0;
		}	
		
		public function get speedX():Number { 
			return _speedX; 
		}
		
		public function set speedX(value:Number):void {
			_speedX = value;
		}
		
		public function get speedY():Number { 
			return _speedY; 
		}
		
		public function set speedY(value:Number):void 
		{
			_speedY = value;
		}
	}
}