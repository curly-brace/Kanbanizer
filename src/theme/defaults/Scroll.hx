package theme.defaults;

import theme.Main;
import ru.stablex.ui.skins.Layer;
import ru.stablex.ui.skins.Paint;
import ru.stablex.ui.widgets.Scroll in WScroll;
import ru.stablex.ui.events.ScrollEvent;
import ru.stablex.ui.events.WidgetEvent;
import ru.stablex.ui.widgets.Widget;

class Scroll {
	
    static public function Screeen (w:Widget) : Void {
        var scroll = cast(w, WScroll);
		
        scroll.widthPt      = 100;
        scroll.heightPt     = 100;
        scroll.hScroll      = false;
        scroll.hBar         = null;
        scroll.vBar.visible = false;
        scroll.vBar.w       = 8;
        scroll.vBar.right   = 2;
    }
}