package widgets;

import flash.events.Event;
import openfl.display.DisplayObject;
import openfl.events.MouseEvent;
import ru.stablex.Err;
import ru.stablex.ui.Dnd;
import ru.stablex.ui.events.DndEvent;
import ru.stablex.ui.events.WidgetEvent;
import ru.stablex.ui.layouts.Column;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Bmp;
import ru.stablex.ui.widgets.Box;
import ru.stablex.ui.widgets.Button;
import ru.stablex.ui.widgets.Text;
import ru.stablex.ui.widgets.VBox;
import ru.stablex.ui.widgets.Widget;
import theme.Main;

class Accordion extends VBox {
	public var header:Widget;
	public var icon:Widget;
	public var headerText:Text;
	public var addButton:Button;
	public var editButton:Button;
	public var removeButton:Button;
	
	private var curHeight = 300.0;
	
	public var text(default, set):String;

	function set_text(txt) {
		return headerText.text = txt;
	}
	
	private var opened = true;
	private var area:Widget;
	
    public function new () : Void {
        super();
		
		this.widthPt = 100;
		this.heightPt = 100;
		this.align = 'center,top';
		this.overflow = true;
		
		header = UIBuilder.create(Widget, {
			defaults: 'Header',
			layout: {
				var l = new Column();
				l.cols = [24, -1, 24, 24, 24];
				l.cellPadding = 4;
				l.paddingTop = 4;
				l.paddingBottom = 4;
				l.paddingLeft = 4;
				l.paddingRight = 12;
				l;
			},
			children : [
				icon = UIBuilder.create(Widget, {
					defaults: 'AccordionArrow',
				}),
				headerText = UIBuilder.create(Text, {
					text: 'accordion',
				}),
				addButton = UIBuilder.create(Button, {
					defaults: 'Add',
				}),
				editButton = UIBuilder.create(Button, {
					defaults: 'Edit',
				}),
				removeButton = UIBuilder.create(Button, {
					defaults: 'Remove',
				}),
			]
		});
		
		header.addEventListener(MouseEvent.CLICK, headerClick);
		addButton.addEventListener(MouseEvent.CLICK, addClick);
		editButton.addEventListener(MouseEvent.CLICK, editClick);
		removeButton.addEventListener(MouseEvent.CLICK, removeClick);
		
		addChild(header);
    }
	
	private function removeClick(e:MouseEvent):Void {
		e.stopPropagation();
		this.dispatchEvent(new AccordionEvent(AccordionEvent.REMOVE));
	}
	
	private function editClick(e:MouseEvent):Void {
		e.stopPropagation();
		this.dispatchEvent(new AccordionEvent(AccordionEvent.EDIT));
	}
	
	private function addClick(e:MouseEvent):Void {
		e.stopPropagation();
		this.dispatchEvent(new AccordionEvent(AccordionEvent.ADD));
	}
	
	private function headerClick(e:MouseEvent) {
		opened = !opened;

		if (area != null) {
			if (opened) {
				this.overflow = true;
				this.tween(.5, { h: this.curHeight }, 'Quad.easeInOut');
			} else {
				this.overflow = false;
				curHeight = this.h;
				this.tween(.5, { h: 32 }, 'Quad.easeInOut');
			}
		}
		
		setArrow(!opened);
	}
	
	public function setHeight(hh:Float) {
		this.h = hh + 32;
	}
	
	override public function onCreate():Void {
		super.onCreate();
		
		area = getArea();
		area.widthPt = 100;
		area.heightPt = 100;
	}
	
	private function getArea():Widget {
		if(this.numChildren == 1 || this.numChildren > 2){
            Err.trigger('Accordion must have ONE child!');
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
			icon.tween(0.5, { rotation: -90, top: 28 }, 'Quad.easeInOut');
		} else {
			icon.tween(0.5, { rotation: 0, top: 4 }, 'Quad.easeInOut');
		}
	}
}

class AccordionEvent extends WidgetEvent {
	static public inline var ADD = "accAdd";
    static public inline var EDIT = "accEdit";
    static public inline var REMOVE = "accRemove";
}