package theme;
import ru.stablex.ui.Theme;

 class Main extends Theme {
	static public var mainFont:String;
	static public var condensedFont:String;

	static public var mainColor = 0x008cac;
	static public var darkColor = 0x002b3c;
	static public var lightColor = 0xafe5ef;
	static public var lightFont = 0xe4f7fa;
	static public var darkFont = 0x003e55;
	
    static public function main () : Void {
		mainFont = #if html5 'Roboto' #else Main.getFontName('fonts/Roboto-Regular.ttf') #end;
        condensedFont = #if html5 'Roboto Condensed' #else Main.getFontName('fonts/RobotoCondensed-Regular.ttf') #end;
    }
}