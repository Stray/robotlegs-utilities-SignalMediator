package {
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import skins.SignalMediatorExampleSkin;
	
	public class SignalMediatorExample extends Sprite {

		public function SignalMediatorExample() {
			addChild(new SignalMediatorExampleSkin.ProjectSprouts() as DisplayObject);
			trace("SignalMediatorExample instantiated!");
		}
	}
}
