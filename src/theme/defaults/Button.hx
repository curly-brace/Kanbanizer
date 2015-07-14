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
	
	static public function AddGroup(w:Widget) {
		Default(w);
		var btn = cast(w, WButton);
		btn.ico.bitmapData = Main.getBitmapData('img/ico/add_group.png');
	}

	
	static public function Calendar(w:Widget) {
		Default(w);
		var btn = cast(w, WButton);
		btn.ico.bitmapData = Main.getBitmapData('img/ico/calendar.png');
	}

	
	static public function Trash(w:Widget) {
		Default(w);
		var btn = cast(w, WButton);
		btn.ico.bitmapData = Main.getBitmapData('img/ico/trash.png');
	}

	
	static public function Menu(w:Widget) {
		Default(w);
		var btn = cast(w, WButton);
		btn.ico.bitmapData = Main.getBitmapData('img/ico/menu.png');
		btn.w = 32;
		btn.paddingLeft = 11;
	}
	
	static public function SmallButton(w:Widget) {
		var btn = cast(w, WButton);
		
		btn.w = 24;
		btn.h = 24;
		btn.paddingLeft = 11;
		
		btn.skinName = 'smallButtonUp';
		btn.skinHoveredName = 'smallButtonOver';
		btn.skinPressedName = 'smallButtonDown';
	}
	
	static public function SmallMenu(w:Widget) {
		SmallButton(w);
		var btn = cast(w, WButton);
		btn.ico.bitmapData = Main.getBitmapData('img/ico/menu.png');
		btn.paddingLeft = 11;
	}
	
	static public function Add(w:Widget) {
		SmallButton(w);
		var btn = cast(w, WButton);

		btn.ico.bitmapData = Main.getBitmapData('img/ico/add.png');
	}
	
	static public function Remove(w:Widget) {
		SmallButton(w);
		var btn = cast(w, WButton);

		btn.ico.bitmapData = Main.getBitmapData('img/ico/remove.png');
	}
	
	static public function Edit(w:Widget) {
		SmallButton(w);
		var btn = cast(w, WButton);

		btn.ico.bitmapData = Main.getBitmapData('img/ico/edit.png');
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