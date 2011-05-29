package org.zougames.graphics 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class AnimationEvent extends Event
	{
		
		public static const STARTED:String = 'STARTED';
		public static const LOOP:String = 'LOOP';
		public static const ENDED:String = 'END';
		
		public function AnimationEvent( type:String ) {
			super( type, true , false );
		}
		
	}

}