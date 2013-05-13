package  
{
	import flash.display.Sprite;
	/**
	 * Box
	 * Purpose: Box object
	 * @author Shiu
	 */
	public class Box extends Sprite
	{
		private var _col:Number, _w:Number, _h:Number;
		
		public function Box(color:Number, width:Number = 30, height:Number = 30) {
			_col = color;  _w = width; _h = height; 
			draw();
		}
		
		private function draw():void {
			graphics.lineStyle(2);
			graphics.beginFill(_col);
			graphics.drawRect(_w * -0.5, _h * -0.5, _w, _h);
			graphics.endFill();
		}
		
		public function set color (value:Number):void {
			_col = value;
			graphics.clear()
			draw();
		}
	}

}