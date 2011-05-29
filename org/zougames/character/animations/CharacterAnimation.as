package org.zougames.character.animations 
{
	import flash.events.Event;
	import org.zougames.character.Character;
	import org.zougames.graphics.Animation;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class CharacterAnimation extends Animation
	{
		
		private var _character:Character;
		
		public function CharacterAnimation() 
		{
			
		}
		
		override protected function init(e:Event = null)
		{
			super.init(e);
			
			_character = Character(parent);
		}
		
		public function get character()
		{
			return _character;
		}
		
		public function set character(value:Character)
		{
			_character = value;
		}
		
	}

}