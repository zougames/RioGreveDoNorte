package org.zougames.character 
{
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class Character 
	{
		
		private var _speed:Number;
		
		private var _life:Number;
		
		public function Character() 
		{
			
		}
		
		public function get life() {
			return this.life;
		}
		
		public function set life(life:Number) {
			 this.life = life;
		}
		
		public function get isDead() {
			return life <= 0;
		}
		
	}

}