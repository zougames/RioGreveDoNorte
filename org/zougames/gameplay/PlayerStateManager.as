package org.zougames.gameplay 
{
	import org.zougames.character.CharacterStateManager;
	
	/**
	 * ...
	 * @author Sadjow Leão
	 */
	public class PlayerStateManager extends CharacterStateManager 
	{
		
		private const PREFIX:String = "org.zougames.gameplay.player.animations.";
		
		public function PlayerStateManager(c:Player) 
		{
			super(c, "org.zougames.gameplay.player.animations.");
		}
	}

}