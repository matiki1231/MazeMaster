package com.stirante.MazeMaster.blocks
{
	import com.stirante.MazeMaster.entities.Entity;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	
	/**
	 * Abstrakcyjna klasa bloku
	 * @author Piotr Brzozowski
	 */
	public class Block extends Sprite
	{
		private var id:int;
		private var posX:int;
		private var posY:int;
		private var _walkable:Boolean;
		private var _name:String;
		private var texture:DisplayObject;
		/**
		 * Abstrakcyjna klasa bloku
		 * @param	id ID bloku
		 * @param	x Pozycja x w pliku tekstur
		 * @param	y Pozycja y w pliku tekstur
		 * @param	walkable True jeśli można iść po bloku, jeśli nie false
		 * @param	name Nazwa bloku
		 */
		public function Block(id:int, x:int, y:int, walkable:Boolean, name:String)
		{
			this.name = name;
			this.walkable = walkable;
			this.posY = y;
			this.posX = x;
			this.id = id;
			texture = Texture.getBlock(x, y);
			addChild(texture);
		}
		/**
		 * 
		 */
		public function get walkable():Boolean
		{
			return _walkable;
		}
		
		public function set walkable(value:Boolean):void
		{
			_walkable = value;
		}
		public function getName():String
		{
			return _name;
		}
		public function setName(value:String):void
		{
			_name = value;
		}
		
		public function setTexture(x:int, y:int):void
		{
			this.posY = y;
			this.posX = x;
			removeChild(texture);
			texture = Texture.getBlock(x, y);
			addChild(texture);
		}
		public function clone():Block {
			return new Block(id, posX, posY, walkable, name)
		}
		public function onEntityWalked(entity:Entity):void {
			
		}
		public function getId():int 
		{
			return id;
		}
	}

}