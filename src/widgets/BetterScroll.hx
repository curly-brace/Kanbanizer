package widgets;
import openfl.events.Event;
import ru.stablex.ui.Dnd;
import ru.stablex.ui.widgets.Scroll;

class BetterScroll extends Scroll {
	// defines area in which scroll is fired when you drag something in it
	// scroll.h / X
	public var scrollMargin = 10;
	
	public function new() {
		super();
		
		this.dragScroll = false;
		
		addEventListener(Event.ENTER_FRAME, onFrame);
	}
	
	private function onFrame(e:Event):Void {
		if (Dnd.current != null) {
			if (this.mouseX > 0 && this.mouseX < this.w) {
				if (this.mouseY > 0 && this.mouseY < (this.h / 10)) {
					this.scrollY += 8;
				} else if (this.mouseY > ((this.h / 10) * 9) && this.mouseY < this.h) {
					this.scrollY -= 8;
				}
			}
		}
	}
	
}