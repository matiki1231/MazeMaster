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
			var temp:Block;
			for (var i:int = 0; i < map.length; i++)
			{
				for (var j:int = 0; j < map[0].length; j++)
				{
					temp = BlockList.getBlockById(map[i][j]);
					temp.y = 16 * i;
					temp.x = 16 * j;
					map1.addChild(temp);
				}
			}
			addChild(map1);
		}
		
		public function clear():void
		{
			removeChild(map1);
			map1 = new Sprite();
		}
		
		public function spawnEntity(entity:Entity, posX:int = -1, posY:int = -1, chunk:String = ""):void
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
		
		private function getBlockAt(x:Number, y:Number):Block 
		{
			tempX = Math.round(x / 16);
			tempY = Math.round(y / 16);
			return BlockList.getBlockToTest(map[tempY][tempX]);
		}
		
	}

}