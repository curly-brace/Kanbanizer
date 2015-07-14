package theme.defaults;

import theme.Main;
import ru.stablex.ui.widgets.Progress in WProgress;
import ru.stablex.ui.widgets.Widget;

class Progress {

    static public function Default (w:Widget) : Void {
        var progress = cast(w, WProgress);
        progress.h = 10;
        progress.w = 100;
        progress.skinName     = 'progressBg';
        progress.bar.skinName = 'progressFg';
    }

}