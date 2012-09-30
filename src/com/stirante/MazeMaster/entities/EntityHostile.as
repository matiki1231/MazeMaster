package com.stirante.MazeMaster.entities
{
	import com.stirante.MazeMaster.MazeMaster;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Piotr Brzozowski
	 */
	public class EntityHostile extends EntityLiving 
	{
		private var pathfind:Pathfinding;
		public function EntityHostile(texture1:Bitmap, name1:String) 
		{
			super(texture1, EntityType.HOSTILE, name1, Math.round(14 * Math.random())+1, Math.round(14 * Math.random())+1);
			
		}
		
		public function findPath():Path
		{
			return pathfind.findPath(Math.round(this.x / 16), Math.round(this.y / 16), Math.round(MazeMaster.getPlayer().x / 16), Math.round(MazeMaster.getPlayer().y / 16));
		}
		
	}

}