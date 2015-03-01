package {
	import flash.display.*;
	import flash.events.*;
	
	public class mcBrick extends MovieClip{
		private var _root:MovieClip;
		public function mcBrick(){
			addEventListener(Event.ADDED, beginClass);
			addEventListener(Event.ENTER_FRAME, enterFrameEvents);
		}
		
		private function beginClass(event:Event):void{
			_root = MovieClip(root);
			_root.brickAmt ++;
		}
		
		private function enterFrameEvents(event:Event):void{
			
			if(_root.gameOver){
				this.parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, enterFrameEvents);
			}
			
			if(this.hitTestObject(_root.mcBall)){
				_root.ballYSpeed *= -1;
				_root.brickAmt --;
				this.parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, enterFrameEvents);
			}
		}
	}
}