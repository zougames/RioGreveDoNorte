package org.zougames.character 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import org.zougames.level.Level;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Character extends MovieClip
	{
		
		private var _speedX:Number;
		private var _speedY:Number;
		
		private var _life:Number;
		
		public var _level:Level;
		
		
		public function Character() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event = null)
		{
			stop();
		}
		
		public function reset()
		{
			//_speedX = 0;
			_speedY = 0;
		}
		
		public function enterFrame(e:Event) {
			// Movimentação
			x += speedX;
			y += speedY;
		}
		
		public function get isOnFloor() {
			return y == _level._floor.y;
		}
		
		public function get isDead() {
			return _life <= 0;
		}
		
		public function get level():Level
		{
			return _level;
		}
		
		public function set level(value:Level)
		{
			_level = value;
		}
		
		public function get speedX()
		{
			return _speedX;
		}
		
		public function set speedX(value:Number)
		{
			_speedX = value;
		}
		
		public function get speedY()
		{
			return _speedY;
		}
		
		public function set speedY(value:Number)
		{
			_speedY = value;
		}
		
	}

}