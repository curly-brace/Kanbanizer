package theme.defaults;

import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Button in WButton;
import ru.stablex.ui.widgets.Widget;
import theme.Main;

class Button {
   static private var _defaultFn : Widget->Void = null;


    /**
    * Apply default section to widget
    *
    */
    static private inline function _applyDefault (btn:WButton) : Void {
        if( _defaultFn == null ){
            _defaultFn = UIBuilder.defaults.get('Button').get('Default');
        }
        _defaultFn(btn);
    }//function _applyDefault()
	
	static public function Default (w:Widget) : Void {
		var btn = cast(w, WButton);

		btn.w = 100;
		btn.h = 32;

		btn.onPress   = function(_) { btn.y ++; };
		btn.onRelease = function(_) { btn.y --; };

		btn.skinName = 'green';
		btn.skinHoveredName = 'yellow';
		btn.skinPressedName = 'rainbow';
	}
	
	//<Button defaults="'Special'" text="'I am so special!'"/>
	static public function Special (w:Widget) : Void {
		Default(w);

		var btn = cast(w, WButton);

		btn.skinName        = 'rainbow';
		btn.skinHoveredName = 'rainbow';
		btn.skinPressedName = 'rainbow';
	}
}