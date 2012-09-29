package com.stirante.MazeMaster 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Piotr Brzozowski
	 */
	public class Map
	{
		private var map1:Sprite;
		private var map:Array
		private var entities:Array;
		private var tempX:int;
		private var tempY:int;
		private var blocks:Array;
		
		public function Map(map:Array) 
		{
			this.map = map;
		}
		
		
		public function renderMap():void
		{
			if (map1 != null)
			{
				clear();
			}
			else
			{
				map1 = new Sprite();
			}
			for (var i:int = 0; i < map.length; i++)
			{
				for (var j:int = 0; j < map[0].length; j++)
				{
					blocks[i][j] = BlockList.getBlockById(map[i][j]);
					blocks[i][j].y = 16 * i;
					blocks[i][j].x = 16 * j;
					map1.addChild(blocks[i][j]);
				}
			}
			addChild(map1);
		}
		
		public function clear():void
		{
			removeChild(map1);
			map1 = new Sprite();
		}
		
		public function spawnEntity(entity:Entity, posX:int = -1, posY:int = -1):void
		{
			if (posX == -1 && posY == -1) {
				posX = Math.round(Math.random() * 14) + 1;
				posY = Math.round(Math.random() * 14) + 1;
			}
			entities.push(entity);
			addChild(entities.push(entity));
		}
		
		public function removeEntity(entity:Entity):void 
		{
			entity.setHealth(0);
			for (var i:int = 0; i < entities.length; i++) 
			{
				if (entities[i] == entity) {
					entities[i] = null;
				}
			}
		}
		
		public function collideWith(corner:Object):Boolean 
		{
			if (!getBlockAt(corner.x, corner.y).walkable) {
				return true;
			}
			return false;
		}
		
		public function getBlockAt(corner:Object):Block 
		{
			tempX = Math.round(corner.x / 16);
			tempY = Math.round(corner.y / 16);
			return blocks[tempY][tempX];
		}
		
	}

}