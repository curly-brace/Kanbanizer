package;

import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;


class Main extends Sprite{
	private var rootStack:Widget;
	private var mainColor:UInt = 0x002b3c;
	
	public static function main() {
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
	
	public function new() {
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(event:Event) {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		stage.addEventListener(Event.RESIZE, onResize);

		//UIBuilder.regClass('ru.stablex.ui.skins.Aswing');
		UIBuilder.regClass('widgets.Accordion');
		UIBuilder.setTheme('theme');
		UIBuilder.init();
		
		rootStack = UIBuilder.buildFn('uis/root.xml')();
		stage.addChild(rootStack);
	}
	
	private function onResize(event:Event) {
		rootStack.resize(stage.stageWidth, stage.stageHeight);
	}
}