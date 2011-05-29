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
			addEventListener(Event.REMOVED_FROM_STAGE, tearDown);
			
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
			
			// Primeiro frame occore antes de adicionar o evento.
			enterFrameHandler();
		}
		
		public function enterFrameHandler(e:Event = null) 
		{
			
			if (currentFrame == 1 && _enterFrameCount == 0)
			{
				trace('started: ' + this);
				dispatchEvent(new AnimationEvent(AnimationEvent.STARTED));
			}
			
			if (currentFrame == totalFrames)
			{
				
				if (_isLoop)
				{ 
					_loopCount++;
					trace('loop: ' + this);
					dispatchEvent(new AnimationEvent(AnimationEvent.LOOP));
				} 
				else
				{
					stop();
					trace('ended: ' + this);
					dispatchEvent(new AnimationEvent(AnimationEvent.ENDED));
				}
					
			}
			
			_enterFrameCount++;
		}
		
		protected function startedHandler(e:AnimationEvent)
		{
			
		}
		
		protected function endedHandler(e:AnimationEvent)
		{
			
		}
		
		protected function loopHandler(e:AnimationEvent)
		{
			
		}
		
		protected function tearDown(e:Event)
		{
			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
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