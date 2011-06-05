package org.zougames.character 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import org.zougames.character.animations.CharacterAnimation;
	import org.zougames.graphics.Animation;
	import org.zougames.level.Level;
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Character extends MovieClip 
	{
		
		private var _speedX:Number;
		private var _speedY:Number;
		
		private var _life:Number;
		
		public var _level:Level;
		
		private var _jumpingCount:Number = 0;
		
		// Gerencia o estado do personagem
		private var _stateManager:CharacterStateManager;
		
		
		public function Character() 
		{
			
			_stateManager = new CharacterStateManager(this, "org.zougames.character.animations.");
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event = null)
		{
			// Pausa o MovieClip do personagem
			stop();
			
			// Inicializa as animações
		}
		
		public function reset()
		{
			//_speedX = 0;
			_speedY = 0;
		}
		
		public function enterFrame(e:Event)
		{
			
			// Movimentação
			x += speedX;
			y += speedY;
			
			if (isOnFloor)
				jumpingCount = 0;
			
		}
		
		public function setCurrentAnimation(a:CharacterAnimation)
		{
			_stateManager.currentAnimation = a;
		}
		
		public function get isOnFloor()
		{			
			return y >= _level._floor.y;
		}
		
		public function get isDead() {
			return _life <= 0;
		}
		
		public function get isFalling() {
			return _speedY > 0;
		}
		
		public function get level():Level
		{
			return _level;
		}
		
		public function set level(value:Level)
		{
			_level = value;
		}
		
		public function get jumpingCount()
		{
			return _jumpingCount;
		}
		
		public function set jumpingCount(v:Number)
		{
			_jumpingCount = v;
		}
		
		public function get speedX()
		{
			return _speedX;
		}
		
		public function set speedX(value:Number)
		{
			_speedX = value;
		}
		
		public function get speedY()
		{
			return _speedY;
		}
		
		public function set speedY(value:Number)
		{
			_speedY = value;
		}
		
		
	}

}