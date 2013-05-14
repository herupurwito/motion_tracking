package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Video;
	import flash.media.Camera;
	import flash.geom.Point;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import CMotionTacker;
	import Box;
	
	/**
	 * ...
	 * @author heru
	 */
	[SWF(width="640", height="480", frameRate="30", backgroundColor="#FFFFFF")]
	public class Main extends Sprite 
	{
		private var mt:CMotionTacker;
		private var box1:Box, box2:Box;
		private var view:Bitmap;
		
		public function Main():void 
		{
			var c:Camera = Camera.getCamera();
			var v:Video = new Video(640, 480);
			v.attachCamera(c);
			v.scaleX = -1;
			v.x += v.width;
			addChild(v);
			mt = new CMotionTacker(v);
			view = new Bitmap(new BitmapData(640, 480));
			
			box1 = new Box(0x0000FF); addChild(box1); 
			box2 = new Box(0x00FF00); addChild(box2);
			box2.x = 320; box2.y = 240;
			
			v.addEventListener(Event.EXIT_FRAME, loop);
		}
		
		private function loop(e:Event):void {
			var p:Point = new Point();
			if (mt.track()) {
				p.x = 640-(mt.x + view.x);
				p.y = mt.y + view.y;	

				box1.x = p.x - view.x;
				box1.y = p.y;
				
				box1.addEventListener(Event.ENTER_FRAME, check);
			} 
		}
		
		private function check(e:Event):void {
			if (e.target.hitTestObject(box2)) {
				box2.color = 0x00AA00;
			} else	{
				box2.color = 0x00FF00;
			}
		}
		
	}
	
}
