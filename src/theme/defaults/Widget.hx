package theme.defaults;

import ru.stablex.ui.skins.Paint;
import theme.Main;
import ru.stablex.ui.UIBuilder;

class Widget {
	//<Widget defaults="'HRLight'" />
	//<Widget h="5" />
	
    static public function HR (w:ru.stablex.ui.widgets.Widget) : Void {
        w.h = 1;
        w.widthPt = 100;
        w.skinName = 'hr';
    }

    static public function HRLight (w:ru.stablex.ui.widgets.Widget) : Void {
        UIBuilder.defaults.get('Widget').get('HR')(w);
        w.skin.as(Paint).color = 0xa9a9a9;
    }

}