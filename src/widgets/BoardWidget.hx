package widgets;

import flash.events.Event;
import openfl.events.MouseEvent;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import ru.stablex.ui.Dnd;
import ru.stablex.ui.events.WidgetEvent;
import ru.stablex.ui.layouts.Row;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Button;
import ru.stablex.ui.widgets.Text;
import ru.stablex.ui.widgets.Widget;


class BoardWidget extends Widget {
	private var menuButton:Button;
	private var caption:Text;
	
	public var text(default, set):String;
	function set_text(txt) {
		return caption.text = txt;
	}
	
	public function new() {
		super();
		
		layout = new Row();
		layout.as(Row).rows = [32, -1];
		
		addChild(UIBuilder.create(Widget, {
			defaults: 'SizableHeader',
			widthPt: 100,
			children: [
				caption = UIBuilder.create(Text, {
					text: 'test test test test test',
					w: 170,
					label: {
						wordWrap: true
					},
					top: 4,
					left: 4,
				}),
				menuButton = UIBuilder.create(Button, {
					defaults: 'SmallMenu',
					top: 4,
					left: 172,
				})
			]
		}));
		
		addChild(UIBuilder.create(Widget, {
			defaults: 'SizablePanel',
			widthPt: 100
		}));
		
		caption.addEventListener(WidgetEvent.RESIZE, onCaptionResize);
		
		this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
	}
	
	private function onCaptionResize(e:WidgetEvent):Void {
		this.layout.as(Row).rows[0] = this.caption.label.height + 6;
		this.refresh();
	}
	
	private function onMenuClick():Void {
		trace('click');
	}
	
	private function mouseDown(e:MouseEvent) {
		if (e.target == menuButton) return onMenuClick();
		
		Dnd.drag(this, Registry.dragRoot);
	}
	
}