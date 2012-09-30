package com.stirante.MazeMaster 
{
	/**
	 * ...
	 * @author Piotr Brzozowski
	 */
	public class Thread 
	{
		private var tasks:Vector.<Task>;
		public function Thread() 
		{
			
		}
		/**
		 * Metoda wykonywana 50 razy na sekundę
		 */
		public function run():void
		{
			for (var i:int = 0; i < tasks.length; i++) 
			{
				if (tasks[i] != null)
				{
					tasks[i].run();
				}
			}
		}
		/**
		 * Ustawia zadanie do wykonania co podany interwał, ile razy chcesz.
		 * @param	method Metoda do wykonania
		 * @param	interval Interwał pomiędzy wykonaniem. 50 to jedna sekunda
		 * @param	repeat Ile razy ma zostac powtórzone. 0 to w nieskończoność
		 * @return ID zadania
		 */
		public function sheduleRepeatingTask(method:Function, interval:int, repeat:int = 0):int
		{
			var task:Task = new Task(method, interval, repeat, tasks.length);
			tasks.push(task);
			return task.getId();
		}
		/**
		 * Ustawia zadanie do wykonania za podany interwał
		 * @param	method Metoda do wykonania
		 * @param	interval Interwał; 50 to jedna sekunda
		 * @return ID zadania
		 */
		public function sheduleTask(method:Function, interval:int):int
		{
			var task:Task = new Task(method, interval, -1, tasks.length);
			tasks.push(task);
			return task.getId();
		}
		/**
		 * Anuluje zadanie o podanym ID
		 * @param	taskId ID zadania do anulowania
		 */
		public function cancelTask(taskId:int):void
		{
			tasks[taskId] = null;
		}
	}

}