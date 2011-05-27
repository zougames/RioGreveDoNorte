package org.zougames
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.zougames.level.Level;

	/**
	 * ...
	 * @author Sadjow Leão
	 */
	[Frame(factoryClass="br.zougames.Preloader")]
	public class Main extends Sprite 
	{
		
		private level:Level;

		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// entry point
			level = new Level();
			
			stage.addChild(level);
			
		}

	}

}