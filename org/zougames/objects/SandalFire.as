package org.zougames.objects 
{
	/**
	 * ...
	 * @author ...
	 */
	public class SandalFire extends Missile
	{
		
		public function SandalFire() 
		{
			stage.addChild(this);
		}
		
		override protected function _update():void 
		{
			this.rotation += 30;
			trace("O");
		}
		
	}

}