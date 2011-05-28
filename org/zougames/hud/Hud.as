package org.zougames.hud 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Hud extends MovieClip
	{
		
		// Botões
		public var _botaoAcao: BotaoAcao;
		public var _botaoBaixo:BotaoBaixo;
		public var _botaoCima:BotaoCima;
		
		public var _caixaItem:CaixaItem;
		
		public var _distancia:Distancia;
		
		public var _life:Life;
		
		public var _velocimetro:Velocimetro;
		
		
		
		
		public function Hud() 
		{
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		public function enterFrameHandler(e:Event)
		{
			// atualizar objetos do hud
			// _velocimentro.enterFrame(e);
		}
		
	}

}