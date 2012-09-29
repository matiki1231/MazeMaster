package com.stirante.MazeMaster
{
	
	/**
	 * ...
	 * @author Piotr Brzozowski
	 */
	public class BlockList
	{
		static private var blockList:Vector.<Block>;
		
		public static function init():void
		{
			blockList = new Vector.<Block>();
			blockList.push();
		}
		
		public static function getBlockById(id:int):Block
		{
			return blockList[id].clone();
		}
		public static function getBlockByName(str:String):Block
		{
			for (var i:int = 0; i < blockList.length; i++) 
			{
				if (str == blockList[i].name) {
					return blockList[i].clone();
				}
			}
			return null;
		}
		
		static public function getBlockToTest(id:int):Block 
		{
			return blockList[id];
		}
	
	}

}