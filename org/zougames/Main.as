package org.zougames
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import org.zougames.hud.Hud;
	import org.zougames.level.Level;
	import org.zougames.objects.Floor;

	/**
	 * ...
	 * @author Sadjow Leão
	 */
	[Frame(factoryClass = "br.zougames.Preloader")]
	[SWF(width="720", height="480")]
	public class Main extends MovieClip 
	{
		public var _level:Level;
		public var _hud:Hud;

		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
				
			// Atalhos.
			
			
			// Foco para o treclado.
			stage.focus = stage;
			
			
			
			// Eventos
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function enterFrameHandler(e:Event)
		{
			// TODO :: Algumas coisas.
		}

		

	}
	
	
}