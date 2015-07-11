package widgets;

import openfl.display.DisplayObject;
import openfl.events.MouseEvent;
import ru.stablex.Err;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Bmp;
import ru.stablex.ui.widgets.Box;
import ru.stablex.ui.widgets.Button;
import ru.stablex.ui.widgets.VBox;
import ru.stablex.ui.widgets.Widget;

class Accordion extends VBox {
	public var header:Button;
	private var opened = true;
	private var area:Widget;
	
    public function new () : Void {
        super();
		
		this.widthPt = 100;
		this.heightPt = 100;
		this.paddingTop = 16;
		
		header = UIBuilder.create(Button, {
			skinName: 'accordion',
			skinHoveredName: 'accordion',
			skinPressedName: 'accordion',
			ico: {src: 'icons/accordion_arrow_down.png' },
			widthPt: 100,
			align: 'left,middle',
			paddingLeft: 12
		});
		
		header.addEventListener(MouseEvent.CLICK, headerClick);
		
		addChild(header);
    }
	
	override public function onCreate():Void {
		super.onCreate();

		
		this.refresh();
		
		area = getArea();
		area.refresh();
	}
	
	private function headerClick(e:MouseEvent) {
		opened = !opened;
		
		if (area != null) {
			if (opened) {
				area.heightPt = 100;
			} else {
				area.h = 1;
			}
			area.refresh();
		}
		
		setArrow(!opened);
	}
	
	private function getArea():Widget {
		if( this.numChildren == 0 ){
            Err.trigger('Accordion must have one child!');
            return null;
        }else{
            var child:DisplayObject = this.getChildAt(1);
            if( !Std.is(child, Widget) ){
                Err.trigger('Accordion should have instance of Widget!');
            }
            return cast(child, Widget);
        }
	}
	
	private function setArrow(side:Bool) {
		if (side) {
			header.ico.src = 'icons/accordion_arrow_side.png';
		} else {
			header.ico.src = 'icons/accordion_arrow_down.png';
		}
		header.ico.refresh();
	}
	
	override public function refresh () : Void {
        this.header.refresh();
        this.header.ico.refresh();

        super.refresh();
    }
}