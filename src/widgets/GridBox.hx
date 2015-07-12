package widgets;

import openfl.display.DisplayObject;
import ru.stablex.Err;
import ru.stablex.ui.widgets.Widget;

class GridBox extends Widget{
	public var itemWidth = 100;
	public var itemHeight = 100;
	
	public var minItemPadding = 10;

	public var leftPadding = 10;
	public var rightPadding = 20;
	
	private var rows:Array<Widget>;
	
	public function new() {
		super();
		
		this.widthPt = 100;
		this.skinName = 'background';
	}
	
	override public function onResize():Void {
		super.onResize();
		
		rearrangeElements();
	}
	
	private function rearrangeElements() {
		if (this.w < itemWidth) return;
		
		var itemsPerRow:Int = Std.int(((this.w - leftPadding - rightPadding + minItemPadding) / (itemWidth + minItemPadding)));
		var itemPadding:Int = Std.int(((this.w - leftPadding - rightPadding) - (itemsPerRow * itemWidth)) / (itemsPerRow -1));
		if (itemsPerRow >= this.numChildren) itemPadding = minItemPadding;
		
		var curRow = 0;
		var curX = leftPadding;
		var curY = 0;
		
		for (i in 0...this.numChildren) {
			var child:DisplayObject = this.getChildAt(i);
			
            if( !Std.is(child, Widget) ){
                Err.trigger('GridBox should have children of type Widget!');
            }
			
			var w = cast(child, Widget);
			
			curRow = Math.floor(i / itemsPerRow) + 1;
			curY = curRow * itemHeight;
			
			w.w = itemWidth;
			w.h = itemHeight;
			w.top = (curY - itemHeight) + (minItemPadding * curRow);
			w.left = curX;
			
			if (((i + 1) % itemsPerRow) == 0) {
				curX = leftPadding;
			} else {
				curX += itemPadding + itemWidth;
			}
		}
		
		this.h = curY + minItemPadding * (curRow + 1);
		this.wparent.as(Accordion).setHeight(this.h);
	}
	
}