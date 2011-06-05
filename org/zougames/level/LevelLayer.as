package org.zougames.level 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Waldson Patrício
	 */
	public class LevelLayer extends MovieClip
	{
		private var _threshold:Number;
		private var _offset:Number;
		public function LevelLayer() 
		{
			super();			
		}						
		public function updatePosition(factor:Number) {						
			this.x += Math.ceil(factor * threshold) * -1;
		}
		
		public function get threshold():Number { 
			return _threshold; 
		}
		
		public function set threshold(value:Number):void 
		{			
			_threshold = value;
		}
		
		public function get offset():Number { 
			return _offset; 
		}
		
		public function set offset(value:Number):void {
			_offset = value;
		}
		
		public function onOutOfStage() {
			this.x += this.offset;
		}
	}

}