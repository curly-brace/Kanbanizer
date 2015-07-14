package widgets;

import flash.events.DataEvent;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import ru.stablex.Err;
import ru.stablex.ui.Dnd;
import ru.stablex.ui.events.DndEvent;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;

class GridBox extends Widget{
	public var itemWidth = 200;
	public var itemHeight = 150;
	
	public var minItemPadding = 10;

	public var leftPadding = 10;
	public var rightPadding = 20;
	
	private var curItemsPerRow = 0;
	private var curItemPadding = 0;
	private var curRows = 0;
	
	private var curDragPos = 0;
	
	private var dragShadow:Widget = null;
	
	public function new() {
		super();
		
		this.widthPt = 100;
		this.skinName = 'background';

		this.dragShadow = UIBuilder.create(Widget, {
			defaults: 'DragShadow'
		});
		this.dragShadow.mouseEnabled = false;

		this.addEventListener(DndEvent.RECEIVE, recieveingItem);
		this.addEventListener(DndEvent.RETURN, returningItem);
		this.addEventListener(Event.ENTER_FRAME, onFrame);
	}
	
	private function onFrame(e:Event):Void {
		if (this.mouseEnabled) {
			if (Dnd.current != null) {
				if (this.mouseX > 0 && this.mouseX < this.w && this.mouseY > 0 && this.mouseY < this.h) {
					var curRow = Math.floor(this.mouseY / (this.h / curRows));
					curDragPos = Math.floor(this.mouseX / (itemWidth + curItemPadding)) + 1;
					curDragPos = (curRow * curItemsPerRow) + curDragPos;
					if (curDragPos > this.numChildren) curDragPos = this.numChildren;
					
					this.addChildAt(this.dragShadow, (curDragPos == 0) ? 0 : curDragPos - 1);
					this.refresh();
				} else {
					if (this.dragShadow.parent == this) {
						this.removeChild(this.dragShadow);
						this.refresh();
					}
				}
			} else {
				if (this.dragShadow.parent == this) {
					this.removeChild(this.dragShadow);
					this.refresh();
				}
			}
		}
	}
	
	private function recieveingItem(e:DndEvent):Void {
		e.accept(this);
		this.addChildAt(e.obj, curDragPos - 1);
		if (this.dragShadow.parent != null) this.removeChild(this.dragShadow);
		this.refresh();
		cast(e.srcParent, GridBox).refresh();
	}
	
	private function returningItem(e:DndEvent):Void {
		if (this.dragShadow.parent != null) this.removeChild(this.dragShadow);
		this.refresh();
		cast(e.srcParent, GridBox).refresh();
	}
	
	override public function onResize():Void {
		super.onResize();
		
		rearrangeElements();
	}
	
	private function rearrangeElements() {
		if (this.w < itemWidth) return;
				
		if (this.numChildren == 0) {
			this.h = 64;
			this.wparent.as(Accordion).setHeight(this.h);
			return;
		}
		
		curItemsPerRow = Std.int(((this.w - leftPadding - rightPadding + minItemPadding) / (itemWidth + minItemPadding)));
		curItemPadding = Std.int(((this.w - leftPadding - rightPadding) - (curItemsPerRow * itemWidth)) / (curItemsPerRow -1));
		if (curItemsPerRow >= this.numChildren) curItemPadding = minItemPadding;
		
		var curX = leftPadding;
		var curY = 0;
		
		for (i in 0...this.numChildren) {
			var child:DisplayObject = this.getChildAt(i);
			
			if (child == null) continue;
			
            if (!Std.is(child, Widget)) {
				trace(child, this.numChildren, curDragPos);
                Err.trigger('GridBox should have children of type Widget!');
            }
			
			var w = cast(child, Widget);
			
			curRows = Math.floor(i / curItemsPerRow) + 1;
			curY = curRows * itemHeight;
			
			w.w = itemWidth;
			w.h = itemHeight;
			w.top = (curY - itemHeight) + (minItemPadding * curRows);
			w.left = curX;
			
			if (((i + 1) % curItemsPerRow) == 0) {
				curX = leftPadding;
			} else {
				curX += curItemPadding + itemWidth;
			}
		}
		
		this.h = curY + minItemPadding * (curRows + 1);
		if (this.mouseEnabled) this.wparent.as(Accordion).setHeight(this.h);
	}
	
	override public function refresh():Void {
		super.refresh();
		
		rearrangeElements();
	}
}