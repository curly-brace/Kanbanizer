package theme;

import ru.stablex.ui.skins.Paint;

//<!-- make green button using skin from Rainbow theme -->
//<Button text="'i am button'" skinName="'green'" />

class Skins {
	// helper method
	static public function colorSkin (color:Int) : Paint {
		var skin   = new Paint();
		skin.color = color;
		skin.corners = [5];
		return skin;
	}

	//static public function rainbow () : Img {
	static public function rainbow () : Paint {
		//var skin = new Img();
		//skin.scaleImg = true;
		/**
		* :NOTICE:
		*   To get resources of your theme (images, fonts, etc) use `Main.getBitmapData()`, `Main.getFont()` etc.
		*   Where `Main` - is the main class of your theme.
		*/
		//skin.src = Main.getBitmapData('assets/rainbow.png'); //This is `assets` folder of your theme, not your project.
		//return skin;
		
		return colorSkin(0x52C2ED);
	}

	static public function red () : Paint {
		return colorSkin(0xFF0000);
	}

	static public function orange () : Paint {
		return colorSkin(0xFF7F00);
	}

	static public function yellow () : Paint {
		return colorSkin(0xFFFF00);
	}

	static public function green () : Paint {
		return colorSkin(0x00FF00);
	}

	static public function blue () : Paint {
		return colorSkin(0x0000FF);
	}

	static public function indigo () : Paint {
		return colorSkin(0x4B0082);
	}

	static public function violet () : Paint {
		return colorSkin(0x8B00FF);
	}
}