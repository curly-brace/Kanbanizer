package theme;
import ru.stablex.ui.Theme;

 class Main extends Theme {
	static public var FONT : String = '';
	 
    /**
    * This method will be automatically called after UIBuilder.init()
    * It's not required to define this method in theme.
    */
    static public function main () : Void {
		FONT = #if html5 'Roboto Regular' #else Main.getFontName('fonts/regular.ttf') #end;
        //do stuff on application start, if you need
    }
}