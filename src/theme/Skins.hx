package theme;

import ru.stablex.ui.misc.ColorUtils;
import ru.stablex.ui.skins.Gradient;
import ru.stablex.ui.skins.Slice3;

//<!-- make green button using skin from Rainbow theme -->
//<Button text="'i am button'" skinName="'green'" />

class Skins {
	
	static public function defaultButtonUp():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/button_up.png');
		return skin;
	}
	
	static public function defaultButtonOver():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/button_over.png');
		return skin;
	}
	
	static public function defaultButtonDown():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/button_down.png');
		return skin;
	}

	static public function redButtonUp():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/red_button_up.png');
		return skin;
	}
	
	static public function redButtonOver():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/red_button_over.png');
		return skin;
	}
	
	static public function redButtonDown():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/red_button_down.png');
		return skin;
	}
	
	static public function greenButtonUp():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/green_button_up.png');
		return skin;
	}
	
	static public function greenButtonOver():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/green_button_over.png');
		return skin;
	}
	
	static public function greenButtonDown():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/green_button_down.png');
		return skin;
	}
	
	static public function inputBack():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/input.png');
		return skin;
	}
	
	static public function background():Gradient {
		var skin = new Gradient();
		skin.colors = [ColorUtils.brighten(Main.darkColor, 0.1), Main.darkColor];
		return skin;
	}
	
	static public function accordion():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/accordion.png');
		return skin;
	}
}