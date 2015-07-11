package theme.defaults;

import ru.stablex.ui.UIBuilder;
import theme.Main;
import ru.stablex.ui.widgets.InputText in WInputText;
import ru.stablex.ui.widgets.Widget;



class InputText {




    static public function Default (w:Widget) : Void {
        var txt = cast(w, WInputText);

		txt.h = 32;
		txt.paddingLeft = 8;
		txt.paddingTop = 4;
        txt.format.font = Main.mainFont;
        txt.format.size = 16;
        txt.format.color = Main.lightFont;
        txt.label.embedFonts = true;
		txt.skinName = 'inputBack';
    }


}