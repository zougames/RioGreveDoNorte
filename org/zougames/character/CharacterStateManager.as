package org.zougames.character 
{
	import flash.display.MovieClip;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	import flash.utils.getDefinitionByName;
	import org.zougames.character.animations.Capotando;
	import org.zougames.character.animations.CharacterAnimation;
	import org.zougames.character.animations.Dead;
	import org.zougames.character.animations.ItenHit;
	import org.zougames.character.animations.Jumping;
	import org.zougames.character.animations.Landing;
	import org.zougames.character.animations.MidAir;
	import org.zougames.character.animations.Running;
	import org.zougames.character.animations.Slide;
	import org.zougames.character.animations.SuperSpeedRunning;
	import org.zougames.character.animations.Throwing;
	import org.zougames.character.animations.Tropecando;
	
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class CharacterStateManager 
	{
		
		public var CAPOTANDO:String;
		public var DEAD:String;
		public var ITEN_HIT:String;
		public var JUMPING:String;
		public var LANDING:String;
		public var MID_AIR:String;
		public var RUNNING:String;
		public var SLIDE:String ;
		public var SUPER_SPEED_RUNNING:String;
		public var THROWING:String;
		public var TROPECANDO:String;
		
		protected var _character:Character;
		
		protected var _currentAnimation:CharacterAnimation;
		
		protected var _animations:Array;
		private   var _animationsClasses:Array;
		
		public function CharacterStateManager(c:Character, prefix:String) 
		{
			this._character = c;
			_animations = new Array();
			_animationsClasses = new Array();
			initAnimationsNames(prefix);
			instanceAnimations();
		}
		
		public function initAnimationsNames(prefix:String)
		{
			
			CAPOTANDO 			= prefix + "Capotando";
			DEAD 				= prefix + "Dead";
			ITEN_HIT 			= prefix + "ItenHit";
			JUMPING 			= prefix + "Jumping";
			LANDING 			= prefix + "Landing";
			MID_AIR 			= prefix + "MidAir";
			RUNNING 			= prefix + "Running";
			SLIDE 				= prefix + "Slide";
			SUPER_SPEED_RUNNING = prefix + "SuperSpeedRunning";
			THROWING 			= prefix + "Throwing";
			TROPECANDO 			= prefix + "Tropecando";
			
			// Inicializa arrays de classes.
			_animationsClasses = [
				CAPOTANDO,
				DEAD,
				ITEN_HIT,
				JUMPING,
				LANDING,
				MID_AIR,
				RUNNING,
				SLIDE,
				SUPER_SPEED_RUNNING,
				THROWING,
				TROPECANDO
			];
			
		}
		
		public function instanceAnimations()
		{
			for (var i:* in _animationsClasses)
			{
				var aName = _animationsClasses[i];
				
			}
		}
		
		public function addAnimation(nome:String, a:CharacterAnimation)
		{
			_animations[nome] = a;
		}
		
		public function removeAnimation(nome:String)
		{
			delete(_animations[nome]);
		}
		
		
		public function set currentAnimation(value:CharacterAnimation)
		{
			if (value.canFrom(currentAnimation))
			{
				_currentAnimation = value;
			}
		}
		
		public function get currentAnimation()
		{
			return _currentAnimation;
		}
		
	}

}