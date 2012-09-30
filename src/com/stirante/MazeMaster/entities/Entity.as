package com.stirante.MazeMaster.entities
{
	import com.stirante.MazeMaster.MazeMaster;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Piotr Brzozowski
	 */
	public class Entity extends Sprite
	{
		public static var ids:int = 0;
		private var texture:Bitmap;
		private var type:String;
		private var _name:String;
		public var id:int;
		private var posX:int;
		private var posY:int;
		private var health:int;
		private var speed:Number;
		
		public function Entity(texture:Bitmap, type:String, name:String, posX:int, posY:int) 
		{
			this.posY = posY;
			this.posX = posX;
			id = ids;
			ids++;
			this.texture = texture;
			addChild(this.texture);
		}
		public function getType():String 
		{
			return "";
		}
		public function getName():String 
		{
			return _name;
		}
		
		public function getMaxHealth():int
		{
			return 0;
		}
		
		public function setHealth(val:int):void
		{
			health = val;
			if (isDead())
			{
				killEntity();
			}
		}
		
		protected function killEntity():void
		{
			MazeMaster.getInstance().onEntityKilled(this);
		}
		
		public function getHealth():int
		{
			return health;
		}
		
		public function heal(val:int):void
		{
			if (getHealth() + val > getMaxHealth())
			{
				setHealth(getMaxHealth());
			}
			else
			{
				setHealth(getHealth() + val);
			}
		}
		
		public function isDead():Boolean
		{
			if (getHealth() <= 0)
			{
				return true;
			}
			return false;
		}
		
		public function attack(val:Number):void
		{
			setHealth(getHealth() - val);
		}
		
		public function getSpeed():Number
		{
			return speed;
		}
		
		public function setSpeed(val:Number):void
		{
			speed = val;
		}
		
		public function prepareToSpawn():void
		{
			setHealth(getMaxHealth());
		}
		public function clone():Entity
		{
			return new Entity(texture, type, name, posX, posY, chunk);
		}
	}

}