package com.stirante.MazeMaster 
{
	/**
	 * ...
	 * @author Piotr Brzozowski
	 */
	public class MazeGen 
	{
		
		public var result:Array;
		
		public function MazeGen() 
		{
			
		}
		
		public function getMap():Map
		{
			return new Map(result);
		}
		
	}

}