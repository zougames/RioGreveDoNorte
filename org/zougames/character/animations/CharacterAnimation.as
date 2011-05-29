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
		
		protected var _character:Character;
		
		public function CharacterAnimation() 
		{
			
		}
		
		override protected function init(e:Event = null)
		{
			
			_character = Character(parent);
			
			super.init(e);
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