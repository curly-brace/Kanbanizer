package;

import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Button;
import ru.stablex.ui.widgets.Scroll;
import ru.stablex.ui.widgets.Widget;
import widgets.Accordion;
import widgets.Accordion.AccordionEvent;
import widgets.BoardWidget;
import widgets.PopupMenu;

class Main extends Sprite{
	private var rootStack:Widget;
	private var desktopMenu:PopupMenu;
	
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

		UIBuilder.regClass('widgets.BetterScroll');
		UIBuilder.regClass('widgets.Accordion');
		UIBuilder.regClass('widgets.GridBox');
		UIBuilder.regClass('widgets.BoardWidget');
		UIBuilder.regEvent('add',  'widgets.AccordionEvent.ADD', 'widgets.AccordionEvent');
		UIBuilder.regEvent('edit',  'widgets.AccordionEvent.EDIT', 'widgets.AccordionEvent');
		UIBuilder.regEvent('remove',  'widgets.AccordionEvent.REMOVE', 'widgets.AccordionEvent');
		
		UIBuilder.setTheme('theme');
		UIBuilder.init();
		
		rootStack = UIBuilder.buildFn('uis/root.xml')();
		stage.addChild(rootStack);
		
		UIBuilder.get('scroll').as(Scroll).refresh();
		UIBuilder.get('scroll').as(Scroll).hBar = null;
		
		Registry.dragRoot = UIBuilder.get('desktop');
	}
	
	private function onResize(event:Event) {
		rootStack.resize(stage.stageWidth, stage.stageHeight);
		UIBuilder.get('scroll').as(Scroll).hBar = null;
	}
	
	private function menuClicked(x:Float, y:Float) {
		if (desktopMenu == null) {
			desktopMenu = UIBuilder.create(PopupMenu, {
				w: 250,
				top: 40,
			});
			
			desktopMenu.setItems([
				'Settings',
				'Import from Trello',
				'Check for updates'
			]);
			
			desktopMenu.handler = function(res) {
				trace(res);
			};
		}

		desktopMenu.left = Registry.dragRoot.w - 255;
		
		desktopMenu.show();
	}
}