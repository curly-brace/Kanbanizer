package theme.defaults;

import ru.stablex.ui.UIBuilder;
import theme.Main;
import ru.stablex.ui.widgets.Text in WText;
import ru.stablex.ui.widgets.Widget;

class Text {

    static public function Default (w:Widget) : Void {
        var txt = cast(w, WText);

        txt.format.font      = Main.mainFont;
        txt.format.size      = 14;
        txt.format.color     = Main.lightFont;
        txt.label.selectable = false;
        txt.label.embedFonts = true;
    }
	
	static public function Condensed (w:Widget) : Void {
		Default(w);
		
		var txt = cast(w, WText);
		
		txt.format.font = Main.condensedFont;
        txt.format.size = 12;
		txt.format.bold = true;

	}
}