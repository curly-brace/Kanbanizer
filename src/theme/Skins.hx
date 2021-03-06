package theme;

import ru.stablex.ui.misc.ColorUtils;
import ru.stablex.ui.skins.Gradient;
import ru.stablex.ui.skins.Img;
import ru.stablex.ui.skins.Layer;
import ru.stablex.ui.skins.Paint;
import ru.stablex.ui.skins.Slice3;
import ru.stablex.ui.skins.Slice9;

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
	
	static public function dragShadow():Paint {
		var skin = new Paint();
		skin.color = ColorUtils.darken(Main.darkColor, 0.1);
		skin.borderColor = ColorUtils.brighten(Main.darkColor, 0.1);
		skin.border = 2;
		skin.corners = [20];
		return skin;
	}
	
	static public function slice9Header():Slice9 {
		var skin = new Slice9();
		skin.bitmapData = Main.getBitmapData('img/slice9_header.png');
		skin.slice = [10, 22, 16, 22];
		
		return skin;
	}
	
	static public function slice9Panel():Layer {
		var skin = new Layer();
		 
		skin.current = new Paint();
        skin.current.as(Paint).color = 0xC0C0C0;
        skin.current.as(Paint).paddingTop = 0;
		skin.current.as(Paint).paddingLeft = 2;
		skin.current.as(Paint).paddingRight = 2;
		skin.current.as(Paint).paddingBottom = 2;
		
		skin.behind = new Slice9();
		skin.behind.as(Slice9).bitmapData = Main.getBitmapData('img/slice9_panel.png');
		skin.behind.as(Slice9).slice = [10, 22, 10, 22];
		
		return skin;
	}
	
	static public function cardsIcon():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/cards.png');
		return skin;
	}
	
	static public function listsIcon():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/lists.png');
		return skin;
	}
	
	static public function createdOnIcon():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/created.png');
		return skin;
	}
	
	static public function ageIcon():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/age.png');
		return skin;
	}
	
	static public function timeSpentIcon():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/time_spent.png');
		return skin;
	}
	
	static public function lastActivityIcon():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/last_activity.png');
		return skin;
	}
	
	static public function progressBg():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/progress_bg.png');
		return skin;
	}
	
	static public function progressFg():Slice3 {
		var skin = new Slice3();
		skin.bitmapData = Main.getBitmapData('img/progress_fg.png');
		return skin;
	}
	
	static public function infoIcon():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/info.png');
		return skin;
	}
	
	static public function alertIcon():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/ico/alert.png');
		return skin;
	}
	
	static public function popupMenu():Slice9 {
		var skin = new Slice9();
		skin.bitmapData = Main.getBitmapData('img/menu.png');
		skin.slice = [16, 32, 16, 32];
		return skin;
	}
	
	static public function popupUp():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/popup_up.png');
		skin.scaleImg = true;
		return skin;
	}
	
	static public function popupOver():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/popup_over.png');
		skin.scaleImg = true;
		return skin;
	}
	
	static public function popupDown():Img {
		var skin = new Img();
		skin.bitmapData = Main.getBitmapData('img/popup_down.png');
		skin.scaleImg = true;
		return skin;
	}
}