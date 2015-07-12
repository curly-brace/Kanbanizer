package theme.defaults;

import theme.Main;
import ru.stablex.ui.widgets.Slider in WSlider;
import ru.stablex.ui.skins.Paint;
import ru.stablex.ui.widgets.Widget;
import ru.stablex.ui.skins.Layer;

class Slider {

    static public function Default (w:Widget) : Void {
        var slider = cast(w, WSlider);
        slider.h = slider.w = 20;
        slider.slider.w = slider.slider.h = 20;
		
        var skin = new Paint();
        skin.color = Main.lightColor;
		skin.corners = [10];
        slider.slider.skin = skin;
    }
}