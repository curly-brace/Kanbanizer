package widgets;

import openfl.display.DisplayObject;
import openfl.events.MouseEvent;
import openfl.Lib;
import ru.stablex.ui.widgets.Widget;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Button;
import ru.stablex.ui.widgets.Floating;
import ru.stablex.ui.widgets.VBox;

class PopupMenu extends Floating{
	private var box:VBox;
	
	public var handler:Int->Void;
	
	public function new() {
		super();
		
		addChild(box = UIBuilder.create(VBox, {
			skinName: 'popupMenu', 
			widthPt: 100,
			heightPt: 100,
			paddingTop: 2,
			paddingBottom: 4,
			paddingLeft: 14,
			paddingRight: 18
		}));
	}
	
	public override function show() {
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, stageClicked);
		super.show();
	}
	
	private function stageClicked(e:MouseEvent):Void {
		var obj : DisplayObject = e.target;
		
        while( obj != null ){
            if( obj == this || obj == this.box ) return;
            obj = obj.parent;
        }
		
		doHide( -1);
	}
	
	private function doHide(res) {
		Lib.current.stage.removeEventListener(MouseEvent.MOUSE_DOWN, stageClicked);
		
		if (handler != null) handler(res);
		this.hide();
	}
	
	public function setItems(items:Array<String>) {
		for (i in 0...box.numChildren) {
			var item:Button = cast(box.getChildAt(i), Button);
			if (item == null) continue;
			
			item.free();
		}
		var btn:Button;
		for (i in 0...items.length) {
			box.addChild(btn = UIBuilder.create(Button, {
				widthPt: 100,
				h: 24,
				label: { embedFonts: true },
				format: {
					size: 14,
					bold: true,
					color: theme.Main.lightFont,
					font: theme.Main.mainFont
				},
				skinName: 'popupUp',
				skinHoveredName: 'popupOver',
				skinPressedName: 'popupDown',
				text: items[i],
			}));
			btn.addEventListener(MouseEvent.CLICK, function(_) { doHide(i); } );
		}
		
		this.h = items.length * 24 + 30;

		//this.w = cast(box.getChildAt(0), Button).w + 4;
		
	}
	

}