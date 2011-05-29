package org.zougames.graphics 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Animation extends MovieClip
	{
		
		private var _isLoop:Boolean = true;
		
		private var _loopCount:Number = 0;
		private var _enterFrameCount:Number = 0;
		
		public function Animation() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event = null)
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			
			// Eventos
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			addEventListener(AnimationEvent.STARTED, startedHandler);
			addEventListener(AnimationEvent.ENDED, 	endedHandler);
			addEventListener(AnimationEvent.LOOP, loopHandler);
			
		}
		
		public function enterFrameHandler(e:Event) 
		{
			
			if (currentFrame == 1 && _enterFrameCount == 0)
			{
				dispatchEvent(new AnimationEvent(AnimationEvent.STARTED));
			}
			
			if (currentFrame == totalFrames)
			{
				
				if (_isLoop)
				{ 
					_loopCount++;
					dispatchEvent(new AnimationEvent(AnimationEvent.LOOP));
				} 
				else
				{
					stop();
					dispatchEvent(new AnimationEvent(AnimationEvent.ENDED));
				}
					
			}
			
			_enterFrameCount++;
		}
		
		protected function startedHandler(e:AnimationEvent)
		{
			trace('started');
		}
		
		protected function endedHandler(e:AnimationEvent)
		{
			trace('ended');
		}
		
		protected function loopHandler(e:AnimationEvent)
		{
			trace('loop');
		}
		
		public function get isLoop() {
			return _isLoop;
		}
		
		public function set isLoop(value:Boolean)
		{
			_isLoop = value;
		}
		
	}

}