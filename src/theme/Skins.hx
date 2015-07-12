package theme;

import ru.stablex.ui.misc.ColorUtils;
import ru.stablex.ui.skins.Gradient;
import ru.stablex.ui.skins.Img;
import ru.stablex.ui.skins.Slice3;

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
	
	static public function header():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/header.png');
		return skin;
	}
	
	static public function arrowSide():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/arrow_side.png');
		return skin;
	}
	
	static public function arrowDown():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/arrow_down.png');
		return skin;
	}
	
	static public function bigArrowDown():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/big_arrow_down.png');
		return skin;
	}
	
	static public function smallButtonUp():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/small_up.png');
		return skin;
	}
	
	static public function smallButtonOver():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/small_over.png');
		return skin;
	}
	
	static public function smallButtonDown():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/small_down.png');
		return skin;
	}
}