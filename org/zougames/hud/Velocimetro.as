package org.zougames.hud 
{
	import org.zougames.gameplay.Player;
	import org.zougames.Main;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Velocimetro extends HudObject
	{
		
		private var _player:Player;
		
		public function Velocimetro() 
		{
			
		}
		
		public function set player(value:Player)
		{
			_player = value;
		}
		
	}

}