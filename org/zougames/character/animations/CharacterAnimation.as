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
			//_character.currentAnimation = this;
			
			super.init(e);
		}
		
		override protected function tearDown(e:Event)
		{
			super.tearDown(e);
			// _character.currentAnimation = null;
		}
		
		public function canFrom(other:CharacterAnimation)
		{
			return true;
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