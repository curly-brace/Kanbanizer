package widgets;

import flash.events.Event;
import openfl.events.MouseEvent;
import openfl.geom.Rectangle;
import openfl.Lib;
import ru.stablex.ui.Dnd;
import ru.stablex.ui.events.DndEvent;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;

class Draggable extends Widget {
	private var prevParent:Widget;
	private var rect:Rectangle = new Rectangle();
	
	public function new() {
		super();

		this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
	}
	
	private function mouseDown(e:MouseEvent) {
		prevParent = this.wparent;
		
		Dnd.drag(this, Registry.dragRoot);
	}
}