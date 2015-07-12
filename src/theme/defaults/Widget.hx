package theme.defaults;

import ru.stablex.ui.skins.Paint;
import theme.Main;
import ru.stablex.ui.UIBuilder;

class Widget {
	
	static public function Background(w:ru.stablex.ui.widgets.Widget):Void {
		w.skinName = 'background';
		w.widthPt = 100;
	}
	
    static public function HR (w:ru.stablex.ui.widgets.Widget) : Void {
        w.h = 1;
        w.widthPt = 100;
        w.skinName = 'hr';
    }

    static public function HRLight (w:ru.stablex.ui.widgets.Widget) : Void {
        UIBuilder.defaults.get('Widget').get('HR')(w);
        w.skin.as(Paint).color = 0xa9a9a9;
    }
	
	static public function Header(w:ru.stablex.ui.widgets.Widget):Void {
		w.skinName = 'header';
		w.widthPt = 100;
		w.h = 32;
	}
	
	static public function AccordionArrow(w:ru.stablex.ui.widgets.Widget):Void {
		w.skinName = 'bigArrowDown';
	}

}