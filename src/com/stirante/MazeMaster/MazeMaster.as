package com.stirante.MazeMaster
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Piotr Brzozowski
	 */
	public class MazeMaster extends Sprite 
	{	
		private static var thread:Thread;
		public function MazeMaster():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			thread = new Thread();
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function enterFrame(e:Event):void 
		{
			thread.run();
		}
		
		public static function getThread():Thread
		{
			return thread;
		}
		
	}
	
}