package theme.defaults;

import openfl.text.AntiAliasType;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Button in WButton;
import ru.stablex.ui.widgets.Widget;
import theme.Main;

class Button {
	
	static public function Default(w:Widget) {
		var btn = cast(w, WButton);

		btn.w = 100;
		btn.h = 32;
		
		btn.label.embedFonts = true;
		btn.format.size = 14;
        btn.format.color = Main.lightFont;
        btn.format.font = Main.mainFont;
		
		
		btn.skinName = 'defaultButtonUp';
		btn.skinHoveredName = 'defaultButtonOver';
		btn.skinPressedName = 'defaultButtonDown';
	}
	
	static public function Green(w:Widget) {
		Default(w);

		var btn = cast(w, WButton);

		btn.skinName = 'greenButtonUp';
		btn.skinHoveredName = 'greenButtonOver';
		btn.skinPressedName = 'greenButtonDown';
	}

	static public function Red(w:Widget) {
		Default(w);

		var btn = cast(w, WButton);

		btn.skinName = 'redButtonUp';
		btn.skinHoveredName = 'redButtonOver';
		btn.skinPressedName = 'redButtonDown';
	}
}